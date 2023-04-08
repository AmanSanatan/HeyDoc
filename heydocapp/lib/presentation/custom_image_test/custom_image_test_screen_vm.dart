import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/domain/usecase/get_user_usecase.dart';
import 'package:heydocapp/domain/usecase/post_pic_firebase_usecase.dart';
import 'package:heydocapp/main.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/usecase/run_model_usecase.dart';

final customImageTestScreenVMProvider = ChangeNotifierProvider((ref) =>
    CustomImageTestScreenVM(
        ref.watch(navigatorKeyProvider),
        ref.watch(postPicFirebaseUseCaseProvider),
        ref.watch(getUserUseCaseProvider),
        ref.watch(runModelUseCaseProvider)));

class CustomImageTestScreenVM extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey;
  final PostPicFirebaseUsecase postPicFirebaseUsecase;
  final GetUserUsecase getUserUsecase;
  final RunModelUseCase _runModelUsecase;
  CustomImageTestScreenVM(this.navigatorKey, this.postPicFirebaseUsecase,
      this.getUserUsecase, this._runModelUsecase);

  bool isLoading = false;
  String? spiralImageUrl;
  String? waveImageUrl;
  String? outputText;
  void toggleLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void pickSpiralImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }
    await _uploadSpiralImage(image);
  }

  Future _uploadSpiralImage(XFile image) async {
    toggleLoadingState();
    final user = await getUserUsecase.getUser();
    spiralImageUrl = await postPicFirebaseUsecase.postPic(
        File(image.path), user?.uid, PictureType.spiral);
    toggleLoadingState();
  }

  void pickWaveImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }
    await _uploadWaveImage(image);
  }

  Future _uploadWaveImage(XFile image) async {
    toggleLoadingState();
    final user = await getUserUsecase.getUser();
    waveImageUrl = await postPicFirebaseUsecase.postPic(
        File(image.path), user?.uid, PictureType.wave);
    toggleLoadingState();
  }

  Future runModel() async {
    toggleLoadingState();
    final user = await getUserUsecase.getUser();
    if (spiralImageUrl == null || waveImageUrl == null || user == null) {
      return;
    }
    final result = await _runModelUsecase.runModel(
        spiralImageUrl!, waveImageUrl!, user.uid);
    if (result == 1) {
      outputText = 'YOU ARE ADVISED TO SEE A DOCTOR IMMEDEATLY';
    } else if (result == 0) {
      outputText =
          'If you are observing other parkinson symptoms , then we recommend you to see a doctor';
    }
    print('aapko itna parkinson hain : $result');
    toggleLoadingState();
  }
}
