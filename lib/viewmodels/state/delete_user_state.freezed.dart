// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeleteUserState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSendCodeSuccess => throw _privateConstructorUsedError;
  bool get isVerifyCodeSuccess => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isCodeError => throw _privateConstructorUsedError;
  bool get isDialogError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeleteUserStateCopyWith<DeleteUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteUserStateCopyWith<$Res> {
  factory $DeleteUserStateCopyWith(
          DeleteUserState value, $Res Function(DeleteUserState) then) =
      _$DeleteUserStateCopyWithImpl<$Res, DeleteUserState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSendCodeSuccess,
      bool isVerifyCodeSuccess,
      String code,
      String? error,
      bool isCodeError,
      bool isDialogError});
}

/// @nodoc
class _$DeleteUserStateCopyWithImpl<$Res, $Val extends DeleteUserState>
    implements $DeleteUserStateCopyWith<$Res> {
  _$DeleteUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSendCodeSuccess = null,
    Object? isVerifyCodeSuccess = null,
    Object? code = null,
    Object? error = freezed,
    Object? isCodeError = null,
    Object? isDialogError = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendCodeSuccess: null == isSendCodeSuccess
          ? _value.isSendCodeSuccess
          : isSendCodeSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerifyCodeSuccess: null == isVerifyCodeSuccess
          ? _value.isVerifyCodeSuccess
          : isVerifyCodeSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isCodeError: null == isCodeError
          ? _value.isCodeError
          : isCodeError // ignore: cast_nullable_to_non_nullable
              as bool,
      isDialogError: null == isDialogError
          ? _value.isDialogError
          : isDialogError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteUserStateImplCopyWith<$Res>
    implements $DeleteUserStateCopyWith<$Res> {
  factory _$$DeleteUserStateImplCopyWith(_$DeleteUserStateImpl value,
          $Res Function(_$DeleteUserStateImpl) then) =
      __$$DeleteUserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSendCodeSuccess,
      bool isVerifyCodeSuccess,
      String code,
      String? error,
      bool isCodeError,
      bool isDialogError});
}

/// @nodoc
class __$$DeleteUserStateImplCopyWithImpl<$Res>
    extends _$DeleteUserStateCopyWithImpl<$Res, _$DeleteUserStateImpl>
    implements _$$DeleteUserStateImplCopyWith<$Res> {
  __$$DeleteUserStateImplCopyWithImpl(
      _$DeleteUserStateImpl _value, $Res Function(_$DeleteUserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSendCodeSuccess = null,
    Object? isVerifyCodeSuccess = null,
    Object? code = null,
    Object? error = freezed,
    Object? isCodeError = null,
    Object? isDialogError = null,
  }) {
    return _then(_$DeleteUserStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendCodeSuccess: null == isSendCodeSuccess
          ? _value.isSendCodeSuccess
          : isSendCodeSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerifyCodeSuccess: null == isVerifyCodeSuccess
          ? _value.isVerifyCodeSuccess
          : isVerifyCodeSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isCodeError: null == isCodeError
          ? _value.isCodeError
          : isCodeError // ignore: cast_nullable_to_non_nullable
              as bool,
      isDialogError: null == isDialogError
          ? _value.isDialogError
          : isDialogError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DeleteUserStateImpl implements _DeleteUserState {
  _$DeleteUserStateImpl(
      {this.isLoading = false,
      this.isSendCodeSuccess = false,
      this.isVerifyCodeSuccess = false,
      this.code = '',
      this.error,
      this.isCodeError = false,
      this.isDialogError = false});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSendCodeSuccess;
  @override
  @JsonKey()
  final bool isVerifyCodeSuccess;
  @override
  @JsonKey()
  final String code;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool isCodeError;
  @override
  @JsonKey()
  final bool isDialogError;

  @override
  String toString() {
    return 'DeleteUserState(isLoading: $isLoading, isSendCodeSuccess: $isSendCodeSuccess, isVerifyCodeSuccess: $isVerifyCodeSuccess, code: $code, error: $error, isCodeError: $isCodeError, isDialogError: $isDialogError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteUserStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSendCodeSuccess, isSendCodeSuccess) ||
                other.isSendCodeSuccess == isSendCodeSuccess) &&
            (identical(other.isVerifyCodeSuccess, isVerifyCodeSuccess) ||
                other.isVerifyCodeSuccess == isVerifyCodeSuccess) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isCodeError, isCodeError) ||
                other.isCodeError == isCodeError) &&
            (identical(other.isDialogError, isDialogError) ||
                other.isDialogError == isDialogError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSendCodeSuccess,
      isVerifyCodeSuccess, code, error, isCodeError, isDialogError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteUserStateImplCopyWith<_$DeleteUserStateImpl> get copyWith =>
      __$$DeleteUserStateImplCopyWithImpl<_$DeleteUserStateImpl>(
          this, _$identity);
}

abstract class _DeleteUserState implements DeleteUserState {
  factory _DeleteUserState(
      {final bool isLoading,
      final bool isSendCodeSuccess,
      final bool isVerifyCodeSuccess,
      final String code,
      final String? error,
      final bool isCodeError,
      final bool isDialogError}) = _$DeleteUserStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSendCodeSuccess;
  @override
  bool get isVerifyCodeSuccess;
  @override
  String get code;
  @override
  String? get error;
  @override
  bool get isCodeError;
  @override
  bool get isDialogError;
  @override
  @JsonKey(ignore: true)
  _$$DeleteUserStateImplCopyWith<_$DeleteUserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
