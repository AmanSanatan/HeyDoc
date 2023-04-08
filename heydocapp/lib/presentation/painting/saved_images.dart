import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final savedImagesProvider = Provider((ref) => SavedImages());

class SavedImages {
  Uint8List? spiralImage;
  Uint8List? waveImage;
}
