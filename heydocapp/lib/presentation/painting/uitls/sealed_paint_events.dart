import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sealed_paint_events.freezed.dart';

@freezed
class SealedPaintEvents with _$SealedPaintEvents {
  const factory SealedPaintEvents.update(DragUpdateDetails dragUpdateDetails) =
      PanUpdateEvent;
  const factory SealedPaintEvents.start(DragStartDetails dragStartDetails) =
      PanStartEvent;
  const factory SealedPaintEvents.clear() = ClearScreenEvent;
}
