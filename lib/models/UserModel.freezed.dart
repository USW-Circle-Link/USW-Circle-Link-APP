// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'UserModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get message => throw _privateConstructorUsedError;
  @JWTConverter()
  LoginData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({String message, @JWTConverter() LoginData data});

  $LoginDataCopyWith<$Res> get data;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              as LoginData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginDataCopyWith<$Res> get data {
    return $LoginDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, @JWTConverter() LoginData data});

  @override
  $LoginDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$UserModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {required this.message, @JWTConverter() required this.data});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String message;
  @override
  @JWTConverter()
  final LoginData data;

  @override
  String toString() {
    return 'UserModel(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final String message,
      @JWTConverter() required final LoginData data}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get message;
  @override
  @JWTConverter()
  LoginData get data;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginData _$LoginDataFromJson(Map<String, dynamic> json) {
  return _LoginData.fromJson(json);
}

/// @nodoc
mixin _$LoginData {
  String get accessToken => throw _privateConstructorUsedError;
  List<String>? get clubIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDataCopyWith<LoginData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDataCopyWith<$Res> {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) then) =
      _$LoginDataCopyWithImpl<$Res, LoginData>;
  @useResult
  $Res call({String accessToken, List<String>? clubIds});
}

/// @nodoc
class _$LoginDataCopyWithImpl<$Res, $Val extends LoginData>
    implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? clubIds = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      clubIds: freezed == clubIds
          ? _value.clubIds
          : clubIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginDataImplCopyWith<$Res>
    implements $LoginDataCopyWith<$Res> {
  factory _$$LoginDataImplCopyWith(
          _$LoginDataImpl value, $Res Function(_$LoginDataImpl) then) =
      __$$LoginDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, List<String>? clubIds});
}

/// @nodoc
class __$$LoginDataImplCopyWithImpl<$Res>
    extends _$LoginDataCopyWithImpl<$Res, _$LoginDataImpl>
    implements _$$LoginDataImplCopyWith<$Res> {
  __$$LoginDataImplCopyWithImpl(
      _$LoginDataImpl _value, $Res Function(_$LoginDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? clubIds = freezed,
  }) {
    return _then(_$LoginDataImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      clubIds: freezed == clubIds
          ? _value._clubIds
          : clubIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginDataImpl implements _LoginData {
  _$LoginDataImpl({required this.accessToken, final List<String>? clubIds})
      : _clubIds = clubIds;

  factory _$LoginDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginDataImplFromJson(json);

  @override
  final String accessToken;
  final List<String>? _clubIds;
  @override
  List<String>? get clubIds {
    final value = _clubIds;
    if (value == null) return null;
    if (_clubIds is EqualUnmodifiableListView) return _clubIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LoginData(accessToken: $accessToken, clubIds: $clubIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDataImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            const DeepCollectionEquality().equals(other._clubIds, _clubIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, accessToken, const DeepCollectionEquality().hash(_clubIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDataImplCopyWith<_$LoginDataImpl> get copyWith =>
      __$$LoginDataImplCopyWithImpl<_$LoginDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginDataImplToJson(
      this,
    );
  }
}

abstract class _LoginData implements LoginData {
  factory _LoginData(
      {required final String accessToken,
      final List<String>? clubIds}) = _$LoginDataImpl;

  factory _LoginData.fromJson(Map<String, dynamic> json) =
      _$LoginDataImpl.fromJson;

  @override
  String get accessToken;
  @override
  List<String>? get clubIds;
  @override
  @JsonKey(ignore: true)
  _$$LoginDataImplCopyWith<_$LoginDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserModelError _$UserModelErrorFromJson(Map<String, dynamic> json) {
  return _UserModelError.fromJson(json);
}

/// @nodoc
mixin _$UserModelError {
  String get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelErrorCopyWith<UserModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelErrorCopyWith<$Res> {
  factory $UserModelErrorCopyWith(
          UserModelError value, $Res Function(UserModelError) then) =
      _$UserModelErrorCopyWithImpl<$Res, UserModelError>;
  @useResult
  $Res call(
      {String message,
      String? code,
      String? exception,
      String? error,
      int? status});
}

/// @nodoc
class _$UserModelErrorCopyWithImpl<$Res, $Val extends UserModelError>
    implements $UserModelErrorCopyWith<$Res> {
  _$UserModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? exception = freezed,
    Object? error = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$UserModelErrorImplCopyWith<$Res>
    implements $UserModelErrorCopyWith<$Res> {
  factory _$$UserModelErrorImplCopyWith(_$UserModelErrorImpl value,
          $Res Function(_$UserModelErrorImpl) then) =
      __$$UserModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String? code,
      String? exception,
      String? error,
      int? status});
}

/// @nodoc
class __$$UserModelErrorImplCopyWithImpl<$Res>
    extends _$UserModelErrorCopyWithImpl<$Res, _$UserModelErrorImpl>
    implements _$$UserModelErrorImplCopyWith<$Res> {
  __$$UserModelErrorImplCopyWithImpl(
      _$UserModelErrorImpl _value, $Res Function(_$UserModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? exception = freezed,
    Object? error = freezed,
    Object? status = freezed,
  }) {
    return _then(_$UserModelErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$UserModelErrorImpl implements _UserModelError {
  _$UserModelErrorImpl(
      {required this.message,
      this.code,
      this.exception,
      this.error,
      this.status});

  factory _$UserModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelErrorImplFromJson(json);

  @override
  final String message;
  @override
  final String? code;
  @override
  final String? exception;
  @override
  final String? error;
  @override
  final int? status;

  @override
  String toString() {
    return 'UserModelError(message: $message, code: $code, exception: $exception, error: $error, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, code, exception, error, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelErrorImplCopyWith<_$UserModelErrorImpl> get copyWith =>
      __$$UserModelErrorImplCopyWithImpl<_$UserModelErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelErrorImplToJson(
      this,
    );
  }
}

abstract class _UserModelError implements UserModelError {
  factory _UserModelError(
      {required final String message,
      final String? code,
      final String? exception,
      final String? error,
      final int? status}) = _$UserModelErrorImpl;

  factory _UserModelError.fromJson(Map<String, dynamic> json) =
      _$UserModelErrorImpl.fromJson;

  @override
  String get message;
  @override
  String? get code;
  @override
  String? get exception;
  @override
  String? get error;
  @override
  int? get status;
  @override
  @JsonKey(ignore: true)
  _$$UserModelErrorImplCopyWith<_$UserModelErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
