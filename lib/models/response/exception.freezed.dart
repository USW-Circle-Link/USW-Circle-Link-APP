// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Exception _$ExceptionFromJson(Map<String, dynamic> json) {
  return _Exception.fromJson(json);
}

/// @nodoc
mixin _$Exception {
  @JsonKey(name: "exception")
  String? get exception => throw _privateConstructorUsedError;
  @JsonKey(name: "code")
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "error")
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExceptionCopyWith<Exception> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExceptionCopyWith<$Res> {
  factory $ExceptionCopyWith(Exception value, $Res Function(Exception) then) =
      _$ExceptionCopyWithImpl<$Res, Exception>;
  @useResult
  $Res call(
      {@JsonKey(name: "exception") String? exception,
      @JsonKey(name: "code") String? code,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "status") int? status,
      @JsonKey(name: "error") String? error});
}

/// @nodoc
class _$ExceptionCopyWithImpl<$Res, $Val extends Exception>
    implements $ExceptionCopyWith<$Res> {
  _$ExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExceptionImplCopyWith<$Res>
    implements $ExceptionCopyWith<$Res> {
  factory _$$ExceptionImplCopyWith(
          _$ExceptionImpl value, $Res Function(_$ExceptionImpl) then) =
      __$$ExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "exception") String? exception,
      @JsonKey(name: "code") String? code,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "status") int? status,
      @JsonKey(name: "error") String? error});
}

/// @nodoc
class __$$ExceptionImplCopyWithImpl<$Res>
    extends _$ExceptionCopyWithImpl<$Res, _$ExceptionImpl>
    implements _$$ExceptionImplCopyWith<$Res> {
  __$$ExceptionImplCopyWithImpl(
      _$ExceptionImpl _value, $Res Function(_$ExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ExceptionImpl(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExceptionImpl implements _Exception {
  const _$ExceptionImpl(
      {@JsonKey(name: "exception") this.exception,
      @JsonKey(name: "code") this.code,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "error") this.error});

  factory _$ExceptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExceptionImplFromJson(json);

  @override
  @JsonKey(name: "exception")
  final String? exception;
  @override
  @JsonKey(name: "code")
  final String? code;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "error")
  final String? error;

  @override
  String toString() {
    return 'Exception(exception: $exception, code: $code, message: $message, status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExceptionImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, exception, code, message, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExceptionImplCopyWith<_$ExceptionImpl> get copyWith =>
      __$$ExceptionImplCopyWithImpl<_$ExceptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExceptionImplToJson(
      this,
    );
  }
}

abstract class _Exception implements Exception {
  const factory _Exception(
      {@JsonKey(name: "exception") final String? exception,
      @JsonKey(name: "code") final String? code,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "status") final int? status,
      @JsonKey(name: "error") final String? error}) = _$ExceptionImpl;

  factory _Exception.fromJson(Map<String, dynamic> json) =
      _$ExceptionImpl.fromJson;

  @override
  @JsonKey(name: "exception")
  String? get exception;
  @override
  @JsonKey(name: "code")
  String? get code;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "status")
  int? get status;
  @override
  @JsonKey(name: "error")
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$ExceptionImplCopyWith<_$ExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
