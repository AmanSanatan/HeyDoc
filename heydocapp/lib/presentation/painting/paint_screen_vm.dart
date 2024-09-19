import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/main.dart';
import 'package:heydocapp/presentation/painting/result_screen.dart';
import 'package:heydocapp/presentation/painting/saved_images.dart';

final paintScreenVMProvider = ChangeNotifierProvider.autoDispose((ref) =>
    PaintScreenVM(
        ref.watch(navigatorKeyProvider), ref.watch(savedImagesProvider)));

class PaintScreenVM extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey;
  SavedImages savedImages;
  PaintScreenVM(this.navigatorKey, this.savedImages) {
    listenPaintEvents();
    listenPageEvents();
  }
  Path path = Path();
  int pageNumber = 0;

  final StreamController _paintEventController = StreamController.broadcast();
  StreamSink get paintEventSink => _paintEventController.sink;

  final StreamController _handlepaintEventController =
      StreamController.broadcast();
  StreamSink get _handlePaintEventSink => _handlepaintEventController.sink;
  Stream get handlePaintEventStream => _handlepaintEventController.stream;

  void listenPaintEvents() {
    _paintEventController.stream.listen((event) {
      event.when(
        update: (DragUpdateDetails dragUpdateDetails) {
          path.lineTo(dragUpdateDetails.localPosition.dx,
              dragUpdateDetails.localPosition.dy);
          _handlePaintEventSink.add(path);
        },
        start: (DragStartDetails dragStartDetails) {
          path.moveTo(dragStartDetails.localPosition.dx,
              dragStartDetails.localPosition.dy);
          _handlePaintEventSink.add(path);
        },
        clear: () {
          path = Path();
          _handlePaintEventSink.add(path);
        },
      );
    });
  }

  final StreamController _pageEventController = StreamController.broadcast();
  StreamSink get pageEventSink => _pageEventController.sink;

  void listenPageEvents() {
    _pageEventController.stream.listen((event) {
      event.when(next: () {
        if (pageNumber < 1) {
          pageNumber++;
          notifyListeners();
          path = Path();
          _handlePaintEventSink.add(path);
        }
      }, previous: () {
        if (pageNumber > 0) {
          pageNumber--;
          notifyListeners();
          path = Path();
          _handlePaintEventSink.add(path);
        }
      }, runModel: () async {
        navigatorKey.currentState
            ?.push(MaterialPageRoute(builder: (BuildContext context) {
          return const ResultScreen();
        }));
        print('model run krne ka man hain??');
      });
    });
  }
}
