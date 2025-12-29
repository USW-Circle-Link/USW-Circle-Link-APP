// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'find_pw_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FindPwState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool? get isSendCodeSuccess => throw _privateConstructorUsedError;
  bool? get isVerifyCodeSuccess => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool? get isCodeError => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FindPwStateCopyWith<FindPwState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindPwStateCopyWith<$Res> {
  factory $FindPwStateCopyWith(
          FindPwState value, $Res Function(FindPwState) then) =
      _$FindPwStateCopyWithImpl<$Res, FindPwState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool? isSendCodeSuccess,
      bool? isVerifyCodeSuccess,
      String? error,
      bool? isCodeError,
      String? uuid});
}

/// @nodoc
class _$FindPwStateCopyWithImpl<$Res, $Val extends FindPwState>
    implements $FindPwStateCopyWith<$Res> {
  _$FindPwStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSendCodeSuccess = freezed,
    Object? isVerifyCodeSuccess = freezed,
    Object? error = freezed,
    Object? isCodeError = freezed,
    Object? uuid = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendCodeSuccess: freezed == isSendCodeSuccess
          ? _value.isSendCodeSuccess
          : isSendCodeSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerifyCodeSuccess: freezed == isVerifyCodeSuccess
          ? _value.isVerifyCodeSuccess
          : isVerifyCodeSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isCodeError: freezed == isCodeError
          ? _value.isCodeError
          : isCodeError // ignore: cast_nullable_to_non_nullable
              as bool?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindPwStateImplCopyWith<$Res>
    implements $FindPwStateCopyWith<$Res> {
  factory _$$FindPwStateImplCopyWith(
          _$FindPwStateImpl value, $Res Function(_$FindPwStateImpl) then) =
      __$$FindPwStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool? isSendCodeSuccess,
      bool? isVerifyCodeSuccess,
      String? error,
      bool? isCodeError,
      String? uuid});
}

/// @nodoc
class __$$FindPwStateImplCopyWithImpl<$Res>
    extends _$FindPwStateCopyWithImpl<$Res, _$FindPwStateImpl>
    implements _$$FindPwStateImplCopyWith<$Res> {
  __$$FindPwStateImplCopyWithImpl(
      _$FindPwStateImpl _value, $Res Function(_$FindPwStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSendCodeSuccess = freezed,
    Object? isVerifyCodeSuccess = freezed,
    Object? error = freezed,
    Object? isCodeError = freezed,
    Object? uuid = freezed,
  }) {
    return _then(_$FindPwStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendCodeSuccess: freezed == isSendCodeSuccess
          ? _value.isSendCodeSuccess
          : isSendCodeSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerifyCodeSuccess: freezed == isVerifyCodeSuccess
          ? _value.isVerifyCodeSuccess
          : isVerifyCodeSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isCodeError: freezed == isCodeError
          ? _value.isCodeError
          : isCodeError // ignore: cast_nullable_to_non_nullable
              as bool?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FindPwStateImpl implements _FindPwState {
  _$FindPwStateImpl(
      {this.isLoading = false,
      this.isSendCodeSuccess,
      this.isVerifyCodeSuccess,
      this.error,
      this.isCodeError,
      this.uuid});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final bool? isSendCodeSuccess;
  @override
  final bool? isVerifyCodeSuccess;
  @override
  final String? error;
  @override
  final bool? isCodeError;
  @override
  final String? uuid;

  @override
  String toString() {
    return 'FindPwState(isLoading: $isLoading, isSendCodeSuccess: $isSendCodeSuccess, isVerifyCodeSuccess: $isVerifyCodeSuccess, error: $error, isCodeError: $isCodeError, uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindPwStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSendCodeSuccess, isSendCodeSuccess) ||
                other.isSendCodeSuccess == isSendCodeSuccess) &&
            (identical(other.isVerifyCodeSuccess, isVerifyCodeSuccess) ||
                other.isVerifyCodeSuccess == isVerifyCodeSuccess) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isCodeError, isCodeError) ||
                other.isCodeError == isCodeError) &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSendCodeSuccess,
      isVerifyCodeSuccess, error, isCodeError, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FindPwStateImplCopyWith<_$FindPwStateImpl> get copyWith =>
      __$$FindPwStateImplCopyWithImpl<_$FindPwStateImpl>(this, _$identity);
}

abstract class _FindPwState implements FindPwState {
  factory _FindPwState(
      {final bool isLoading,
      final bool? isSendCodeSuccess,
      final bool? isVerifyCodeSuccess,
      final String? error,
      final bool? isCodeError,
      final String? uuid}) = _$FindPwStateImpl;

  @override
  bool get isLoading;
  @override
  bool? get isSendCodeSuccess;
  @override
  bool? get isVerifyCodeSuccess;
  @override
  String? get error;
  @override
  bool? get isCodeError;
  @override
  String? get uuid;
  @override
  @JsonKey(ignore: true)
  _$$FindPwStateImplCopyWith<_$FindPwStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
