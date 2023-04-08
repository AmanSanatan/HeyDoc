import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/main.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/models/patient_model.dart';
import '../../domain/usecase/get_user_usecase.dart';
import '../../domain/usecase/httpget_patient_usecase.dart';
import '../../domain/usecase/httpput_patient_usecase.dart';
import '../../domain/usecase/logout_usecase.dart';
import '../../domain/usecase/post_pic_firebase_usecase.dart';

final patientProfileVMProvider = Provider((ref) => PatientProfileVM(
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
  Codec<String, String> stringToBase64 = utf8.fuse(base64);

  void logout() {
    _logoutUsecase.logout();
  }

  void toggleLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future getPatient() async {
    toggleLoadingState();
    final user = await _getUserUsecase.getUser();
    patientModel = await _getPatientUsecase.getPatient(user!.uid);
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
}
