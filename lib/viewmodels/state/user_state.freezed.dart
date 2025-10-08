// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserState {
  /// 인증 여부
  bool get isAuthorized => throw _privateConstructorUsedError;

  /// 로딩 상태
  bool get isLoading => throw _privateConstructorUsedError;

  /// 사용자 이름
  String? get userName => throw _privateConstructorUsedError;

  /// 학번
  String? get studentNumber => throw _privateConstructorUsedError;

  /// 전화번호
  String? get userHp => throw _privateConstructorUsedError;

  /// 전공
  String? get major => throw _privateConstructorUsedError;

  /// 에러 정보
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {bool isAuthorized,
      bool isLoading,
      String? userName,
      String? studentNumber,
      String? userHp,
      String? major,
      Exception? error});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthorized = null,
    Object? isLoading = null,
    Object? userName = freezed,
    Object? studentNumber = freezed,
    Object? userHp = freezed,
    Object? major = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isAuthorized: null == isAuthorized
          ? _value.isAuthorized
          : isAuthorized // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentNumber: freezed == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userHp: freezed == userHp
          ? _value.userHp
          : userHp // ignore: cast_nullable_to_non_nullable
              as String?,
      major: freezed == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl value, $Res Function(_$UserStateImpl) then) =
      __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAuthorized,
      bool isLoading,
      String? userName,
      String? studentNumber,
      String? userHp,
      String? major,
      Exception? error});
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl _value, $Res Function(_$UserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthorized = null,
    Object? isLoading = null,
    Object? userName = freezed,
    Object? studentNumber = freezed,
    Object? userHp = freezed,
    Object? major = freezed,
    Object? error = freezed,
  }) {
    return _then(_$UserStateImpl(
      isAuthorized: null == isAuthorized
          ? _value.isAuthorized
          : isAuthorized // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentNumber: freezed == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userHp: freezed == userHp
          ? _value.userHp
          : userHp // ignore: cast_nullable_to_non_nullable
              as String?,
      major: freezed == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$UserStateImpl implements _UserState {
  const _$UserStateImpl(
      {this.isAuthorized = false,
      this.isLoading = false,
      this.userName,
      this.studentNumber,
      this.userHp,
      this.major,
      this.error});

  /// 인증 여부
  @override
  @JsonKey()
  final bool isAuthorized;

  /// 로딩 상태
  @override
  @JsonKey()
  final bool isLoading;

  /// 사용자 이름
  @override
  final String? userName;

  /// 학번
  @override
  final String? studentNumber;

  /// 전화번호
  @override
  final String? userHp;

  /// 전공
  @override
  final String? major;

  /// 에러 정보
  @override
  final Exception? error;

  @override
  String toString() {
    return 'UserState(isAuthorized: $isAuthorized, isLoading: $isLoading, userName: $userName, studentNumber: $studentNumber, userHp: $userHp, major: $major, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.isAuthorized, isAuthorized) ||
                other.isAuthorized == isAuthorized) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.studentNumber, studentNumber) ||
                other.studentNumber == studentNumber) &&
            (identical(other.userHp, userHp) || other.userHp == userHp) &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAuthorized, isLoading,
      userName, studentNumber, userHp, major, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {final bool isAuthorized,
      final bool isLoading,
      final String? userName,
      final String? studentNumber,
      final String? userHp,
      final String? major,
      final Exception? error}) = _$UserStateImpl;

  @override

  /// 인증 여부
  bool get isAuthorized;
  @override

  /// 로딩 상태
  bool get isLoading;
  @override

  /// 사용자 이름
  String? get userName;
  @override

  /// 학번
  String? get studentNumber;
  @override

  /// 전화번호
  String? get userHp;
  @override

  /// 전공
  String? get major;
  @override

  /// 에러 정보
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
