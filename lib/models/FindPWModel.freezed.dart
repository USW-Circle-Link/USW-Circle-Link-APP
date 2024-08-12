// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'FindPWModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FindPWModel _$FindPWModelFromJson(Map<String, dynamic> json) {
  return _FindPWModel.fromJson(json);
}

/// @nodoc
mixin _$FindPWModel {
  String get message => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  FindPWModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FindPWModelCopyWith<FindPWModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindPWModelCopyWith<$Res> {
  factory $FindPWModelCopyWith(
          FindPWModel value, $Res Function(FindPWModel) then) =
      _$FindPWModelCopyWithImpl<$Res, FindPWModel>;
  @useResult
  $Res call({String message, String data, FindPWModelType? type});
}

/// @nodoc
class _$FindPWModelCopyWithImpl<$Res, $Val extends FindPWModel>
    implements $FindPWModelCopyWith<$Res> {
  _$FindPWModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FindPWModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindPWModelImplCopyWith<$Res>
    implements $FindPWModelCopyWith<$Res> {
  factory _$$FindPWModelImplCopyWith(
          _$FindPWModelImpl value, $Res Function(_$FindPWModelImpl) then) =
      __$$FindPWModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String data, FindPWModelType? type});
}

/// @nodoc
class __$$FindPWModelImplCopyWithImpl<$Res>
    extends _$FindPWModelCopyWithImpl<$Res, _$FindPWModelImpl>
    implements _$$FindPWModelImplCopyWith<$Res> {
  __$$FindPWModelImplCopyWithImpl(
      _$FindPWModelImpl _value, $Res Function(_$FindPWModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
    Object? type = freezed,
  }) {
    return _then(_$FindPWModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FindPWModelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FindPWModelImpl extends _FindPWModel {
  _$FindPWModelImpl({required this.message, required this.data, this.type})
      : super._();

  factory _$FindPWModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindPWModelImplFromJson(json);

  @override
  final String message;
  @override
  final String data;
  @override
  final FindPWModelType? type;

  @override
  String toString() {
    return 'FindPWModel(message: $message, data: $data, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindPWModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FindPWModelImplCopyWith<_$FindPWModelImpl> get copyWith =>
      __$$FindPWModelImplCopyWithImpl<_$FindPWModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindPWModelImplToJson(
      this,
    );
  }
}

abstract class _FindPWModel extends FindPWModel {
  factory _FindPWModel(
      {required final String message,
      required final String data,
      final FindPWModelType? type}) = _$FindPWModelImpl;
  _FindPWModel._() : super._();

  factory _FindPWModel.fromJson(Map<String, dynamic> json) =
      _$FindPWModelImpl.fromJson;

  @override
  String get message;
  @override
  String get data;
  @override
  FindPWModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$FindPWModelImplCopyWith<_$FindPWModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FindPWModelError _$FindPWModelErrorFromJson(Map<String, dynamic> json) {
  return _FindPWModelError.fromJson(json);
}

/// @nodoc
mixin _$FindPWModelError {
  String? get exception => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  FindPWModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FindPWModelErrorCopyWith<FindPWModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindPWModelErrorCopyWith<$Res> {
  factory $FindPWModelErrorCopyWith(
          FindPWModelError value, $Res Function(FindPWModelError) then) =
      _$FindPWModelErrorCopyWithImpl<$Res, FindPWModelError>;
  @useResult
  $Res call(
      {String? exception,
      String? code,
      String message,
      String? error,
      int? status,
      FindPWModelType? type});
}

/// @nodoc
class _$FindPWModelErrorCopyWithImpl<$Res, $Val extends FindPWModelError>
    implements $FindPWModelErrorCopyWith<$Res> {
  _$FindPWModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? code = freezed,
    Object? message = null,
    Object? error = freezed,
    Object? status = freezed,
    Object? type = freezed,
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
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FindPWModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindPWModelErrorImplCopyWith<$Res>
    implements $FindPWModelErrorCopyWith<$Res> {
  factory _$$FindPWModelErrorImplCopyWith(_$FindPWModelErrorImpl value,
          $Res Function(_$FindPWModelErrorImpl) then) =
      __$$FindPWModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? exception,
      String? code,
      String message,
      String? error,
      int? status,
      FindPWModelType? type});
}

/// @nodoc
class __$$FindPWModelErrorImplCopyWithImpl<$Res>
    extends _$FindPWModelErrorCopyWithImpl<$Res, _$FindPWModelErrorImpl>
    implements _$$FindPWModelErrorImplCopyWith<$Res> {
  __$$FindPWModelErrorImplCopyWithImpl(_$FindPWModelErrorImpl _value,
      $Res Function(_$FindPWModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? code = freezed,
    Object? message = null,
    Object? error = freezed,
    Object? status = freezed,
    Object? type = freezed,
  }) {
    return _then(_$FindPWModelErrorImpl(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FindPWModelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FindPWModelErrorImpl extends _FindPWModelError {
  _$FindPWModelErrorImpl(
      {this.exception,
      this.code,
      required this.message,
      this.error,
      this.status,
      this.type})
      : super._();

  factory _$FindPWModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindPWModelErrorImplFromJson(json);

  @override
  final String? exception;
  @override
  final String? code;
  @override
  final String message;
  @override
  final String? error;
  @override
  final int? status;
  @override
  final FindPWModelType? type;

  @override
  String toString() {
    return 'FindPWModelError(exception: $exception, code: $code, message: $message, error: $error, status: $status, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindPWModelErrorImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, exception, code, message, error, status, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FindPWModelErrorImplCopyWith<_$FindPWModelErrorImpl> get copyWith =>
      __$$FindPWModelErrorImplCopyWithImpl<_$FindPWModelErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindPWModelErrorImplToJson(
      this,
    );
  }
}

abstract class _FindPWModelError extends FindPWModelError {
  factory _FindPWModelError(
      {final String? exception,
      final String? code,
      required final String message,
      final String? error,
      final int? status,
      final FindPWModelType? type}) = _$FindPWModelErrorImpl;
  _FindPWModelError._() : super._();

  factory _FindPWModelError.fromJson(Map<String, dynamic> json) =
      _$FindPWModelErrorImpl.fromJson;

  @override
  String? get exception;
  @override
  String? get code;
  @override
  String get message;
  @override
  String? get error;
  @override
  int? get status;
  @override
  FindPWModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$FindPWModelErrorImplCopyWith<_$FindPWModelErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
