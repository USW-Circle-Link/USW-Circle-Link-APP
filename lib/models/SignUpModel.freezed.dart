// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SignUpModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) {
  return _SignUpModel.fromJson(json);
}

/// @nodoc
mixin _$SignUpModel {
  SignUpModelType? get type => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  SignUpData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpModelCopyWith<SignUpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpModelCopyWith<$Res> {
  factory $SignUpModelCopyWith(
          SignUpModel value, $Res Function(SignUpModel) then) =
      _$SignUpModelCopyWithImpl<$Res, SignUpModel>;
  @useResult
  $Res call({SignUpModelType? type, String message, SignUpData? data});

  $SignUpDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SignUpModelCopyWithImpl<$Res, $Val extends SignUpModel>
    implements $SignUpModelCopyWith<$Res> {
  _$SignUpModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SignUpModelType?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SignUpData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SignUpDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SignUpDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignUpModelImplCopyWith<$Res>
    implements $SignUpModelCopyWith<$Res> {
  factory _$$SignUpModelImplCopyWith(
          _$SignUpModelImpl value, $Res Function(_$SignUpModelImpl) then) =
      __$$SignUpModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SignUpModelType? type, String message, SignUpData? data});

  @override
  $SignUpDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SignUpModelImplCopyWithImpl<$Res>
    extends _$SignUpModelCopyWithImpl<$Res, _$SignUpModelImpl>
    implements _$$SignUpModelImplCopyWith<$Res> {
  __$$SignUpModelImplCopyWithImpl(
      _$SignUpModelImpl _value, $Res Function(_$SignUpModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$SignUpModelImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SignUpModelType?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SignUpData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SignUpModelImpl extends _SignUpModel {
  _$SignUpModelImpl({this.type, required this.message, this.data}) : super._();

  factory _$SignUpModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpModelImplFromJson(json);

  @override
  final SignUpModelType? type;
  @override
  final String message;
  @override
  final SignUpData? data;

  @override
  String toString() {
    return 'SignUpModel(type: $type, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpModelImplCopyWith<_$SignUpModelImpl> get copyWith =>
      __$$SignUpModelImplCopyWithImpl<_$SignUpModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpModelImplToJson(
      this,
    );
  }
}

abstract class _SignUpModel extends SignUpModel {
  factory _SignUpModel(
      {final SignUpModelType? type,
      required final String message,
      final SignUpData? data}) = _$SignUpModelImpl;
  _SignUpModel._() : super._();

  factory _SignUpModel.fromJson(Map<String, dynamic> json) =
      _$SignUpModelImpl.fromJson;

  @override
  SignUpModelType? get type;
  @override
  String get message;
  @override
  SignUpData? get data;
  @override
  @JsonKey(ignore: true)
  _$$SignUpModelImplCopyWith<_$SignUpModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignUpData _$SignUpDataFromJson(Map<String, dynamic> json) {
  return _SignUpData.fromJson(json);
}

/// @nodoc
mixin _$SignUpData {
  String get emailTokenId => throw _privateConstructorUsedError;
  String get account => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpDataCopyWith<SignUpData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpDataCopyWith<$Res> {
  factory $SignUpDataCopyWith(
          SignUpData value, $Res Function(SignUpData) then) =
      _$SignUpDataCopyWithImpl<$Res, SignUpData>;
  @useResult
  $Res call({String emailTokenId, String account});
}

/// @nodoc
class _$SignUpDataCopyWithImpl<$Res, $Val extends SignUpData>
    implements $SignUpDataCopyWith<$Res> {
  _$SignUpDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailTokenId = null,
    Object? account = null,
  }) {
    return _then(_value.copyWith(
      emailTokenId: null == emailTokenId
          ? _value.emailTokenId
          : emailTokenId // ignore: cast_nullable_to_non_nullable
              as String,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpDataImplCopyWith<$Res>
    implements $SignUpDataCopyWith<$Res> {
  factory _$$SignUpDataImplCopyWith(
          _$SignUpDataImpl value, $Res Function(_$SignUpDataImpl) then) =
      __$$SignUpDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String emailTokenId, String account});
}

/// @nodoc
class __$$SignUpDataImplCopyWithImpl<$Res>
    extends _$SignUpDataCopyWithImpl<$Res, _$SignUpDataImpl>
    implements _$$SignUpDataImplCopyWith<$Res> {
  __$$SignUpDataImplCopyWithImpl(
      _$SignUpDataImpl _value, $Res Function(_$SignUpDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailTokenId = null,
    Object? account = null,
  }) {
    return _then(_$SignUpDataImpl(
      emailTokenId: null == emailTokenId
          ? _value.emailTokenId
          : emailTokenId // ignore: cast_nullable_to_non_nullable
              as String,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpDataImpl implements _SignUpData {
  _$SignUpDataImpl({required this.emailTokenId, required this.account});

  factory _$SignUpDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpDataImplFromJson(json);

  @override
  final String emailTokenId;
  @override
  final String account;

  @override
  String toString() {
    return 'SignUpData(emailTokenId: $emailTokenId, account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpDataImpl &&
            (identical(other.emailTokenId, emailTokenId) ||
                other.emailTokenId == emailTokenId) &&
            (identical(other.account, account) || other.account == account));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, emailTokenId, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpDataImplCopyWith<_$SignUpDataImpl> get copyWith =>
      __$$SignUpDataImplCopyWithImpl<_$SignUpDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpDataImplToJson(
      this,
    );
  }
}

abstract class _SignUpData implements SignUpData {
  factory _SignUpData(
      {required final String emailTokenId,
      required final String account}) = _$SignUpDataImpl;

  factory _SignUpData.fromJson(Map<String, dynamic> json) =
      _$SignUpDataImpl.fromJson;

  @override
  String get emailTokenId;
  @override
  String get account;
  @override
  @JsonKey(ignore: true)
  _$$SignUpDataImplCopyWith<_$SignUpDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignUpModelError _$SignUpModelErrorFromJson(Map<String, dynamic> json) {
  return _SignUpModelError.fromJson(json);
}

/// @nodoc
mixin _$SignUpModelError {
  SignUpModelType? get type => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpModelErrorCopyWith<SignUpModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpModelErrorCopyWith<$Res> {
  factory $SignUpModelErrorCopyWith(
          SignUpModelError value, $Res Function(SignUpModelError) then) =
      _$SignUpModelErrorCopyWithImpl<$Res, SignUpModelError>;
  @useResult
  $Res call(
      {SignUpModelType? type,
      String? exception,
      String? code,
      String? error,
      int? status,
      String message});
}

/// @nodoc
class _$SignUpModelErrorCopyWithImpl<$Res, $Val extends SignUpModelError>
    implements $SignUpModelErrorCopyWith<$Res> {
  _$SignUpModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? exception = freezed,
    Object? code = freezed,
    Object? error = freezed,
    Object? status = freezed,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SignUpModelType?,
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
abstract class _$$SignUpModelErrorImplCopyWith<$Res>
    implements $SignUpModelErrorCopyWith<$Res> {
  factory _$$SignUpModelErrorImplCopyWith(_$SignUpModelErrorImpl value,
          $Res Function(_$SignUpModelErrorImpl) then) =
      __$$SignUpModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SignUpModelType? type,
      String? exception,
      String? code,
      String? error,
      int? status,
      String message});
}

/// @nodoc
class __$$SignUpModelErrorImplCopyWithImpl<$Res>
    extends _$SignUpModelErrorCopyWithImpl<$Res, _$SignUpModelErrorImpl>
    implements _$$SignUpModelErrorImplCopyWith<$Res> {
  __$$SignUpModelErrorImplCopyWithImpl(_$SignUpModelErrorImpl _value,
      $Res Function(_$SignUpModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? exception = freezed,
    Object? code = freezed,
    Object? error = freezed,
    Object? status = freezed,
    Object? message = null,
  }) {
    return _then(_$SignUpModelErrorImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SignUpModelType?,
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
class _$SignUpModelErrorImpl extends _SignUpModelError {
  _$SignUpModelErrorImpl(
      {this.type,
      this.exception,
      this.code,
      this.error,
      this.status,
      required this.message})
      : super._();

  factory _$SignUpModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpModelErrorImplFromJson(json);

  @override
  final SignUpModelType? type;
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
    return 'SignUpModelError(type: $type, exception: $exception, code: $code, error: $error, status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpModelErrorImpl &&
            (identical(other.type, type) || other.type == type) &&
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
      Object.hash(runtimeType, type, exception, code, error, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpModelErrorImplCopyWith<_$SignUpModelErrorImpl> get copyWith =>
      __$$SignUpModelErrorImplCopyWithImpl<_$SignUpModelErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpModelErrorImplToJson(
      this,
    );
  }
}

abstract class _SignUpModelError extends SignUpModelError {
  factory _SignUpModelError(
      {final SignUpModelType? type,
      final String? exception,
      final String? code,
      final String? error,
      final int? status,
      required final String message}) = _$SignUpModelErrorImpl;
  _SignUpModelError._() : super._();

  factory _SignUpModelError.fromJson(Map<String, dynamic> json) =
      _$SignUpModelErrorImpl.fromJson;

  @override
  SignUpModelType? get type;
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
  _$$SignUpModelErrorImplCopyWith<_$SignUpModelErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
