import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/domain/usecase/get_user_usecase.dart';
import 'package:heydocapp/domain/usecase/post_pic_firebase_usecase.dart';
import 'package:heydocapp/main.dart';
import 'package:heydocapp/presentation/custom_image_test/cusotm_result_screen.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/usecase/run_model_usecase.dart';

final customImageTestScreenVMProvider = ChangeNotifierProvider.autoDispose(
    (ref) => CustomImageTestScreenVM(
        ref.watch(navigatorKeyProvider),
        ref.watch(postPicFirebaseUseCaseProvider),
        ref.watch(getUserUseCaseProvider),
        ref.watch(runModelUseCaseProvider),
        ref.watch(scaffoldMessengerKeyProvider)));

class CustomImageTestScreenVM extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final PostPicFirebaseUsecase postPicFirebaseUsecase;
  final GetUserUsecase getUserUsecase;
  final RunModelUseCase _runModelUsecase;
  CustomImageTestScreenVM(this.navigatorKey, this.postPicFirebaseUsecase,
      this.getUserUsecase, this._runModelUsecase, this.scaffoldMessengerKey);

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
      toggleLoadingState();
      scaffoldMessengerKey.currentState
          ?.showSnackBar(const SnackBar(content: Text('please upload images')));
      return;
    }
    final result = await _runModelUsecase.runModel(
        spiralImageUrl!, waveImageUrl!, user.uid);

    if (result == 2) {
      outputText = 'YOU ARE ADVISED TO SEE A DOCTOR IMMEDEATLY';
    } else if (result == 1) {
      outputText =
          'You seem to be fit. Still, if you are observing other parkinson symptoms , then we recommend you to see a doctor';
    } else {
      outputText = 'You are healthy according to our tests!';
    }
    navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (BuildContext context) {
      return CustomResultScreen(
        outputText: outputText ?? "Some error occured",
      );
    }));
    print('aapko itna parkinson hain : $result');
    toggleLoadingState();
  }
}
