import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:heydocapp/presentation/custom_image_test/custom_image_test_screen_vm.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageTestScreen extends ConsumerWidget {
  const CustomImageTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
              child: Column(
                children: [
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
                            child: Image.network(
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
                            child: Image.network(
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
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.5 * 0.05),
                  ),
                  InkWell(
                    onTap: () {
                      customImageTestScreenVM.runModel();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width * 0.55,
                      padding: EdgeInsets.symmetric(
                        // horizontal: width * 0.2,
                        vertical: height * 0.5 * 0.05,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Run Test!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.5 * 0.05),
                  ),
                ],
              ),
            ),
    );
  }
}
