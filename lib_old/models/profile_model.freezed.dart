// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  String get message => throw _privateConstructorUsedError;
  ProfileData get data => throw _privateConstructorUsedError;
  ProfileModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call({String message, ProfileData data, ProfileModelType? type});

  $ProfileDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

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
              as ProfileData,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProfileModelType?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileDataCopyWith<$Res> get data {
    return $ProfileDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
          _$ProfileModelImpl value, $Res Function(_$ProfileModelImpl) then) =
      __$$ProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, ProfileData data, ProfileModelType? type});

  @override
  $ProfileDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
      _$ProfileModelImpl _value, $Res Function(_$ProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
    Object? type = freezed,
  }) {
    return _then(_$ProfileModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProfileData,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProfileModelType?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProfileModelImpl extends _ProfileModel {
  _$ProfileModelImpl({required this.message, required this.data, this.type})
      : super._();

  factory _$ProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileModelImplFromJson(json);

  @override
  final String message;
  @override
  final ProfileData data;
  @override
  final ProfileModelType? type;

  @override
  String toString() {
    return 'ProfileModel(message: $message, data: $data, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
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
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileModel extends ProfileModel {
  factory _ProfileModel(
      {required final String message,
      required final ProfileData data,
      final ProfileModelType? type}) = _$ProfileModelImpl;
  _ProfileModel._() : super._();

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$ProfileModelImpl.fromJson;

  @override
  String get message;
  @override
  ProfileData get data;
  @override
  ProfileModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return _ProfileData.fromJson(json);
}

/// @nodoc
mixin _$ProfileData {
  String get userName => throw _privateConstructorUsedError;
  String get studentNumber => throw _privateConstructorUsedError;
  String get userHp => throw _privateConstructorUsedError;
  String get major => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDataCopyWith<ProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDataCopyWith<$Res> {
  factory $ProfileDataCopyWith(
          ProfileData value, $Res Function(ProfileData) then) =
      _$ProfileDataCopyWithImpl<$Res, ProfileData>;
  @useResult
  $Res call(
      {String userName,
      String studentNumber,
      String userHp,
      String major,
      String? password});
}

/// @nodoc
class _$ProfileDataCopyWithImpl<$Res, $Val extends ProfileData>
    implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? studentNumber = null,
    Object? userHp = null,
    Object? major = null,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      studentNumber: null == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userHp: null == userHp
          ? _value.userHp
          : userHp // ignore: cast_nullable_to_non_nullable
              as String,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileDataImplCopyWith<$Res>
    implements $ProfileDataCopyWith<$Res> {
  factory _$$ProfileDataImplCopyWith(
          _$ProfileDataImpl value, $Res Function(_$ProfileDataImpl) then) =
      __$$ProfileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String studentNumber,
      String userHp,
      String major,
      String? password});
}

/// @nodoc
class __$$ProfileDataImplCopyWithImpl<$Res>
    extends _$ProfileDataCopyWithImpl<$Res, _$ProfileDataImpl>
    implements _$$ProfileDataImplCopyWith<$Res> {
  __$$ProfileDataImplCopyWithImpl(
      _$ProfileDataImpl _value, $Res Function(_$ProfileDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? studentNumber = null,
    Object? userHp = null,
    Object? major = null,
    Object? password = freezed,
  }) {
    return _then(_$ProfileDataImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      studentNumber: null == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userHp: null == userHp
          ? _value.userHp
          : userHp // ignore: cast_nullable_to_non_nullable
              as String,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileDataImpl implements _ProfileData {
  _$ProfileDataImpl(
      {required this.userName,
      required this.studentNumber,
      required this.userHp,
      required this.major,
      required this.password});

  factory _$ProfileDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileDataImplFromJson(json);

  @override
  final String userName;
  @override
  final String studentNumber;
  @override
  final String userHp;
  @override
  final String major;
  @override
  final String? password;

  @override
  String toString() {
    return 'ProfileData(userName: $userName, studentNumber: $studentNumber, userHp: $userHp, major: $major, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDataImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.studentNumber, studentNumber) ||
                other.studentNumber == studentNumber) &&
            (identical(other.userHp, userHp) || other.userHp == userHp) &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userName, studentNumber, userHp, major, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      __$$ProfileDataImplCopyWithImpl<_$ProfileDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileDataImplToJson(
      this,
    );
  }
}

abstract class _ProfileData implements ProfileData {
  factory _ProfileData(
      {required final String userName,
      required final String studentNumber,
      required final String userHp,
      required final String major,
      required final String? password}) = _$ProfileDataImpl;

  factory _ProfileData.fromJson(Map<String, dynamic> json) =
      _$ProfileDataImpl.fromJson;

  @override
  String get userName;
  @override
  String get studentNumber;
  @override
  String get userHp;
  @override
  String get major;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileModelError _$ProfileModelErrorFromJson(Map<String, dynamic> json) {
  return _ProfileModelError.fromJson(json);
}

/// @nodoc
mixin _$ProfileModelError {
  String get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  ProfileModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelErrorCopyWith<ProfileModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelErrorCopyWith<$Res> {
  factory $ProfileModelErrorCopyWith(
          ProfileModelError value, $Res Function(ProfileModelError) then) =
      _$ProfileModelErrorCopyWithImpl<$Res, ProfileModelError>;
  @useResult
  $Res call({String message, String? code, ProfileModelType? type});
}

/// @nodoc
class _$ProfileModelErrorCopyWithImpl<$Res, $Val extends ProfileModelError>
    implements $ProfileModelErrorCopyWith<$Res> {
  _$ProfileModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? type = freezed,
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProfileModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileModelErrorImplCopyWith<$Res>
    implements $ProfileModelErrorCopyWith<$Res> {
  factory _$$ProfileModelErrorImplCopyWith(_$ProfileModelErrorImpl value,
          $Res Function(_$ProfileModelErrorImpl) then) =
      __$$ProfileModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code, ProfileModelType? type});
}

/// @nodoc
class __$$ProfileModelErrorImplCopyWithImpl<$Res>
    extends _$ProfileModelErrorCopyWithImpl<$Res, _$ProfileModelErrorImpl>
    implements _$$ProfileModelErrorImplCopyWith<$Res> {
  __$$ProfileModelErrorImplCopyWithImpl(_$ProfileModelErrorImpl _value,
      $Res Function(_$ProfileModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? type = freezed,
  }) {
    return _then(_$ProfileModelErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProfileModelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileModelErrorImpl extends _ProfileModelError {
  _$ProfileModelErrorImpl({required this.message, this.code, this.type})
      : super._();

  factory _$ProfileModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileModelErrorImplFromJson(json);

  @override
  final String message;
  @override
  final String? code;
  @override
  final ProfileModelType? type;

  @override
  String toString() {
    return 'ProfileModelError(message: $message, code: $code, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, code, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileModelErrorImplCopyWith<_$ProfileModelErrorImpl> get copyWith =>
      __$$ProfileModelErrorImplCopyWithImpl<_$ProfileModelErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileModelErrorImplToJson(
      this,
    );
  }
}

abstract class _ProfileModelError extends ProfileModelError {
  factory _ProfileModelError(
      {required final String message,
      final String? code,
      final ProfileModelType? type}) = _$ProfileModelErrorImpl;
  _ProfileModelError._() : super._();

  factory _ProfileModelError.fromJson(Map<String, dynamic> json) =
      _$ProfileModelErrorImpl.fromJson;

  @override
  String get message;
  @override
  String? get code;
  @override
  ProfileModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$ProfileModelErrorImplCopyWith<_$ProfileModelErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
