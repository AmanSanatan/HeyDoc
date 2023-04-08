import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/domain/usecase/httppost_doctor_usecase.dart';
import 'package:heydocapp/main.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/models/doctor_model.dart';
import '../../../domain/models/patient_model.dart';
import '../../../domain/usecase/post_pic_firebase_usecase.dart';
import '../doctor_home/doctor_home_screen.dart';

final doctorRegisterScreenVMProvider = ChangeNotifierProvider((ref) =>
    DoctorRegisterScreenVM(
        ref.read(postDoctorUseCaseProvider),
        ref.read(navigatorKeyProvider),
        ref.read(postPicFirebaseUseCaseProvider)));

class DoctorRegisterScreenVM extends ChangeNotifier {
  final GlobalKey<NavigatorState> _navigatorKey;
  final PostDoctorUsecase _postDoctorUsecase;
  final PostPicFirebaseUsecase _postPicFirebaseUsecase;
  DoctorRegisterScreenVM(this._postDoctorUsecase, this._navigatorKey,
      this._postPicFirebaseUsecase);

  bool isLoading = false;
  late String doctorImageUrl;
  late String clinicImageUrl;
  late PatientModel patientModel;

  void toggleLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void postDoctor(DoctorModel doctorModel) async {
    toggleLoadingState();
    await _postDoctorUsecase.postDoctor(doctorModel);
    toggleLoadingState();
    _navigatorKey.currentState
        ?.pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return const DoctorHomeScreen();
    }));
  }

  void pickDoctorImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }
    await uploadDoctorImage(image);
  }

  Future uploadDoctorImage(XFile image) async {
    toggleLoadingState();
    doctorImageUrl = await _postPicFirebaseUsecase.postPic(
        File(image.path), patientModel.uid, PictureType.doctorImage);
    toggleLoadingState();
  }

  void pickClinicImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }
    await uploadClinicImage(image);
  }

  Future uploadClinicImage(XFile image) async {
    toggleLoadingState();
    clinicImageUrl = await _postPicFirebaseUsecase.postPic(
        File(image.path), patientModel.uid, PictureType.clinicImage);
    toggleLoadingState();
  }
}
