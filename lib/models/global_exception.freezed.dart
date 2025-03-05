// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GlobalException {
  String? get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GlobalExceptionCopyWith<GlobalException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalExceptionCopyWith<$Res> {
  factory $GlobalExceptionCopyWith(
          GlobalException value, $Res Function(GlobalException) then) =
      _$GlobalExceptionCopyWithImpl<$Res, GlobalException>;
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class _$GlobalExceptionCopyWithImpl<$Res, $Val extends GlobalException>
    implements $GlobalExceptionCopyWith<$Res> {
  _$GlobalExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlobalExceptionImplCopyWith<$Res>
    implements $GlobalExceptionCopyWith<$Res> {
  factory _$$GlobalExceptionImplCopyWith(_$GlobalExceptionImpl value,
          $Res Function(_$GlobalExceptionImpl) then) =
      __$$GlobalExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class __$$GlobalExceptionImplCopyWithImpl<$Res>
    extends _$GlobalExceptionCopyWithImpl<$Res, _$GlobalExceptionImpl>
    implements _$$GlobalExceptionImplCopyWith<$Res> {
  __$$GlobalExceptionImplCopyWithImpl(
      _$GlobalExceptionImpl _value, $Res Function(_$GlobalExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$GlobalExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GlobalExceptionImpl implements _GlobalException {
  const _$GlobalExceptionImpl({this.message, this.code});

  @override
  final String? message;
  @override
  final String? code;

  @override
  String toString() {
    return 'GlobalException(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalExceptionImplCopyWith<_$GlobalExceptionImpl> get copyWith =>
      __$$GlobalExceptionImplCopyWithImpl<_$GlobalExceptionImpl>(
          this, _$identity);
}

abstract class _GlobalException implements GlobalException {
  const factory _GlobalException({final String? message, final String? code}) =
      _$GlobalExceptionImpl;

  @override
  String? get message;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$GlobalExceptionImplCopyWith<_$GlobalExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
