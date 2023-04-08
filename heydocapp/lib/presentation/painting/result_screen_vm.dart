import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/presentation/painting/saved_images.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/usecase/get_user_usecase.dart';
import '../../domain/usecase/post_pic_firebase_usecase.dart';

final resultScreenVMProvider = ChangeNotifierProvider.autoDispose((ref) =>
    ResultScreenVM(
        ref.watch(savedImagesProvider),
        ref.read(postPicFirebaseUseCaseProvider),
        ref.read(getUserUseCaseProvider)));

class ResultScreenVM extends ChangeNotifier {
  final SavedImages _savedImages;
  final PostPicFirebaseUsecase _postPicFirebaseUsecase;
  final GetUserUsecase _getUserUsecase;
  ResultScreenVM(
      this._savedImages, this._postPicFirebaseUsecase, this._getUserUsecase) {
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
    await runModel(spiralFileLink, waveFileLink);
  }

  Future runModel(String spiralFileLink, String waveFileLink) async {
    toggleLoadingState();
  }
}
