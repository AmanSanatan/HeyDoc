// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserCredential userCredential) success,
    required TResult Function(String message) faliure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserCredential userCredential)? success,
    TResult? Function(String message)? faliure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserCredential userCredential)? success,
    TResult Function(String message)? faliure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthFaliure value) faliure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthFaliure value)? faliure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthFaliure value)? faliure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
          AuthResponse value, $Res Function(AuthResponse) then) =
      _$AuthResponseCopyWithImpl<$Res, AuthResponse>;
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res, $Val extends AuthResponse>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthSuccessCopyWith<$Res> {
  factory _$$AuthSuccessCopyWith(
          _$AuthSuccess value, $Res Function(_$AuthSuccess) then) =
      __$$AuthSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({UserCredential userCredential});
}

/// @nodoc
class __$$AuthSuccessCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$AuthSuccess>
    implements _$$AuthSuccessCopyWith<$Res> {
  __$$AuthSuccessCopyWithImpl(
      _$AuthSuccess _value, $Res Function(_$AuthSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCredential = null,
  }) {
    return _then(_$AuthSuccess(
      null == userCredential
          ? _value.userCredential
          : userCredential // ignore: cast_nullable_to_non_nullable
              as UserCredential,
    ));
  }
}

/// @nodoc

class _$AuthSuccess implements AuthSuccess {
  const _$AuthSuccess(this.userCredential);

  @override
  final UserCredential userCredential;

  @override
  String toString() {
    return 'AuthResponse.success(userCredential: $userCredential)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSuccess &&
            (identical(other.userCredential, userCredential) ||
                other.userCredential == userCredential));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userCredential);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSuccessCopyWith<_$AuthSuccess> get copyWith =>
      __$$AuthSuccessCopyWithImpl<_$AuthSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserCredential userCredential) success,
    required TResult Function(String message) faliure,
  }) {
    return success(userCredential);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserCredential userCredential)? success,
    TResult? Function(String message)? faliure,
  }) {
    return success?.call(userCredential);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserCredential userCredential)? success,
    TResult Function(String message)? faliure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(userCredential);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthFaliure value) faliure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthFaliure value)? faliure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthFaliure value)? faliure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AuthSuccess implements AuthResponse {
  const factory AuthSuccess(final UserCredential userCredential) =
      _$AuthSuccess;

  UserCredential get userCredential;
  @JsonKey(ignore: true)
  _$$AuthSuccessCopyWith<_$AuthSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthFaliureCopyWith<$Res> {
  factory _$$AuthFaliureCopyWith(
          _$AuthFaliure value, $Res Function(_$AuthFaliure) then) =
      __$$AuthFaliureCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthFaliureCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$AuthFaliure>
    implements _$$AuthFaliureCopyWith<$Res> {
  __$$AuthFaliureCopyWithImpl(
      _$AuthFaliure _value, $Res Function(_$AuthFaliure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthFaliure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthFaliure implements AuthFaliure {
  const _$AuthFaliure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthResponse.faliure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFaliure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFaliureCopyWith<_$AuthFaliure> get copyWith =>
      __$$AuthFaliureCopyWithImpl<_$AuthFaliure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserCredential userCredential) success,
    required TResult Function(String message) faliure,
  }) {
    return faliure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserCredential userCredential)? success,
    TResult? Function(String message)? faliure,
  }) {
    return faliure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserCredential userCredential)? success,
    TResult Function(String message)? faliure,
    required TResult orElse(),
  }) {
    if (faliure != null) {
      return faliure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthFaliure value) faliure,
  }) {
    return faliure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthFaliure value)? faliure,
  }) {
    return faliure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthFaliure value)? faliure,
    required TResult orElse(),
  }) {
    if (faliure != null) {
      return faliure(this);
    }
    return orElse();
  }
}

abstract class AuthFaliure implements AuthResponse {
  const factory AuthFaliure(final String message) = _$AuthFaliure;

  String get message;
  @JsonKey(ignore: true)
  _$$AuthFaliureCopyWith<_$AuthFaliure> get copyWith =>
      throw _privateConstructorUsedError;
}
