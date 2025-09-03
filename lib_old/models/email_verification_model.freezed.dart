// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_verification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmailVerificationModel {
  String get uuid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailVerificationModelCopyWith<EmailVerificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationModelCopyWith<$Res> {
  factory $EmailVerificationModelCopyWith(EmailVerificationModel value,
          $Res Function(EmailVerificationModel) then) =
      _$EmailVerificationModelCopyWithImpl<$Res, EmailVerificationModel>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class _$EmailVerificationModelCopyWithImpl<$Res,
        $Val extends EmailVerificationModel>
    implements $EmailVerificationModelCopyWith<$Res> {
  _$EmailVerificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailVerificationModelImplCopyWith<$Res>
    implements $EmailVerificationModelCopyWith<$Res> {
  factory _$$EmailVerificationModelImplCopyWith(
          _$EmailVerificationModelImpl value,
          $Res Function(_$EmailVerificationModelImpl) then) =
      __$$EmailVerificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$EmailVerificationModelImplCopyWithImpl<$Res>
    extends _$EmailVerificationModelCopyWithImpl<$Res,
        _$EmailVerificationModelImpl>
    implements _$$EmailVerificationModelImplCopyWith<$Res> {
  __$$EmailVerificationModelImplCopyWithImpl(
      _$EmailVerificationModelImpl _value,
      $Res Function(_$EmailVerificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$EmailVerificationModelImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EmailVerificationModelImpl implements _EmailVerificationModel {
  _$EmailVerificationModelImpl({required this.uuid});

  @override
  final String uuid;

  @override
  String toString() {
    return 'EmailVerificationModel(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationModelImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerificationModelImplCopyWith<_$EmailVerificationModelImpl>
      get copyWith => __$$EmailVerificationModelImplCopyWithImpl<
          _$EmailVerificationModelImpl>(this, _$identity);
}

abstract class _EmailVerificationModel implements EmailVerificationModel {
  factory _EmailVerificationModel({required final String uuid}) =
      _$EmailVerificationModelImpl;

  @override
  String get uuid;
  @override
  @JsonKey(ignore: true)
  _$$EmailVerificationModelImplCopyWith<_$EmailVerificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EmailVerificationModelError _$EmailVerificationModelErrorFromJson(
    Map<String, dynamic> json) {
  return _EmailVerificationModelError.fromJson(json);
}

/// @nodoc
mixin _$EmailVerificationModelError {
  String? get exception => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailVerificationModelErrorCopyWith<EmailVerificationModelError>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationModelErrorCopyWith<$Res> {
  factory $EmailVerificationModelErrorCopyWith(
          EmailVerificationModelError value,
          $Res Function(EmailVerificationModelError) then) =
      _$EmailVerificationModelErrorCopyWithImpl<$Res,
          EmailVerificationModelError>;
  @useResult
  $Res call(
      {String? exception,
      String? code,
      String? error,
      int? status,
      String message});
}

/// @nodoc
class _$EmailVerificationModelErrorCopyWithImpl<$Res,
        $Val extends EmailVerificationModelError>
    implements $EmailVerificationModelErrorCopyWith<$Res> {
  _$EmailVerificationModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? code = freezed,
    Object? error = freezed,
    Object? status = freezed,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailVerificationModelErrorImplCopyWith<$Res>
    implements $EmailVerificationModelErrorCopyWith<$Res> {
  factory _$$EmailVerificationModelErrorImplCopyWith(
          _$EmailVerificationModelErrorImpl value,
          $Res Function(_$EmailVerificationModelErrorImpl) then) =
      __$$EmailVerificationModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? exception,
      String? code,
      String? error,
      int? status,
      String message});
}

/// @nodoc
class __$$EmailVerificationModelErrorImplCopyWithImpl<$Res>
    extends _$EmailVerificationModelErrorCopyWithImpl<$Res,
        _$EmailVerificationModelErrorImpl>
    implements _$$EmailVerificationModelErrorImplCopyWith<$Res> {
  __$$EmailVerificationModelErrorImplCopyWithImpl(
      _$EmailVerificationModelErrorImpl _value,
      $Res Function(_$EmailVerificationModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? code = freezed,
    Object? error = freezed,
    Object? status = freezed,
    Object? message = null,
  }) {
    return _then(_$EmailVerificationModelErrorImpl(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailVerificationModelErrorImpl extends _EmailVerificationModelError {
  _$EmailVerificationModelErrorImpl(
      {this.exception,
      this.code,
      this.error,
      this.status,
      required this.message})
      : super._();

  factory _$EmailVerificationModelErrorImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EmailVerificationModelErrorImplFromJson(json);

  @override
  final String? exception;
  @override
  final String? code;
  @override
  final String? error;
  @override
  final int? status;
  @override
  final String message;

  @override
  String toString() {
    return 'EmailVerificationModelError(exception: $exception, code: $code, error: $error, status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationModelErrorImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, exception, code, error, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerificationModelErrorImplCopyWith<_$EmailVerificationModelErrorImpl>
      get copyWith => __$$EmailVerificationModelErrorImplCopyWithImpl<
          _$EmailVerificationModelErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailVerificationModelErrorImplToJson(
      this,
    );
  }
}

abstract class _EmailVerificationModelError
    extends EmailVerificationModelError {
  factory _EmailVerificationModelError(
      {final String? exception,
      final String? code,
      final String? error,
      final int? status,
      required final String message}) = _$EmailVerificationModelErrorImpl;
  _EmailVerificationModelError._() : super._();

  factory _EmailVerificationModelError.fromJson(Map<String, dynamic> json) =
      _$EmailVerificationModelErrorImpl.fromJson;

  @override
  String? get exception;
  @override
  String? get code;
  @override
  String? get error;
  @override
  int? get status;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$EmailVerificationModelErrorImplCopyWith<_$EmailVerificationModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
