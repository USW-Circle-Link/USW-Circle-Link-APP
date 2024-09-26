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

DeleteUserModel _$DeleteUserModelFromJson(Map<String, dynamic> json) {
  return _DeleteUserModel.fromJson(json);
}

/// @nodoc
mixin _$DeleteUserModel {
  String get message => throw _privateConstructorUsedError;
  DeleteUserModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteUserModelCopyWith<DeleteUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteUserModelCopyWith<$Res> {
  factory $DeleteUserModelCopyWith(
          DeleteUserModel value, $Res Function(DeleteUserModel) then) =
      _$DeleteUserModelCopyWithImpl<$Res, DeleteUserModel>;
  @useResult
  $Res call({String message, DeleteUserModelType? type});
}

/// @nodoc
class _$DeleteUserModelCopyWithImpl<$Res, $Val extends DeleteUserModel>
    implements $DeleteUserModelCopyWith<$Res> {
  _$DeleteUserModelCopyWithImpl(this._value, this._then);

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
              as DeleteUserModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteUserModelImplCopyWith<$Res>
    implements $DeleteUserModelCopyWith<$Res> {
  factory _$$DeleteUserModelImplCopyWith(_$DeleteUserModelImpl value,
          $Res Function(_$DeleteUserModelImpl) then) =
      __$$DeleteUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, DeleteUserModelType? type});
}

/// @nodoc
class __$$DeleteUserModelImplCopyWithImpl<$Res>
    extends _$DeleteUserModelCopyWithImpl<$Res, _$DeleteUserModelImpl>
    implements _$$DeleteUserModelImplCopyWith<$Res> {
  __$$DeleteUserModelImplCopyWithImpl(
      _$DeleteUserModelImpl _value, $Res Function(_$DeleteUserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = freezed,
  }) {
    return _then(_$DeleteUserModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeleteUserModelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteUserModelImpl extends _DeleteUserModel {
  _$DeleteUserModelImpl({required this.message, this.type}) : super._();

  factory _$DeleteUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteUserModelImplFromJson(json);

  @override
  final String message;
  @override
  final DeleteUserModelType? type;

  @override
  String toString() {
    return 'DeleteUserModel(message: $message, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteUserModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteUserModelImplCopyWith<_$DeleteUserModelImpl> get copyWith =>
      __$$DeleteUserModelImplCopyWithImpl<_$DeleteUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteUserModelImplToJson(
      this,
    );
  }
}

abstract class _DeleteUserModel extends DeleteUserModel {
  factory _DeleteUserModel(
      {required final String message,
      final DeleteUserModelType? type}) = _$DeleteUserModelImpl;
  _DeleteUserModel._() : super._();

  factory _DeleteUserModel.fromJson(Map<String, dynamic> json) =
      _$DeleteUserModelImpl.fromJson;

  @override
  String get message;
  @override
  DeleteUserModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$DeleteUserModelImplCopyWith<_$DeleteUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
  DeleteUserModelType? get type => throw _privateConstructorUsedError;

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
      String? error,
      DeleteUserModelType? type});
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
              as DeleteUserModelType?,
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
      String? error,
      DeleteUserModelType? type});
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
    Object? type = freezed,
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeleteUserModelType?,
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
      this.error,
      this.type})
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
  final DeleteUserModelType? type;

  @override
  String toString() {
    return 'DeleteUserModelError(message: $message, exception: $exception, code: $code, status: $status, error: $error, type: $type)';
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
      final String? error,
      final DeleteUserModelType? type}) = _$DeleteUserModelErrorImpl;
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
  DeleteUserModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$DeleteUserModelErrorImplCopyWith<_$DeleteUserModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
