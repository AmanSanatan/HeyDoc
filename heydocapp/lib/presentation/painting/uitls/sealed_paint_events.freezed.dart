// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sealed_paint_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SealedPaintEvents {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DragUpdateDetails dragUpdateDetails) update,
    required TResult Function(DragStartDetails dragStartDetails) start,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DragUpdateDetails dragUpdateDetails)? update,
    TResult? Function(DragStartDetails dragStartDetails)? start,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DragUpdateDetails dragUpdateDetails)? update,
    TResult Function(DragStartDetails dragStartDetails)? start,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PanUpdateEvent value) update,
    required TResult Function(PanStartEvent value) start,
    required TResult Function(ClearScreenEvent value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PanUpdateEvent value)? update,
    TResult? Function(PanStartEvent value)? start,
    TResult? Function(ClearScreenEvent value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PanUpdateEvent value)? update,
    TResult Function(PanStartEvent value)? start,
    TResult Function(ClearScreenEvent value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SealedPaintEventsCopyWith<$Res> {
  factory $SealedPaintEventsCopyWith(
          SealedPaintEvents value, $Res Function(SealedPaintEvents) then) =
      _$SealedPaintEventsCopyWithImpl<$Res, SealedPaintEvents>;
}

/// @nodoc
class _$SealedPaintEventsCopyWithImpl<$Res, $Val extends SealedPaintEvents>
    implements $SealedPaintEventsCopyWith<$Res> {
  _$SealedPaintEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PanUpdateEventImplCopyWith<$Res> {
  factory _$$PanUpdateEventImplCopyWith(_$PanUpdateEventImpl value,
          $Res Function(_$PanUpdateEventImpl) then) =
      __$$PanUpdateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DragUpdateDetails dragUpdateDetails});
}

/// @nodoc
class __$$PanUpdateEventImplCopyWithImpl<$Res>
    extends _$SealedPaintEventsCopyWithImpl<$Res, _$PanUpdateEventImpl>
    implements _$$PanUpdateEventImplCopyWith<$Res> {
  __$$PanUpdateEventImplCopyWithImpl(
      _$PanUpdateEventImpl _value, $Res Function(_$PanUpdateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dragUpdateDetails = null,
  }) {
    return _then(_$PanUpdateEventImpl(
      null == dragUpdateDetails
          ? _value.dragUpdateDetails
          : dragUpdateDetails // ignore: cast_nullable_to_non_nullable
              as DragUpdateDetails,
    ));
  }
}

/// @nodoc

class _$PanUpdateEventImpl implements PanUpdateEvent {
  const _$PanUpdateEventImpl(this.dragUpdateDetails);

  @override
  final DragUpdateDetails dragUpdateDetails;

  @override
  String toString() {
    return 'SealedPaintEvents.update(dragUpdateDetails: $dragUpdateDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PanUpdateEventImpl &&
            (identical(other.dragUpdateDetails, dragUpdateDetails) ||
                other.dragUpdateDetails == dragUpdateDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dragUpdateDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PanUpdateEventImplCopyWith<_$PanUpdateEventImpl> get copyWith =>
      __$$PanUpdateEventImplCopyWithImpl<_$PanUpdateEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DragUpdateDetails dragUpdateDetails) update,
    required TResult Function(DragStartDetails dragStartDetails) start,
    required TResult Function() clear,
  }) {
    return update(dragUpdateDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DragUpdateDetails dragUpdateDetails)? update,
    TResult? Function(DragStartDetails dragStartDetails)? start,
    TResult? Function()? clear,
  }) {
    return update?.call(dragUpdateDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DragUpdateDetails dragUpdateDetails)? update,
    TResult Function(DragStartDetails dragStartDetails)? start,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(dragUpdateDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PanUpdateEvent value) update,
    required TResult Function(PanStartEvent value) start,
    required TResult Function(ClearScreenEvent value) clear,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PanUpdateEvent value)? update,
    TResult? Function(PanStartEvent value)? start,
    TResult? Function(ClearScreenEvent value)? clear,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PanUpdateEvent value)? update,
    TResult Function(PanStartEvent value)? start,
    TResult Function(ClearScreenEvent value)? clear,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class PanUpdateEvent implements SealedPaintEvents {
  const factory PanUpdateEvent(final DragUpdateDetails dragUpdateDetails) =
      _$PanUpdateEventImpl;

  DragUpdateDetails get dragUpdateDetails;
  @JsonKey(ignore: true)
  _$$PanUpdateEventImplCopyWith<_$PanUpdateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PanStartEventImplCopyWith<$Res> {
  factory _$$PanStartEventImplCopyWith(
          _$PanStartEventImpl value, $Res Function(_$PanStartEventImpl) then) =
      __$$PanStartEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DragStartDetails dragStartDetails});
}

