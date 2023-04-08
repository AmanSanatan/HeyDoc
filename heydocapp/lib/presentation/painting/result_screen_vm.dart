import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/presentation/painting/saved_images.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/usecase/get_user_usecase.dart';
import '../../domain/usecase/post_pic_firebase_usecase.dart';
import '../../domain/usecase/run_model_usecase.dart';

final resultScreenVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => ResultScreenVM(
          ref.watch(savedImagesProvider),
          ref.watch(postPicFirebaseUseCaseProvider),
          ref.watch(getUserUseCaseProvider),
          ref.watch(runModelUseCaseProvider),
        ));

class ResultScreenVM extends ChangeNotifier {
  final SavedImages _savedImages;
  final RunModelUseCase _runModelUsecase;
  final PostPicFirebaseUsecase _postPicFirebaseUsecase;
  final GetUserUsecase _getUserUsecase;
  ResultScreenVM(this._savedImages, this._postPicFirebaseUsecase,
      this._getUserUsecase, this._runModelUsecase) {
    convertToPng();
  }

  bool isLoading = false;
  String modelOutputText = 'Some Error occured';

  void toggleLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void convertToPng() async {
    toggleLoadingState();
    final appStorage = await getApplicationDocumentsDirectory();
    File spiralFile = File('${appStorage.path}/spiral.png');
    File waveFile = File('${appStorage.path}/wave.png');
    spiralFile =
        await spiralFile.writeAsBytes(_savedImages.spiralImage!.toList());
    waveFile = await waveFile.writeAsBytes(_savedImages.waveImage!.toList());
    await uploadImage(spiralFile, waveFile);
  }

  Future uploadImage(File spiralFile, File waveFile) async {
    final user = await _getUserUsecase.getUser();
    final spiralFileLink = await _postPicFirebaseUsecase.postPic(
        spiralFile, user!.uid, PictureType.spiral);
    final waveFileLink = await _postPicFirebaseUsecase.postPic(
        waveFile, user.uid, PictureType.wave);
    await runModel(spiralFileLink, waveFileLink, user.uid);
  }

  Future runModel(
      String spiralFileLink, String waveFileLink, String uid) async {
    final result =
        await _runModelUsecase.runModel(spiralFileLink, waveFileLink, uid);
    if (result == 1) {
      modelOutputText = 'YOU ARE ADVISED TO SEE A DOCTOR IMMEDEATLY';
    } else if (result == 0) {
      modelOutputText =
          'If you are observing other parkinson symptoms , then we recommend you to see a doctor';
    }
    print('aapko itna parkinson hain : $result');
    toggleLoadingState();
  }
}
