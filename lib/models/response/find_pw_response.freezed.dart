// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'find_pw_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FindPwResponse _$FindPwResponseFromJson(Map<String, dynamic> json) {
  return _FindPwResponse.fromJson(json);
}

/// @nodoc
mixin _$FindPwResponse {
  String get message => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FindPwResponseCopyWith<FindPwResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindPwResponseCopyWith<$Res> {
  factory $FindPwResponseCopyWith(
          FindPwResponse value, $Res Function(FindPwResponse) then) =
      _$FindPwResponseCopyWithImpl<$Res, FindPwResponse>;
  @useResult
  $Res call({String message, String? data});
}

/// @nodoc
class _$FindPwResponseCopyWithImpl<$Res, $Val extends FindPwResponse>
    implements $FindPwResponseCopyWith<$Res> {
  _$FindPwResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindPwResponseImplCopyWith<$Res>
    implements $FindPwResponseCopyWith<$Res> {
  factory _$$FindPwResponseImplCopyWith(_$FindPwResponseImpl value,
          $Res Function(_$FindPwResponseImpl) then) =
      __$$FindPwResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? data});
}

/// @nodoc
class __$$FindPwResponseImplCopyWithImpl<$Res>
    extends _$FindPwResponseCopyWithImpl<$Res, _$FindPwResponseImpl>
    implements _$$FindPwResponseImplCopyWith<$Res> {
  __$$FindPwResponseImplCopyWithImpl(
      _$FindPwResponseImpl _value, $Res Function(_$FindPwResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$FindPwResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FindPwResponseImpl implements _FindPwResponse {
  _$FindPwResponseImpl({required this.message, this.data});

  factory _$FindPwResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindPwResponseImplFromJson(json);

  @override
  final String message;
  @override
  final String? data;

  @override
  String toString() {
    return 'FindPwResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindPwResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FindPwResponseImplCopyWith<_$FindPwResponseImpl> get copyWith =>
      __$$FindPwResponseImplCopyWithImpl<_$FindPwResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindPwResponseImplToJson(
      this,
    );
  }
}

abstract class _FindPwResponse implements FindPwResponse {
  factory _FindPwResponse({required final String message, final String? data}) =
      _$FindPwResponseImpl;

  factory _FindPwResponse.fromJson(Map<String, dynamic> json) =
      _$FindPwResponseImpl.fromJson;

  @override
  String get message;
  @override
  String? get data;
  @override
  @JsonKey(ignore: true)
  _$$FindPwResponseImplCopyWith<_$FindPwResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
