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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$NextPageEventImplCopyWith<$Res> {
  factory _$$NextPageEventImplCopyWith(
          _$NextPageEventImpl value, $Res Function(_$NextPageEventImpl) then) =
      __$$NextPageEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextPageEventImplCopyWithImpl<$Res>
    extends _$SealedPageEventsCopyWithImpl<$Res, _$NextPageEventImpl>
    implements _$$NextPageEventImplCopyWith<$Res> {
  __$$NextPageEventImplCopyWithImpl(
      _$NextPageEventImpl _value, $Res Function(_$NextPageEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NextPageEventImpl implements NextPageEvent {
  const _$NextPageEventImpl();

  @override
  String toString() {
    return 'SealedPageEvents.next()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NextPageEventImpl);
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
  const factory NextPageEvent() = _$NextPageEventImpl;
}

/// @nodoc
abstract class _$$PreviousPageEventImplCopyWith<$Res> {
  factory _$$PreviousPageEventImplCopyWith(_$PreviousPageEventImpl value,
          $Res Function(_$PreviousPageEventImpl) then) =
      __$$PreviousPageEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PreviousPageEventImplCopyWithImpl<$Res>
    extends _$SealedPageEventsCopyWithImpl<$Res, _$PreviousPageEventImpl>
    implements _$$PreviousPageEventImplCopyWith<$Res> {
  __$$PreviousPageEventImplCopyWithImpl(_$PreviousPageEventImpl _value,
      $Res Function(_$PreviousPageEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PreviousPageEventImpl implements PreviousPageEvent {
  const _$PreviousPageEventImpl();

  @override
  String toString() {
    return 'SealedPageEvents.previous()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PreviousPageEventImpl);
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
  const factory PreviousPageEvent() = _$PreviousPageEventImpl;
}

/// @nodoc
abstract class _$$RunModelEventImplCopyWith<$Res> {
  factory _$$RunModelEventImplCopyWith(
          _$RunModelEventImpl value, $Res Function(_$RunModelEventImpl) then) =
      __$$RunModelEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RunModelEventImplCopyWithImpl<$Res>
    extends _$SealedPageEventsCopyWithImpl<$Res, _$RunModelEventImpl>
    implements _$$RunModelEventImplCopyWith<$Res> {
  __$$RunModelEventImplCopyWithImpl(
      _$RunModelEventImpl _value, $Res Function(_$RunModelEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RunModelEventImpl implements RunModelEvent {
  const _$RunModelEventImpl();

  @override
  String toString() {
    return 'SealedPageEvents.runModel()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RunModelEventImpl);
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
  const factory RunModelEvent() = _$RunModelEventImpl;
}
