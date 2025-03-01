// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) {
  return _SignUpRequest.fromJson(json);
}

/// @nodoc
mixin _$SignUpRequest {
  @JsonKey(name: "account")
  String get account => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: "confirmPassword")
  String get confirmPassword => throw _privateConstructorUsedError;
  @JsonKey(name: "userName")
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: "telephone")
  String get telephone => throw _privateConstructorUsedError;
  @JsonKey(name: "studentNumber")
  String get studentNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "major")
  String get major => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "emailTokenUUID")
  String? get emailTokenUUID => throw _privateConstructorUsedError;
  @JsonKey(name: "signupUUID")
  String? get signupUUID => throw _privateConstructorUsedError;
  @JsonKey(name: "clubs")
  List<Map<String, String>>? get clubs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpRequestCopyWith<SignUpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpRequestCopyWith<$Res> {
  factory $SignUpRequestCopyWith(
          SignUpRequest value, $Res Function(SignUpRequest) then) =
      _$SignUpRequestCopyWithImpl<$Res, SignUpRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "account") String account,
      @JsonKey(name: "password") String password,
      @JsonKey(name: "confirmPassword") String confirmPassword,
      @JsonKey(name: "userName") String userName,
      @JsonKey(name: "telephone") String telephone,
      @JsonKey(name: "studentNumber") String studentNumber,
      @JsonKey(name: "major") String major,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "emailTokenUUID") String? emailTokenUUID,
      @JsonKey(name: "signupUUID") String? signupUUID,
      @JsonKey(name: "clubs") List<Map<String, String>>? clubs});
}

/// @nodoc
class _$SignUpRequestCopyWithImpl<$Res, $Val extends SignUpRequest>
    implements $SignUpRequestCopyWith<$Res> {
  _$SignUpRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? userName = null,
    Object? telephone = null,
    Object? studentNumber = null,
    Object? major = null,
    Object? email = freezed,
    Object? emailTokenUUID = freezed,
    Object? signupUUID = freezed,
    Object? clubs = freezed,
  }) {
    return _then(_value.copyWith(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      studentNumber: null == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailTokenUUID: freezed == emailTokenUUID
          ? _value.emailTokenUUID
          : emailTokenUUID // ignore: cast_nullable_to_non_nullable
              as String?,
      signupUUID: freezed == signupUUID
          ? _value.signupUUID
          : signupUUID // ignore: cast_nullable_to_non_nullable
              as String?,
      clubs: freezed == clubs
          ? _value.clubs
          : clubs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpRequestImplCopyWith<$Res>
    implements $SignUpRequestCopyWith<$Res> {
  factory _$$SignUpRequestImplCopyWith(
          _$SignUpRequestImpl value, $Res Function(_$SignUpRequestImpl) then) =
      __$$SignUpRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "account") String account,
      @JsonKey(name: "password") String password,
      @JsonKey(name: "confirmPassword") String confirmPassword,
      @JsonKey(name: "userName") String userName,
      @JsonKey(name: "telephone") String telephone,
      @JsonKey(name: "studentNumber") String studentNumber,
      @JsonKey(name: "major") String major,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "emailTokenUUID") String? emailTokenUUID,
      @JsonKey(name: "signupUUID") String? signupUUID,
      @JsonKey(name: "clubs") List<Map<String, String>>? clubs});
}

