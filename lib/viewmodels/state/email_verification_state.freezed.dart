// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_verification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmailVerificationState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSendMailSuccess => throw _privateConstructorUsedError;
  bool get isVerifySuccess => throw _privateConstructorUsedError;
  String get emailTokenUUID => throw _privateConstructorUsedError;
  String get signupUUID => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailVerificationStateCopyWith<EmailVerificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationStateCopyWith<$Res> {
  factory $EmailVerificationStateCopyWith(EmailVerificationState value,
          $Res Function(EmailVerificationState) then) =
      _$EmailVerificationStateCopyWithImpl<$Res, EmailVerificationState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSendMailSuccess,
      bool isVerifySuccess,
      String emailTokenUUID,
      String signupUUID,
      String email,
      String? error});
}

/// @nodoc
class _$EmailVerificationStateCopyWithImpl<$Res,
        $Val extends EmailVerificationState>
    implements $EmailVerificationStateCopyWith<$Res> {
  _$EmailVerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSendMailSuccess = null,
    Object? isVerifySuccess = null,
    Object? emailTokenUUID = null,
    Object? signupUUID = null,
    Object? email = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendMailSuccess: null == isSendMailSuccess
          ? _value.isSendMailSuccess
          : isSendMailSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerifySuccess: null == isVerifySuccess
          ? _value.isVerifySuccess
          : isVerifySuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      emailTokenUUID: null == emailTokenUUID
          ? _value.emailTokenUUID
          : emailTokenUUID // ignore: cast_nullable_to_non_nullable
              as String,
      signupUUID: null == signupUUID
          ? _value.signupUUID
          : signupUUID // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailVerificationStateImplCopyWith<$Res>
    implements $EmailVerificationStateCopyWith<$Res> {
  factory _$$EmailVerificationStateImplCopyWith(
          _$EmailVerificationStateImpl value,
          $Res Function(_$EmailVerificationStateImpl) then) =
      __$$EmailVerificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSendMailSuccess,
      bool isVerifySuccess,
      String emailTokenUUID,
      String signupUUID,
      String email,
      String? error});
}

/// @nodoc
class __$$EmailVerificationStateImplCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res,
        _$EmailVerificationStateImpl>
    implements _$$EmailVerificationStateImplCopyWith<$Res> {
  __$$EmailVerificationStateImplCopyWithImpl(
      _$EmailVerificationStateImpl _value,
      $Res Function(_$EmailVerificationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSendMailSuccess = null,
    Object? isVerifySuccess = null,
    Object? emailTokenUUID = null,
    Object? signupUUID = null,
    Object? email = null,
    Object? error = freezed,
  }) {
    return _then(_$EmailVerificationStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendMailSuccess: null == isSendMailSuccess
          ? _value.isSendMailSuccess
          : isSendMailSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerifySuccess: null == isVerifySuccess
          ? _value.isVerifySuccess
          : isVerifySuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      emailTokenUUID: null == emailTokenUUID
          ? _value.emailTokenUUID
          : emailTokenUUID // ignore: cast_nullable_to_non_nullable
              as String,
      signupUUID: null == signupUUID
          ? _value.signupUUID
          : signupUUID // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EmailVerificationStateImpl implements _EmailVerificationState {
  _$EmailVerificationStateImpl(
      {this.isLoading = false,
      this.isSendMailSuccess = false,
      this.isVerifySuccess = false,
      this.emailTokenUUID = '',
      this.signupUUID = '',
      this.email = '',
      this.error});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSendMailSuccess;
  @override
  @JsonKey()
  final bool isVerifySuccess;
  @override
  @JsonKey()
  final String emailTokenUUID;
  @override
  @JsonKey()
  final String signupUUID;
  @override
  @JsonKey()
  final String email;
  @override
  final String? error;

  @override
  String toString() {
    return 'EmailVerificationState(isLoading: $isLoading, isSendMailSuccess: $isSendMailSuccess, isVerifySuccess: $isVerifySuccess, emailTokenUUID: $emailTokenUUID, signupUUID: $signupUUID, email: $email, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSendMailSuccess, isSendMailSuccess) ||
                other.isSendMailSuccess == isSendMailSuccess) &&
            (identical(other.isVerifySuccess, isVerifySuccess) ||
                other.isVerifySuccess == isVerifySuccess) &&
            (identical(other.emailTokenUUID, emailTokenUUID) ||
                other.emailTokenUUID == emailTokenUUID) &&
            (identical(other.signupUUID, signupUUID) ||
                other.signupUUID == signupUUID) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSendMailSuccess,
      isVerifySuccess, emailTokenUUID, signupUUID, email, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerificationStateImplCopyWith<_$EmailVerificationStateImpl>
      get copyWith => __$$EmailVerificationStateImplCopyWithImpl<
          _$EmailVerificationStateImpl>(this, _$identity);
}

abstract class _EmailVerificationState implements EmailVerificationState {
  factory _EmailVerificationState(
      {final bool isLoading,
      final bool isSendMailSuccess,
      final bool isVerifySuccess,
      final String emailTokenUUID,
      final String signupUUID,
      final String email,
      final String? error}) = _$EmailVerificationStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSendMailSuccess;
  @override
  bool get isVerifySuccess;
  @override
  String get emailTokenUUID;
  @override
  String get signupUUID;
  @override
  String get email;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$EmailVerificationStateImplCopyWith<_$EmailVerificationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
