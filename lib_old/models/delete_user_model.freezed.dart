// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteUserModelError _$DeleteUserModelErrorFromJson(Map<String, dynamic> json) {
  return _DeleteUserModelError.fromJson(json);
}

/// @nodoc
mixin _$DeleteUserModelError {
  String get message => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteUserModelErrorCopyWith<DeleteUserModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteUserModelErrorCopyWith<$Res> {
  factory $DeleteUserModelErrorCopyWith(DeleteUserModelError value,
          $Res Function(DeleteUserModelError) then) =
      _$DeleteUserModelErrorCopyWithImpl<$Res, DeleteUserModelError>;
  @useResult
  $Res call(
      {String message,
      String? exception,
      String? code,
      int? status,
      String? error});
}

/// @nodoc
class _$DeleteUserModelErrorCopyWithImpl<$Res,
        $Val extends DeleteUserModelError>
    implements $DeleteUserModelErrorCopyWith<$Res> {
  _$DeleteUserModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? exception = freezed,
    Object? code = freezed,
    Object? status = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteUserModelErrorImplCopyWith<$Res>
    implements $DeleteUserModelErrorCopyWith<$Res> {
  factory _$$DeleteUserModelErrorImplCopyWith(_$DeleteUserModelErrorImpl value,
          $Res Function(_$DeleteUserModelErrorImpl) then) =
      __$$DeleteUserModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String? exception,
      String? code,
      int? status,
      String? error});
}

/// @nodoc
class __$$DeleteUserModelErrorImplCopyWithImpl<$Res>
    extends _$DeleteUserModelErrorCopyWithImpl<$Res, _$DeleteUserModelErrorImpl>
    implements _$$DeleteUserModelErrorImplCopyWith<$Res> {
  __$$DeleteUserModelErrorImplCopyWithImpl(_$DeleteUserModelErrorImpl _value,
      $Res Function(_$DeleteUserModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? exception = freezed,
    Object? code = freezed,
    Object? status = freezed,
    Object? error = freezed,
  }) {
    return _then(_$DeleteUserModelErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteUserModelErrorImpl extends _DeleteUserModelError {
  _$DeleteUserModelErrorImpl(
      {required this.message,
      this.exception,
      this.code,
      this.status,
      this.error})
      : super._();

  factory _$DeleteUserModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteUserModelErrorImplFromJson(json);

  @override
  final String message;
  @override
  final String? exception;
  @override
  final String? code;
  @override
  final int? status;
  @override
  final String? error;

  @override
  String toString() {
    return 'DeleteUserModelError(message: $message, exception: $exception, code: $code, status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteUserModelErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, exception, code, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteUserModelErrorImplCopyWith<_$DeleteUserModelErrorImpl>
      get copyWith =>
          __$$DeleteUserModelErrorImplCopyWithImpl<_$DeleteUserModelErrorImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteUserModelErrorImplToJson(
      this,
    );
  }
}

abstract class _DeleteUserModelError extends DeleteUserModelError {
  factory _DeleteUserModelError(
      {required final String message,
      final String? exception,
      final String? code,
      final int? status,
      final String? error}) = _$DeleteUserModelErrorImpl;
  _DeleteUserModelError._() : super._();

  factory _DeleteUserModelError.fromJson(Map<String, dynamic> json) =
      _$DeleteUserModelErrorImpl.fromJson;

  @override
  String get message;
  @override
  String? get exception;
  @override
  String? get code;
  @override
  int? get status;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$DeleteUserModelErrorImplCopyWith<_$DeleteUserModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
