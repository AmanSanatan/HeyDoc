import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:heydocapp/presentation/custom_image_test/custom_image_test_screen_vm.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageTestScreen extends ConsumerWidget {
  const CustomImageTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customImageTestScreenVM = ref.watch(customImageTestScreenVMProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draw and Pick!'),
      ),
      body: customImageTestScreenVM.isLoading
          ? const Center(
              child: SpinKitSpinningLines(
              color: Colors.purple,
              size: 64,
            ))
          : SingleChildScrollView(
              child: Column(children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Wrap(children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    customImageTestScreenVM.pickSpiralImage(
                                      ImageSource.camera,
                                    );
                                  },
                                  child: const ListTile(
                                    leading: Icon(Icons.camera),
                                    title: Text('Take a picture'),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    customImageTestScreenVM.pickSpiralImage(
                                      ImageSource.gallery,
                                    );
                                  },
                                  child: const ListTile(
                                    leading: Icon(Icons.photo),
                                    title: Text('Pick from gallery'),
                                  ),
                                ),
                              ],
                            ),
                          ]);
                        });
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            'https://firebasestorage.googleapis.com/v0/b/heydoc-2f2ba.appspot.com/o/spiral_ideal.jpeg?alt=media&token=696de54b-d248-4fba-bcb1-7f77e481e99b',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        const Text(
                          'Draw a Spiral like above and click to pick photo',
                          style: TextStyle(fontSize: 16),
                        ),
                      ]),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Wrap(children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    customImageTestScreenVM.pickWaveImage(
                                      ImageSource.camera,
                                    );
                                  },
                                  child: const ListTile(
                                    leading: Icon(Icons.camera),
                                    title: Text('Take a picture'),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    customImageTestScreenVM.pickWaveImage(
                                      ImageSource.gallery,
                                    );
                                  },
                                  child: const ListTile(
                                    leading: Icon(Icons.photo),
                                    title: Text('Pick from gallery'),
                                  ),
                                ),
                              ],
                            ),
                          ]);
                        });
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Image.asset(
                            'https://firebasestorage.googleapis.com/v0/b/heydoc-2f2ba.appspot.com/o/wave_ideal.jpeg?alt=media&token=6b8b92f5-664c-446e-a9ff-a8237c1b82d8',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const Text(
                          'Draw a Wave like above and pick photo',
                          style: TextStyle(fontSize: 16),
                        ),
                      ]),
                ),
                (customImageTestScreenVM.outputText == null)
                    ? const SizedBox.shrink()
                    : Text(customImageTestScreenVM.outputText!),
              ]),
            ),
    );
  }
}
