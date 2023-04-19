import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/domain/models/doctor_model.dart';
import 'package:heydocapp/domain/usecase/get_user_usecase.dart';
import 'package:heydocapp/domain/usecase/post_pic_firebase_usecase.dart';
import 'package:heydocapp/main.dart';
import 'package:intl/intl.dart';

import '../../../domain/usecase/http_usecase/httpget/httpget_doctor_usecase.dart';
import '../../../domain/usecase/http_usecase/httpput/httpput_doctor_usecase.dart';
import '../../meets/webview.dart';

final doctorHomeScreenVMProvider = ChangeNotifierProvider((ref) =>
    DoctorHomeScreenVM(
        ref.watch(getUserUseCaseProvider),
        ref.watch(postPicFirebaseUseCaseProvider),
        ref.watch(getDoctorUsecaseProvider),
        ref.watch(putDoctorUseCaseprovider),
        ref.watch(navigatorKeyProvider),
        ref.watch(scaffoldMessengerKeyProvider)));

class DoctorHomeScreenVM extends ChangeNotifier {
  final GetUserUsecase _getUserUsecase;
  final PostPicFirebaseUsecase _postPicFirebaseUsecase;
  final GetDoctorUsecase _getDoctorUsecase;
  final PutDoctorUsecase _putDoctorUsecase;
  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  DoctorHomeScreenVM(
      this._getUserUsecase,
      this._postPicFirebaseUsecase,
      this._getDoctorUsecase,
      this._putDoctorUsecase,
      this.navigatorKey,
      this.scaffoldMessengerKey) {
    getDoctor();
  }

  DoctorModel? doctorModel;
  bool isLoading = false;
  void toggleLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future getDoctor() async {
    toggleLoadingState();
    final user = await _getUserUsecase.getUser();
    doctorModel = await _getDoctorUsecase.getDoctor(user!.uid);
    print(doctorModel.toString());
    toggleLoadingState();
  }

  void startMeet(int index) {
    bool tooEarly = checkIfJoinMeetingTooEarly(
        doctorModel!.bookings![index].date, doctorModel!.bookings![index].time);
    if (tooEarly) {
      scaffoldMessengerKey.currentState?.showSnackBar(const SnackBar(
          content:
              Text('Please join atleast 5 minutes before scheduled time')));
    } else {
      navigatorKey.currentState
          ?.push(MaterialPageRoute(builder: (BuildContext context) {
        return MeetingWebView(
            meetingUrl: doctorModel!.bookings![index].meetLink);
      }));
    }
  }

  bool checkIfJoinMeetingTooEarly(String date, String time) {
    DateTime meetingDate = DateFormat('yMMMd').parse(date);
    DateTime meetingTime = DateFormat('jm').parse(time);

    DateTime meetingDateTime = DateTime(meetingDate.year, meetingDate.month,
        meetingDate.day, meetingTime.hour, meetingTime.minute);

    DateTime currentTime = DateTime.now();
    final diffMinutes = currentTime.difference(meetingDateTime).inMinutes;

    if (diffMinutes > -5) {
      return false;
    } else {
      print('jyaada tez ho rhe ho');
      return true;
    }
  }
}
