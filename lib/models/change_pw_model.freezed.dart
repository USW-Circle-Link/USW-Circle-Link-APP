// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_pw_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChangePwModel _$ChangePwModelFromJson(Map<String, dynamic> json) {
  return _ChangePWModel.fromJson(json);
}

/// @nodoc
mixin _$ChangePwModel {
  String get message => throw _privateConstructorUsedError;
  ChangePwModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangePwModelCopyWith<ChangePwModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePwModelCopyWith<$Res> {
  factory $ChangePwModelCopyWith(
          ChangePwModel value, $Res Function(ChangePwModel) then) =
      _$ChangePwModelCopyWithImpl<$Res, ChangePwModel>;
  @useResult
  $Res call({String message, ChangePwModelType? type});
}

/// @nodoc
class _$ChangePwModelCopyWithImpl<$Res, $Val extends ChangePwModel>
    implements $ChangePwModelCopyWith<$Res> {
  _$ChangePwModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChangePwModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePWModelImplCopyWith<$Res>
    implements $ChangePwModelCopyWith<$Res> {
  factory _$$ChangePWModelImplCopyWith(
          _$ChangePWModelImpl value, $Res Function(_$ChangePWModelImpl) then) =
      __$$ChangePWModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, ChangePwModelType? type});
}

/// @nodoc
class __$$ChangePWModelImplCopyWithImpl<$Res>
    extends _$ChangePwModelCopyWithImpl<$Res, _$ChangePWModelImpl>
    implements _$$ChangePWModelImplCopyWith<$Res> {
  __$$ChangePWModelImplCopyWithImpl(
      _$ChangePWModelImpl _value, $Res Function(_$ChangePWModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = freezed,
  }) {
    return _then(_$ChangePWModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChangePwModelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePWModelImpl extends _ChangePWModel {
  _$ChangePWModelImpl({required this.message, this.type}) : super._();

  factory _$ChangePWModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePWModelImplFromJson(json);

  @override
  final String message;
  @override
  final ChangePwModelType? type;

  @override
  String toString() {
    return 'ChangePwModel(message: $message, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePWModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePWModelImplCopyWith<_$ChangePWModelImpl> get copyWith =>
      __$$ChangePWModelImplCopyWithImpl<_$ChangePWModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePWModelImplToJson(
      this,
    );
  }
}

abstract class _ChangePWModel extends ChangePwModel {
  factory _ChangePWModel(
      {required final String message,
      final ChangePwModelType? type}) = _$ChangePWModelImpl;
  _ChangePWModel._() : super._();

  factory _ChangePWModel.fromJson(Map<String, dynamic> json) =
      _$ChangePWModelImpl.fromJson;

  @override
  String get message;
  @override
  ChangePwModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$ChangePWModelImplCopyWith<_$ChangePWModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChangePwModelError _$ChangePwModelErrorFromJson(Map<String, dynamic> json) {
  return _ChangePWModelError.fromJson(json);
}

/// @nodoc
mixin _$ChangePwModelError {
  String get message => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  ChangePwModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangePwModelErrorCopyWith<ChangePwModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePwModelErrorCopyWith<$Res> {
  factory $ChangePwModelErrorCopyWith(
          ChangePwModelError value, $Res Function(ChangePwModelError) then) =
      _$ChangePwModelErrorCopyWithImpl<$Res, ChangePwModelError>;
  @useResult
  $Res call(
      {String message,
      String? exception,
      String? code,
      int? status,
      String? error,
      ChangePwModelType? type});
}

/// @nodoc
class _$ChangePwModelErrorCopyWithImpl<$Res, $Val extends ChangePwModelError>
    implements $ChangePwModelErrorCopyWith<$Res> {
  _$ChangePwModelErrorCopyWithImpl(this._value, this._then);

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
    Object? type = freezed,
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChangePwModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePWModelErrorImplCopyWith<$Res>
    implements $ChangePwModelErrorCopyWith<$Res> {
  factory _$$ChangePWModelErrorImplCopyWith(_$ChangePWModelErrorImpl value,
          $Res Function(_$ChangePWModelErrorImpl) then) =
      __$$ChangePWModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String? exception,
      String? code,
      int? status,
      String? error,
      ChangePwModelType? type});
}

/// @nodoc
class __$$ChangePWModelErrorImplCopyWithImpl<$Res>
    extends _$ChangePwModelErrorCopyWithImpl<$Res, _$ChangePWModelErrorImpl>
    implements _$$ChangePWModelErrorImplCopyWith<$Res> {
  __$$ChangePWModelErrorImplCopyWithImpl(_$ChangePWModelErrorImpl _value,
      $Res Function(_$ChangePWModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? exception = freezed,
    Object? code = freezed,
    Object? status = freezed,
    Object? error = freezed,
    Object? type = freezed,
  }) {
    return _then(_$ChangePWModelErrorImpl(
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChangePwModelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePWModelErrorImpl extends _ChangePWModelError {
  _$ChangePWModelErrorImpl(
      {required this.message,
      this.exception,
      this.code,
      this.status,
      this.error,
      this.type})
      : super._();

  factory _$ChangePWModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePWModelErrorImplFromJson(json);

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
  final ChangePwModelType? type;

  @override
  String toString() {
    return 'ChangePwModelError(message: $message, exception: $exception, code: $code, status: $status, error: $error, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePWModelErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, exception, code, status, error, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePWModelErrorImplCopyWith<_$ChangePWModelErrorImpl> get copyWith =>
      __$$ChangePWModelErrorImplCopyWithImpl<_$ChangePWModelErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePWModelErrorImplToJson(
      this,
    );
  }
}

abstract class _ChangePWModelError extends ChangePwModelError {
  factory _ChangePWModelError(
      {required final String message,
      final String? exception,
      final String? code,
      final int? status,
      final String? error,
      final ChangePwModelType? type}) = _$ChangePWModelErrorImpl;
  _ChangePWModelError._() : super._();

  factory _ChangePWModelError.fromJson(Map<String, dynamic> json) =
      _$ChangePWModelErrorImpl.fromJson;

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
  ChangePwModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$ChangePWModelErrorImplCopyWith<_$ChangePWModelErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
