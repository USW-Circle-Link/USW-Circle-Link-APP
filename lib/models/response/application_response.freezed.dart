// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApplicationResponse _$ApplicationResponseFromJson(Map<String, dynamic> json) {
  return _ApplicationResponse.fromJson(json);
}

/// @nodoc
mixin _$ApplicationResponse {
  String get message => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationResponseCopyWith<ApplicationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationResponseCopyWith<$Res> {
  factory $ApplicationResponseCopyWith(
          ApplicationResponse value, $Res Function(ApplicationResponse) then) =
      _$ApplicationResponseCopyWithImpl<$Res, ApplicationResponse>;
  @useResult
  $Res call({String message, String? data});
}

/// @nodoc
class _$ApplicationResponseCopyWithImpl<$Res, $Val extends ApplicationResponse>
    implements $ApplicationResponseCopyWith<$Res> {
  _$ApplicationResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$ApplicationResponseImplCopyWith<$Res>
    implements $ApplicationResponseCopyWith<$Res> {
  factory _$$ApplicationResponseImplCopyWith(_$ApplicationResponseImpl value,
          $Res Function(_$ApplicationResponseImpl) then) =
      __$$ApplicationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? data});
}

/// @nodoc
class __$$ApplicationResponseImplCopyWithImpl<$Res>
    extends _$ApplicationResponseCopyWithImpl<$Res, _$ApplicationResponseImpl>
    implements _$$ApplicationResponseImplCopyWith<$Res> {
  __$$ApplicationResponseImplCopyWithImpl(_$ApplicationResponseImpl _value,
      $Res Function(_$ApplicationResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$ApplicationResponseImpl(
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
class _$ApplicationResponseImpl implements _ApplicationResponse {
  _$ApplicationResponseImpl({required this.message, this.data});

  factory _$ApplicationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationResponseImplFromJson(json);

  @override
  final String message;
  @override
  final String? data;

  @override
  String toString() {
    return 'ApplicationResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationResponseImplCopyWith<_$ApplicationResponseImpl> get copyWith =>
      __$$ApplicationResponseImplCopyWithImpl<_$ApplicationResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationResponseImplToJson(
      this,
    );
  }
}

abstract class _ApplicationResponse implements ApplicationResponse {
  factory _ApplicationResponse(
      {required final String message,
      final String? data}) = _$ApplicationResponseImpl;

  factory _ApplicationResponse.fromJson(Map<String, dynamic> json) =
      _$ApplicationResponseImpl.fromJson;

  @override
  String get message;
  @override
  String? get data;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationResponseImplCopyWith<_$ApplicationResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
