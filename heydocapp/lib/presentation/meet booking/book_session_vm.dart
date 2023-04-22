import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/main.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../domain/models/booking_model.dart';
import '../../domain/models/clinic_model.dart';
import '../../domain/usecase/get_user_usecase.dart';
import '../../domain/usecase/http_usecase/httppost/httppost_new_booking_usecase.dart';

final bookSessionVMProvider = ChangeNotifierProvider((ref) => BookSessionVM(
    ref.watch(navigatorKeyProvider),
    ref.watch(scaffoldMessengerKeyProvider),
    ref.watch(getUserUseCaseProvider),
    ref.watch(postNewBookingUseCaseProvider)));

class BookSessionVM extends ChangeNotifier {
  BookSessionVM(
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this._getUserUsecase,
    this._postNewBookingUseCase,
  );
  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final GetUserUsecase _getUserUsecase;
  late ClinicModel clinicModel;
  final PostNewBookingUseCase _postNewBookingUseCase;

  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  String bookingDate = DateFormat('yMMMd').format(DateTime.now());
  String bookingTime = DateFormat('jm').format(DateTime.now());
  String finalMeetLink = '';
  bool isTimeInPast = false;
  bool isLoading = false;
  User? user;

  List<String> durationList = [
    '15 minutes',
    '30 minutes',
    '1 hour',
    '1 hour 30 minutes',
    '2 hours',
    '2 hours 30 minutes',
    '3 hours',
    '3 hours 30 minutes'
  ];

  void toggleLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }

  String fetchScheduledMeetingUrl(
      String date, String time, String paitentId, String doctorId) {
    String meetingCredentials = '$date-$time-$paitentId-$doctorId';
    String encodedMeetingCredentials =
        stringToBase64.encode(meetingCredentials);
    return 'meet.jit.si/$encodedMeetingCredentials';
  }

  bool checkIfTimeInPast(TimeOfDay timeOfDay) {
    double toDouble(TimeOfDay timeOfDay) =>
        timeOfDay.hour + timeOfDay.minute / 60.0 - 0.5;
    if (toDouble(timeOfDay) < toDouble(TimeOfDay.now())) {
      return true;
    } else {
      return false;
    }
  }

  void onSelectDate(DateTime? selectedDate) async {
    if (selectedDate != null) {
      bookingDate = DateFormat('yMMMd').format(selectedDate);
      notifyListeners();
    }
  }

  void onSelectTime(TimeOfDay? selectedTime) async {
    if (selectedTime != null) {
      bookingTime = DateFormat('jm').format(timeOfDayToDateTime(selectedTime));
      isTimeInPast = checkIfTimeInPast(selectedTime);
      if (isTimeInPast) {
        // bookingTime = DateFormat('jm').format(getNextStartTime());
        scaffoldMessengerKey.currentState?.showSnackBar(const SnackBar(
            content:
                Text('Please select time at least 30 minutes from present')));
      }
      notifyListeners();
    }
  }

  DateTime timeOfDayToDateTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  TimeOfDay stringToTimeOfDay(String time) {
    int hh = 0;
    if (time.endsWith('PM')) hh = 12;
    time = time.split(' ')[0];
    return TimeOfDay(
      hour: hh +
          int.parse(time.split(":")[0]) %
              24, // in case of a bad time format entered manually by the user
      minute: int.parse(time.split(":")[1]) % 60,
    );
  }

  DateTime diffStringToDateTime(String date, String time) {
    DateTime meetingDate = DateFormat('yMMMd').parse(date);
    DateTime meetingTime = DateFormat('jm').parse(time);

    DateTime meetingDateTime = DateTime(meetingDate.year, meetingDate.month,
        meetingDate.day, meetingTime.hour, meetingTime.minute);
    return meetingDateTime;
  }

  void makePayment() async {
    if (checkIfTimeInPast(stringToTimeOfDay(bookingTime))) {
      scaffoldMessengerKey.currentState?.showSnackBar(const SnackBar(
          content:
              Text('Please select time at least 30 minutes from present')));
      return;
    }
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();
    if (statuses[Permission.camera] != PermissionStatus.granted &&
        statuses[Permission.microphone] != PermissionStatus.granted) {
      scaffoldMessengerKey.currentState?.showSnackBar(const SnackBar(
          content: Text('Please grant camera and microphone permission')));
      return;
    }

    user = await _getUserUsecase.getUser();
    if (user == null) {
      scaffoldMessengerKey.currentState
          ?.showSnackBar(const SnackBar(content: Text('some error occured')));
      return;
    }

    final razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentFaliure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    var options = {
      'key': 'rzp_test_UuklICOwK0rFvs',
      'amount': int.parse(clinicModel.price) * 100,
      'name': user!.displayName ?? user!.email,
      'description': 'Session Booking for doctor ${clinicModel.doctorUid}',
      'prefill': {'email': user!.email},
    };
    razorpay.open(options);
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    createMeetLink();
  }

  Future createMeetLink() async {
    toggleLoadingState();
    String meetingLinkScheduled = fetchScheduledMeetingUrl(
        bookingDate, bookingTime, user!.uid, clinicModel.doctorUid);
    print('meeting Link : $meetingLinkScheduled');
    finalMeetLink = meetingLinkScheduled;
    await uploadNewBooking(user!.displayName ?? 'username', user!.uid);
    toggleLoadingState();
    navigatorKey.currentState?.pop();
  }

  Future uploadNewBooking(String patientName, String uid) async {
    final newBooking = BookingModel(
        date: bookingDate,
        time: bookingTime,
        meetLink: finalMeetLink,
        patientName: patientName,
        doctorName: clinicModel.doctorName,
        doctorId: clinicModel.doctorUid,
        clinicName: clinicModel.clinicName,
        patientId: uid,
        cost: clinicModel.price);
    await _postNewBookingUseCase.postNewBooking(newBooking);
  }

  void handlePaymentFaliure(PaymentFailureResponse response) {
    scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text(response.message ?? 'some error occured')));
  }

  void handleExternalWallet(ExternalWalletResponse response) {}
}