/// @nodoc
class __$$SignUpRequestImplCopyWithImpl<$Res>
    extends _$SignUpRequestCopyWithImpl<$Res, _$SignUpRequestImpl>
    implements _$$SignUpRequestImplCopyWith<$Res> {
  __$$SignUpRequestImplCopyWithImpl(
      _$SignUpRequestImpl _value, $Res Function(_$SignUpRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? userName = null,
    Object? telephone = null,
    Object? studentNumber = null,
    Object? major = null,
    Object? email = freezed,
    Object? emailTokenUUID = freezed,
    Object? signupUUID = freezed,
    Object? clubs = freezed,
  }) {
    return _then(_$SignUpRequestImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      studentNumber: null == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailTokenUUID: freezed == emailTokenUUID
          ? _value.emailTokenUUID
          : emailTokenUUID // ignore: cast_nullable_to_non_nullable
              as String?,
      signupUUID: freezed == signupUUID
          ? _value.signupUUID
          : signupUUID // ignore: cast_nullable_to_non_nullable
              as String?,
      clubs: freezed == clubs
          ? _value._clubs
          : clubs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpRequestImpl implements _SignUpRequest {
  const _$SignUpRequestImpl(
      {@JsonKey(name: "account") required this.account,
      @JsonKey(name: "password") required this.password,
      @JsonKey(name: "confirmPassword") required this.confirmPassword,
      @JsonKey(name: "userName") required this.userName,
      @JsonKey(name: "telephone") required this.telephone,
      @JsonKey(name: "studentNumber") required this.studentNumber,
      @JsonKey(name: "major") required this.major,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "emailTokenUUID") this.emailTokenUUID,
      @JsonKey(name: "signupUUID") this.signupUUID,
      @JsonKey(name: "clubs") final List<Map<String, String>>? clubs})
      : _clubs = clubs;

  factory _$SignUpRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpRequestImplFromJson(json);

  @override
  @JsonKey(name: "account")
  final String account;
  @override
  @JsonKey(name: "password")
  final String password;
  @override
  @JsonKey(name: "confirmPassword")
  final String confirmPassword;
  @override
  @JsonKey(name: "userName")
  final String userName;
  @override
  @JsonKey(name: "telephone")
  final String telephone;
  @override
  @JsonKey(name: "studentNumber")
  final String studentNumber;
  @override
  @JsonKey(name: "major")
  final String major;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "emailTokenUUID")
  final String? emailTokenUUID;
  @override
  @JsonKey(name: "signupUUID")
  final String? signupUUID;
  final List<Map<String, String>>? _clubs;
  @override
  @JsonKey(name: "clubs")
  List<Map<String, String>>? get clubs {
    final value = _clubs;
    if (value == null) return null;
    if (_clubs is EqualUnmodifiableListView) return _clubs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SignUpRequest(account: $account, password: $password, confirmPassword: $confirmPassword, userName: $userName, telephone: $telephone, studentNumber: $studentNumber, major: $major, email: $email, emailTokenUUID: $emailTokenUUID, signupUUID: $signupUUID, clubs: $clubs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpRequestImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.studentNumber, studentNumber) ||
                other.studentNumber == studentNumber) &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailTokenUUID, emailTokenUUID) ||
                other.emailTokenUUID == emailTokenUUID) &&
            (identical(other.signupUUID, signupUUID) ||
                other.signupUUID == signupUUID) &&
            const DeepCollectionEquality().equals(other._clubs, _clubs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      account,
      password,
      confirmPassword,
      userName,
      telephone,
      studentNumber,
      major,
      email,
      emailTokenUUID,
      signupUUID,
      const DeepCollectionEquality().hash(_clubs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpRequestImplCopyWith<_$SignUpRequestImpl> get copyWith =>
      __$$SignUpRequestImplCopyWithImpl<_$SignUpRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpRequestImplToJson(
      this,
    );
  }
}

abstract class _SignUpRequest implements SignUpRequest {
  const factory _SignUpRequest(
      {@JsonKey(name: "account") required final String account,
      @JsonKey(name: "password") required final String password,
      @JsonKey(name: "confirmPassword") required final String confirmPassword,
      @JsonKey(name: "userName") required final String userName,
      @JsonKey(name: "telephone") required final String telephone,
      @JsonKey(name: "studentNumber") required final String studentNumber,
      @JsonKey(name: "major") required final String major,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "emailTokenUUID") final String? emailTokenUUID,
      @JsonKey(name: "signupUUID") final String? signupUUID,
      @JsonKey(name: "clubs")
      final List<Map<String, String>>? clubs}) = _$SignUpRequestImpl;

  factory _SignUpRequest.fromJson(Map<String, dynamic> json) =
      _$SignUpRequestImpl.fromJson;

  @override
  @JsonKey(name: "account")
  String get account;
  @override
  @JsonKey(name: "password")
  String get password;
  @override
  @JsonKey(name: "confirmPassword")
  String get confirmPassword;
  @override
  @JsonKey(name: "userName")
  String get userName;
  @override
  @JsonKey(name: "telephone")
  String get telephone;
  @override
  @JsonKey(name: "studentNumber")
  String get studentNumber;
  @override
  @JsonKey(name: "major")
  String get major;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "emailTokenUUID")
  String? get emailTokenUUID;
  @override
  @JsonKey(name: "signupUUID")
  String? get signupUUID;
  @override
  @JsonKey(name: "clubs")
  List<Map<String, String>>? get clubs;
  @override
  @JsonKey(ignore: true)
  _$$SignUpRequestImplCopyWith<_$SignUpRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
