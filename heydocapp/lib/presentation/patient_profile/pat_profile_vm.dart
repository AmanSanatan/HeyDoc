import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/main.dart';
import 'package:heydocapp/presentation/login/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../domain/models/patient_model.dart';
import '../../domain/usecase/get_user_usecase.dart';
import '../../domain/usecase/http_usecase/httpget/httpget_patient_usecase.dart';
import '../../domain/usecase/http_usecase/httpput/httpput_patient_usecase.dart';
import '../../domain/usecase/logout_usecase.dart';
import '../../domain/usecase/post_pic_firebase_usecase.dart';
import '../doctor_mode/doctor_home/doctor_home_screen.dart';
import '../doctor_mode/doctor_register/doctor_register_screen.dart';
import '../meets/webview.dart';

final patientProfileVMProvider = ChangeNotifierProvider((ref) =>
    PatientProfileVM(
        ref.watch(logoutUseCaseProvider),
        ref.watch(getUserUseCaseProvider),
        ref.watch(postPicFirebaseUseCaseProvider),
        ref.watch(putPatientUseCaseProvider),
        ref.watch(getPatientUseCaseProvider),
        ref.watch(navigatorKeyProvider),
        ref.watch(scaffoldMessengerKeyProvider)));

class PatientProfileVM extends ChangeNotifier {
  final LogoutUsecase _logoutUsecase;
  final GetUserUsecase _getUserUsecase;
  final PostPicFirebaseUsecase _postPicFirebaseUsecase;
  final PutPatientUsecase _putPatientUsecase;
  final GetPatientUsecase _getPatientUsecase;
  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  PatientProfileVM(
    this._logoutUsecase,
    this._getUserUsecase,
    this._postPicFirebaseUsecase,
    this._putPatientUsecase,
    this._getPatientUsecase,
    this.navigatorKey,
    this.scaffoldMessengerKey,
  ) {
    getPatient();
  }

  PatientModel? patientModel;
  bool isLoading = false;

  void logout() {
    _logoutUsecase.logout();
    navigatorKey.currentState
        ?.pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return const LoginScreen();
    }));
  }

  void toggleLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future getPatient() async {
    toggleLoadingState();
    final user = await _getUserUsecase.getUser();
    patientModel = await _getPatientUsecase.getPatient(user!.uid);
    print(patientModel.toString());
    print(patientModel?.bookings?[0].time.split(' ')[0] ?? "12:00");
    toggleLoadingState();
  }

  void pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }
    await uploadImage(image);
  }

  Future uploadImage(XFile image) async {
    toggleLoadingState();
    final user = await _getUserUsecase.getUser();
    final newImageUrl = await _postPicFirebaseUsecase.postPic(
        File(image.path), user!.uid, PictureType.patientImage);
    toggleLoadingState();
    await updatePatient(newImageUrl);
  }

  Future updatePatient(String newImageUrl) async {
    toggleLoadingState();
    if (patientModel != null) {
      patientModel!.pictureLink = newImageUrl;
      await _putPatientUsecase.putPatient(patientModel!);
    }
    toggleLoadingState();
    getPatient();
  }

  void becomeDoctor() {
    navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (BuildContext context) {
      return DoctorRegisterScreen(patientModel!);
    }));
  }

  void openDoctorHome() {
    navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (BuildContext context) {
      return const DoctorHomeScreen();
    }));
  }

  void startMeet(int index) {
    bool tooEarly = checkIfJoinMeetingTooEarly(
        patientModel!.bookings![index].date,
        patientModel!.bookings![index].time);
    if (tooEarly) {
      scaffoldMessengerKey.currentState?.showSnackBar(const SnackBar(
          content:
              Text('Please join atleast 5 minutes before scheduled time')));
    } else {
      navigatorKey.currentState
          ?.push(MaterialPageRoute(builder: (BuildContext context) {
        return MeetingWebView(
            meetingUrl: patientModel!.bookings![index].meetLink);
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
