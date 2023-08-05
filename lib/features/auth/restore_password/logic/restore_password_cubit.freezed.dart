// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restore_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RestorePasswordState {
  RestorePasswordStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestorePasswordStateCopyWith<RestorePasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestorePasswordStateCopyWith<$Res> {
  factory $RestorePasswordStateCopyWith(RestorePasswordState value,
          $Res Function(RestorePasswordState) then) =
      _$RestorePasswordStateCopyWithImpl<$Res, RestorePasswordState>;
  @useResult
  $Res call({RestorePasswordStatus status, String? error});
}

/// @nodoc
class _$RestorePasswordStateCopyWithImpl<$Res,
        $Val extends RestorePasswordState>
    implements $RestorePasswordStateCopyWith<$Res> {
  _$RestorePasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RestorePasswordStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RestorePasswordStateCopyWith<$Res>
    implements $RestorePasswordStateCopyWith<$Res> {
  factory _$$_RestorePasswordStateCopyWith(_$_RestorePasswordState value,
          $Res Function(_$_RestorePasswordState) then) =
      __$$_RestorePasswordStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RestorePasswordStatus status, String? error});
}

/// @nodoc
class __$$_RestorePasswordStateCopyWithImpl<$Res>
    extends _$RestorePasswordStateCopyWithImpl<$Res, _$_RestorePasswordState>
    implements _$$_RestorePasswordStateCopyWith<$Res> {
  __$$_RestorePasswordStateCopyWithImpl(_$_RestorePasswordState _value,
      $Res Function(_$_RestorePasswordState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$_RestorePasswordState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RestorePasswordStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RestorePasswordState implements _RestorePasswordState {
  const _$_RestorePasswordState(
      {this.status = RestorePasswordStatus.idle, this.error});

  @override
  @JsonKey()
  final RestorePasswordStatus status;
  @override
  final String? error;

  @override
  String toString() {
    return 'RestorePasswordState(status: $status, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestorePasswordState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestorePasswordStateCopyWith<_$_RestorePasswordState> get copyWith =>
      __$$_RestorePasswordStateCopyWithImpl<_$_RestorePasswordState>(
          this, _$identity);
}

abstract class _RestorePasswordState implements RestorePasswordState {
  const factory _RestorePasswordState(
      {final RestorePasswordStatus status,
      final String? error}) = _$_RestorePasswordState;

  @override
  RestorePasswordStatus get status;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_RestorePasswordStateCopyWith<_$_RestorePasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