/// @nodoc
class __$$PanStartEventImplCopyWithImpl<$Res>
    extends _$SealedPaintEventsCopyWithImpl<$Res, _$PanStartEventImpl>
    implements _$$PanStartEventImplCopyWith<$Res> {
  __$$PanStartEventImplCopyWithImpl(
      _$PanStartEventImpl _value, $Res Function(_$PanStartEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dragStartDetails = null,
  }) {
    return _then(_$PanStartEventImpl(
      null == dragStartDetails
          ? _value.dragStartDetails
          : dragStartDetails // ignore: cast_nullable_to_non_nullable
              as DragStartDetails,
    ));
  }
}

/// @nodoc

class _$PanStartEventImpl implements PanStartEvent {
  const _$PanStartEventImpl(this.dragStartDetails);

  @override
  final DragStartDetails dragStartDetails;

  @override
  String toString() {
    return 'SealedPaintEvents.start(dragStartDetails: $dragStartDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PanStartEventImpl &&
            (identical(other.dragStartDetails, dragStartDetails) ||
                other.dragStartDetails == dragStartDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dragStartDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PanStartEventImplCopyWith<_$PanStartEventImpl> get copyWith =>
      __$$PanStartEventImplCopyWithImpl<_$PanStartEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DragUpdateDetails dragUpdateDetails) update,
    required TResult Function(DragStartDetails dragStartDetails) start,
    required TResult Function() clear,
  }) {
    return start(dragStartDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DragUpdateDetails dragUpdateDetails)? update,
    TResult? Function(DragStartDetails dragStartDetails)? start,
    TResult? Function()? clear,
  }) {
    return start?.call(dragStartDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DragUpdateDetails dragUpdateDetails)? update,
    TResult Function(DragStartDetails dragStartDetails)? start,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(dragStartDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PanUpdateEvent value) update,
    required TResult Function(PanStartEvent value) start,
    required TResult Function(ClearScreenEvent value) clear,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PanUpdateEvent value)? update,
    TResult? Function(PanStartEvent value)? start,
    TResult? Function(ClearScreenEvent value)? clear,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PanUpdateEvent value)? update,
    TResult Function(PanStartEvent value)? start,
    TResult Function(ClearScreenEvent value)? clear,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class PanStartEvent implements SealedPaintEvents {
  const factory PanStartEvent(final DragStartDetails dragStartDetails) =
      _$PanStartEventImpl;

  DragStartDetails get dragStartDetails;
  @JsonKey(ignore: true)
  _$$PanStartEventImplCopyWith<_$PanStartEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearScreenEventImplCopyWith<$Res> {
  factory _$$ClearScreenEventImplCopyWith(_$ClearScreenEventImpl value,
          $Res Function(_$ClearScreenEventImpl) then) =
      __$$ClearScreenEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearScreenEventImplCopyWithImpl<$Res>
    extends _$SealedPaintEventsCopyWithImpl<$Res, _$ClearScreenEventImpl>
    implements _$$ClearScreenEventImplCopyWith<$Res> {
  __$$ClearScreenEventImplCopyWithImpl(_$ClearScreenEventImpl _value,
      $Res Function(_$ClearScreenEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearScreenEventImpl implements ClearScreenEvent {
  const _$ClearScreenEventImpl();

  @override
  String toString() {
    return 'SealedPaintEvents.clear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearScreenEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DragUpdateDetails dragUpdateDetails) update,
    required TResult Function(DragStartDetails dragStartDetails) start,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DragUpdateDetails dragUpdateDetails)? update,
    TResult? Function(DragStartDetails dragStartDetails)? start,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DragUpdateDetails dragUpdateDetails)? update,
    TResult Function(DragStartDetails dragStartDetails)? start,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PanUpdateEvent value) update,
    required TResult Function(PanStartEvent value) start,
    required TResult Function(ClearScreenEvent value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PanUpdateEvent value)? update,
    TResult? Function(PanStartEvent value)? start,
    TResult? Function(ClearScreenEvent value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PanUpdateEvent value)? update,
    TResult Function(PanStartEvent value)? start,
    TResult Function(ClearScreenEvent value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class ClearScreenEvent implements SealedPaintEvents {
  const factory ClearScreenEvent() = _$ClearScreenEventImpl;
}
