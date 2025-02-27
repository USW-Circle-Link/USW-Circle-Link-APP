// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_verification_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmailVerificationResponse _$EmailVerificationResponseFromJson(
    Map<String, dynamic> json) {
  return _EmailVerificationResponse.fromJson(json);
}

/// @nodoc
mixin _$EmailVerificationResponse {
  @JsonKey(name: "message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailVerificationResponseCopyWith<EmailVerificationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationResponseCopyWith<$Res> {
  factory $EmailVerificationResponseCopyWith(EmailVerificationResponse value,
          $Res Function(EmailVerificationResponse) then) =
      _$EmailVerificationResponseCopyWithImpl<$Res, EmailVerificationResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "message") String message,
      @JsonKey(name: "data") Data data});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$EmailVerificationResponseCopyWithImpl<$Res,
        $Val extends EmailVerificationResponse>
    implements $EmailVerificationResponseCopyWith<$Res> {
  _$EmailVerificationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmailVerificationResponseImplCopyWith<$Res>
    implements $EmailVerificationResponseCopyWith<$Res> {
  factory _$$EmailVerificationResponseImplCopyWith(
          _$EmailVerificationResponseImpl value,
          $Res Function(_$EmailVerificationResponseImpl) then) =
      __$$EmailVerificationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "message") String message,
      @JsonKey(name: "data") Data data});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$EmailVerificationResponseImplCopyWithImpl<$Res>
    extends _$EmailVerificationResponseCopyWithImpl<$Res,
        _$EmailVerificationResponseImpl>
    implements _$$EmailVerificationResponseImplCopyWith<$Res> {
  __$$EmailVerificationResponseImplCopyWithImpl(
      _$EmailVerificationResponseImpl _value,
      $Res Function(_$EmailVerificationResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$EmailVerificationResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailVerificationResponseImpl implements _EmailVerificationResponse {
  const _$EmailVerificationResponseImpl(
      {@JsonKey(name: "message") required this.message,
      @JsonKey(name: "data") required this.data});

  factory _$EmailVerificationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailVerificationResponseImplFromJson(json);

  @override
  @JsonKey(name: "message")
  final String message;
  @override
  @JsonKey(name: "data")
  final Data data;

  @override
  String toString() {
    return 'EmailVerificationResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerificationResponseImplCopyWith<_$EmailVerificationResponseImpl>
      get copyWith => __$$EmailVerificationResponseImplCopyWithImpl<
          _$EmailVerificationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailVerificationResponseImplToJson(
      this,
    );
  }
}

abstract class _EmailVerificationResponse implements EmailVerificationResponse {
  const factory _EmailVerificationResponse(
          {@JsonKey(name: "message") required final String message,
          @JsonKey(name: "data") required final Data data}) =
      _$EmailVerificationResponseImpl;

  factory _EmailVerificationResponse.fromJson(Map<String, dynamic> json) =
      _$EmailVerificationResponseImpl.fromJson;

  @override
  @JsonKey(name: "message")
  String get message;
  @override
  @JsonKey(name: "data")
  Data get data;
  @override
  @JsonKey(ignore: true)
  _$$EmailVerificationResponseImplCopyWith<_$EmailVerificationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "emailToken_uuid")
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: "emailToken_uuid") String uuid,
      @JsonKey(name: "email") String email});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "emailToken_uuid") String uuid,
      @JsonKey(name: "email") String email});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? email = null,
  }) {
    return _then(_$DataImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "emailToken_uuid") required this.uuid,
      @JsonKey(name: "email") required this.email});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "emailToken_uuid")
  final String uuid;
  @override
  @JsonKey(name: "email")
  final String email;

  @override
  String toString() {
    return 'Data(uuid: $uuid, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {@JsonKey(name: "emailToken_uuid") required final String uuid,
      @JsonKey(name: "email") required final String email}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "emailToken_uuid")
  String get uuid;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
