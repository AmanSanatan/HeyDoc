import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PictureType { patientImage, spiral, wave }

final postPicFirebaseUseCaseProvider =
    Provider((ref) => PostPicFirebaseUsecase());

class PostPicFirebaseUsecase {
  Future postPic(File image, String? uniqueId, PictureType pictureType) async {
    try {
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child(pictureType.name);
      Reference referenceImageToUpload = referenceDirImages
          .child(uniqueId ?? DateTime.now().millisecondsSinceEpoch.toString());
      await referenceImageToUpload.putFile(image);
      final newImageUrl = await referenceImageToUpload.getDownloadURL();
      return newImageUrl;
    } catch (e) {}
  }
}
