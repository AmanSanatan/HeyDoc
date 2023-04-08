// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SealedPageEvents {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() next,
    required TResult Function() previous,
    required TResult Function() runModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? next,
    TResult? Function()? previous,
    TResult? Function()? runModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? next,
    TResult Function()? previous,
    TResult Function()? runModel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NextPageEvent value) next,
    required TResult Function(PreviousPageEvent value) previous,
    required TResult Function(RunModelEvent value) runModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NextPageEvent value)? next,
    TResult? Function(PreviousPageEvent value)? previous,
    TResult? Function(RunModelEvent value)? runModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NextPageEvent value)? next,
    TResult Function(PreviousPageEvent value)? previous,
    TResult Function(RunModelEvent value)? runModel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SealedPageEventsCopyWith<$Res> {
  factory $SealedPageEventsCopyWith(
          SealedPageEvents value, $Res Function(SealedPageEvents) then) =
      _$SealedPageEventsCopyWithImpl<$Res, SealedPageEvents>;
}

/// @nodoc
class _$SealedPageEventsCopyWithImpl<$Res, $Val extends SealedPageEvents>
    implements $SealedPageEventsCopyWith<$Res> {
  _$SealedPageEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NextPageEventCopyWith<$Res> {
  factory _$$NextPageEventCopyWith(
          _$NextPageEvent value, $Res Function(_$NextPageEvent) then) =
      __$$NextPageEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextPageEventCopyWithImpl<$Res>
    extends _$SealedPageEventsCopyWithImpl<$Res, _$NextPageEvent>
    implements _$$NextPageEventCopyWith<$Res> {
  __$$NextPageEventCopyWithImpl(
      _$NextPageEvent _value, $Res Function(_$NextPageEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NextPageEvent implements NextPageEvent {
  const _$NextPageEvent();

  @override
  String toString() {
    return 'SealedPageEvents.next()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NextPageEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() next,
    required TResult Function() previous,
    required TResult Function() runModel,
  }) {
    return next();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? next,
    TResult? Function()? previous,
    TResult? Function()? runModel,
  }) {
    return next?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? next,
    TResult Function()? previous,
    TResult Function()? runModel,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NextPageEvent value) next,
    required TResult Function(PreviousPageEvent value) previous,
    required TResult Function(RunModelEvent value) runModel,
  }) {
    return next(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NextPageEvent value)? next,
    TResult? Function(PreviousPageEvent value)? previous,
    TResult? Function(RunModelEvent value)? runModel,
  }) {
    return next?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NextPageEvent value)? next,
    TResult Function(PreviousPageEvent value)? previous,
    TResult Function(RunModelEvent value)? runModel,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next(this);
    }
    return orElse();
  }
}

abstract class NextPageEvent implements SealedPageEvents {
  const factory NextPageEvent() = _$NextPageEvent;
}

/// @nodoc
abstract class _$$PreviousPageEventCopyWith<$Res> {
  factory _$$PreviousPageEventCopyWith(
          _$PreviousPageEvent value, $Res Function(_$PreviousPageEvent) then) =
      __$$PreviousPageEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PreviousPageEventCopyWithImpl<$Res>
    extends _$SealedPageEventsCopyWithImpl<$Res, _$PreviousPageEvent>
    implements _$$PreviousPageEventCopyWith<$Res> {
  __$$PreviousPageEventCopyWithImpl(
      _$PreviousPageEvent _value, $Res Function(_$PreviousPageEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PreviousPageEvent implements PreviousPageEvent {
  const _$PreviousPageEvent();

  @override
  String toString() {
    return 'SealedPageEvents.previous()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PreviousPageEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() next,
    required TResult Function() previous,
    required TResult Function() runModel,
  }) {
    return previous();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? next,
    TResult? Function()? previous,
    TResult? Function()? runModel,
  }) {
    return previous?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? next,
    TResult Function()? previous,
    TResult Function()? runModel,
    required TResult orElse(),
  }) {
    if (previous != null) {
      return previous();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NextPageEvent value) next,
    required TResult Function(PreviousPageEvent value) previous,
    required TResult Function(RunModelEvent value) runModel,
  }) {
    return previous(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NextPageEvent value)? next,
    TResult? Function(PreviousPageEvent value)? previous,
    TResult? Function(RunModelEvent value)? runModel,
  }) {
    return previous?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NextPageEvent value)? next,
    TResult Function(PreviousPageEvent value)? previous,
    TResult Function(RunModelEvent value)? runModel,
    required TResult orElse(),
  }) {
    if (previous != null) {
      return previous(this);
    }
    return orElse();
  }
}

abstract class PreviousPageEvent implements SealedPageEvents {
  const factory PreviousPageEvent() = _$PreviousPageEvent;
}

/// @nodoc
abstract class _$$RunModelEventCopyWith<$Res> {
  factory _$$RunModelEventCopyWith(
          _$RunModelEvent value, $Res Function(_$RunModelEvent) then) =
      __$$RunModelEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RunModelEventCopyWithImpl<$Res>
    extends _$SealedPageEventsCopyWithImpl<$Res, _$RunModelEvent>
    implements _$$RunModelEventCopyWith<$Res> {
  __$$RunModelEventCopyWithImpl(
      _$RunModelEvent _value, $Res Function(_$RunModelEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RunModelEvent implements RunModelEvent {
  const _$RunModelEvent();

  @override
  String toString() {
    return 'SealedPageEvents.runModel()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RunModelEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() next,
    required TResult Function() previous,
    required TResult Function() runModel,
  }) {
    return runModel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? next,
    TResult? Function()? previous,
    TResult? Function()? runModel,
  }) {
    return runModel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? next,
    TResult Function()? previous,
    TResult Function()? runModel,
    required TResult orElse(),
  }) {
    if (runModel != null) {
      return runModel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NextPageEvent value) next,
    required TResult Function(PreviousPageEvent value) previous,
    required TResult Function(RunModelEvent value) runModel,
  }) {
    return runModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NextPageEvent value)? next,
    TResult? Function(PreviousPageEvent value)? previous,
    TResult? Function(RunModelEvent value)? runModel,
  }) {
    return runModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NextPageEvent value)? next,
    TResult Function(PreviousPageEvent value)? previous,
    TResult Function(RunModelEvent value)? runModel,
    required TResult orElse(),
  }) {
    if (runModel != null) {
      return runModel(this);
    }
    return orElse();
  }
}

abstract class RunModelEvent implements SealedPageEvents {
  const factory RunModelEvent() = _$RunModelEvent;
}
