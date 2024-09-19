import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/presentation/painting/paint_screen_vm.dart';
import 'package:heydocapp/presentation/painting/uitls/page_events.dart';
import 'package:heydocapp/presentation/painting/uitls/sealed_paint_events.dart';
import 'package:screenshot/screenshot.dart';

import '../custom_image_test/custom_image_test_screen.dart';
import 'components/my_clipper.dart';
import 'components/path_custom_painter.dart';

class PaintScreen extends ConsumerWidget {
  PaintScreen({super.key});
  final controller = ScreenshotController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paintScreenVM = ref.watch(paintScreenVMProvider);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: paintScreenVM.pageNumber == 0
            ? const Text("Draw a Spiral")
            : const Text("Draw a wave"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const CustomImageTestScreen();
                }));
              },
              icon: const Icon(Icons.edit_document))
        ],
      ),
      backgroundColor: Colors.deepPurple[100],
      body: Column(children: [
        Screenshot(
          controller: controller,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: height * 0.5,
            margin: const EdgeInsets.all(20),
            width: width,
            child: GestureDetector(
              onPanUpdate: (details) {
                paintScreenVM.paintEventSink
                    .add(SealedPaintEvents.update(details));
              },
              onPanStart: (details) {
                paintScreenVM.paintEventSink
                    .add(SealedPaintEvents.start(details));
              },
              child: SizedBox.expand(
                child: RepaintBoundary(
                  child: ClipRect(
                    clipper: MyClipper(height: height * 0.5, width: width - 40),
                    child: StreamBuilder(
                      stream: paintScreenVM.handlePaintEventStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        return CustomPaint(
                          size: Size.infinite,
                          painter: PathPainter(
                              path: snapshot.hasData ? snapshot.data : Path()),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (paintScreenVM.pageNumber == 0)
          Flexible(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/heydoc-2f2ba.appspot.com/o/spiral_ideal.jpeg?alt=media&token=696de54b-d248-4fba-bcb1-7f77e481e99b',
                fit: BoxFit.fitHeight,
              ),
            ),
          )
        else
          Flexible(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/heydoc-2f2ba.appspot.com/o/wave_ideal.jpeg?alt=media&token=6b8b92f5-664c-446e-a9ff-a8237c1b82d8',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () async {
                    if (paintScreenVM.pageNumber == 0) {
                      final byte = await controller.capture();
                      paintScreenVM.savedImages.spiralImage = byte;
                      print(
                          'spiral img ${paintScreenVM.savedImages.spiralImage}');
                    } else if (paintScreenVM.pageNumber == 1) {
                      final byte = await controller.capture();
                      paintScreenVM.savedImages.waveImage = byte;
                      print('wave img ${paintScreenVM.savedImages.waveImage}');
                    }
                    paintScreenVM.pageEventSink
                        .add(const SealedPageEvents.previous());
                  },
                  icon: const Icon(Icons.navigate_before_outlined)),
              IconButton(
                  onPressed: () {
                    paintScreenVM.paintEventSink
                        .add(const SealedPaintEvents.clear());
                  },
                  icon: const Icon(Icons.delete)),
              IconButton(
                  onPressed: () async {
                    if (paintScreenVM.pageNumber == 0) {
                      final byte = await controller.capture();
                      paintScreenVM.savedImages.spiralImage = byte;
                      paintScreenVM.pageEventSink
                          .add(const SealedPageEvents.next());
                      print(
                          'spiral img ${paintScreenVM.savedImages.spiralImage}');
                    } else if (paintScreenVM.pageNumber == 1) {
                      final byte = await controller.capture();
                      paintScreenVM.savedImages.waveImage = byte;
                      paintScreenVM.pageEventSink
                          .add(const SealedPageEvents.runModel());
                      print('wave img ${paintScreenVM.savedImages.waveImage}');
                    }
                  },
                  icon: const Icon(Icons.navigate_next_outlined)),
            ]),
      ]),
    );
  }
}
