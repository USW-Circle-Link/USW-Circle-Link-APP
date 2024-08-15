// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'FindIdModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FindIdModel _$FindIdModelFromJson(Map<String, dynamic> json) {
  return _FindIdModel.fromJson(json);
}

/// @nodoc
mixin _$FindIdModel {
  String get message => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;

  /// Serializes this FindIdModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FindIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FindIdModelCopyWith<FindIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindIdModelCopyWith<$Res> {
  factory $FindIdModelCopyWith(
          FindIdModel value, $Res Function(FindIdModel) then) =
      _$FindIdModelCopyWithImpl<$Res, FindIdModel>;
  @useResult
  $Res call({String message, String data});
}

/// @nodoc
class _$FindIdModelCopyWithImpl<$Res, $Val extends FindIdModel>
    implements $FindIdModelCopyWith<$Res> {
  _$FindIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindIdModelImplCopyWith<$Res>
    implements $FindIdModelCopyWith<$Res> {
  factory _$$FindIdModelImplCopyWith(
          _$FindIdModelImpl value, $Res Function(_$FindIdModelImpl) then) =
      __$$FindIdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String data});
}

/// @nodoc
class __$$FindIdModelImplCopyWithImpl<$Res>
    extends _$FindIdModelCopyWithImpl<$Res, _$FindIdModelImpl>
    implements _$$FindIdModelImplCopyWith<$Res> {
  __$$FindIdModelImplCopyWithImpl(
      _$FindIdModelImpl _value, $Res Function(_$FindIdModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FindIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$FindIdModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FindIdModelImpl extends _FindIdModel {
  _$FindIdModelImpl({required this.message, required this.data}) : super._();

  factory _$FindIdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindIdModelImplFromJson(json);

  @override
  final String message;
  @override
  final String data;

  @override
  String toString() {
    return 'FindIdModel(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindIdModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  /// Create a copy of FindIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FindIdModelImplCopyWith<_$FindIdModelImpl> get copyWith =>
      __$$FindIdModelImplCopyWithImpl<_$FindIdModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindIdModelImplToJson(
      this,
    );
  }
}

abstract class _FindIdModel extends FindIdModel {
  factory _FindIdModel(
      {required final String message,
      required final String data}) = _$FindIdModelImpl;
  _FindIdModel._() : super._();

  factory _FindIdModel.fromJson(Map<String, dynamic> json) =
      _$FindIdModelImpl.fromJson;

  @override
  String get message;
  @override
  String get data;

  /// Create a copy of FindIdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FindIdModelImplCopyWith<_$FindIdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FindIdModelError _$FindIdModelErrorFromJson(Map<String, dynamic> json) {
  return _FindIdModelError.fromJson(json);
}

/// @nodoc
mixin _$FindIdModelError {
  String? get exception => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  /// Serializes this FindIdModelError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FindIdModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FindIdModelErrorCopyWith<FindIdModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindIdModelErrorCopyWith<$Res> {
  factory $FindIdModelErrorCopyWith(
          FindIdModelError value, $Res Function(FindIdModelError) then) =
      _$FindIdModelErrorCopyWithImpl<$Res, FindIdModelError>;
  @useResult
  $Res call(
      {String? exception,
      String? code,
      String message,
      String? error,
      int? status});
}

/// @nodoc
class _$FindIdModelErrorCopyWithImpl<$Res, $Val extends FindIdModelError>
    implements $FindIdModelErrorCopyWith<$Res> {
  _$FindIdModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindIdModelError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? code = freezed,
    Object? message = null,
    Object? error = freezed,
    Object? status = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindIdModelErrorImplCopyWith<$Res>
    implements $FindIdModelErrorCopyWith<$Res> {
  factory _$$FindIdModelErrorImplCopyWith(_$FindIdModelErrorImpl value,
          $Res Function(_$FindIdModelErrorImpl) then) =
      __$$FindIdModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? exception,
      String? code,
      String message,
      String? error,
      int? status});
}

/// @nodoc
class __$$FindIdModelErrorImplCopyWithImpl<$Res>
    extends _$FindIdModelErrorCopyWithImpl<$Res, _$FindIdModelErrorImpl>
    implements _$$FindIdModelErrorImplCopyWith<$Res> {
  __$$FindIdModelErrorImplCopyWithImpl(_$FindIdModelErrorImpl _value,
      $Res Function(_$FindIdModelErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of FindIdModelError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? code = freezed,
    Object? message = null,
    Object? error = freezed,
    Object? status = freezed,
  }) {
    return _then(_$FindIdModelErrorImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FindIdModelErrorImpl extends _FindIdModelError {
  _$FindIdModelErrorImpl(
      {this.exception,
      this.code,
      required this.message,
      this.error,
      this.status})
      : super._();

  factory _$FindIdModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindIdModelErrorImplFromJson(json);

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
  String toString() {
    return 'FindIdModelError(exception: $exception, code: $code, message: $message, error: $error, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindIdModelErrorImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, exception, code, message, error, status);

  /// Create a copy of FindIdModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FindIdModelErrorImplCopyWith<_$FindIdModelErrorImpl> get copyWith =>
      __$$FindIdModelErrorImplCopyWithImpl<_$FindIdModelErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindIdModelErrorImplToJson(
      this,
    );
  }
}

abstract class _FindIdModelError extends FindIdModelError {
  factory _FindIdModelError(
      {final String? exception,
      final String? code,
      required final String message,
      final String? error,
      final int? status}) = _$FindIdModelErrorImpl;
  _FindIdModelError._() : super._();

  factory _FindIdModelError.fromJson(Map<String, dynamic> json) =
      _$FindIdModelErrorImpl.fromJson;

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

  /// Create a copy of FindIdModelError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FindIdModelErrorImplCopyWith<_$FindIdModelErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
