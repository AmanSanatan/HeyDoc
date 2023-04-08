import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_events.freezed.dart';

@freezed
class SealedPageEvents with _$SealedPageEvents {
  const factory SealedPageEvents.next() = NextPageEvent;
  const factory SealedPageEvents.previous() = PreviousPageEvent;
  const factory SealedPageEvents.runModel() = RunModelEvent;
}
