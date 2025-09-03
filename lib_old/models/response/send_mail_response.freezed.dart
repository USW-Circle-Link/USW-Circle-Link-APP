// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_mail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendMailResponse _$SendMailResponseFromJson(Map<String, dynamic> json) {
  return _SendMailResponse.fromJson(json);
}

/// @nodoc
mixin _$SendMailResponse {
  @JsonKey(name: "message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  SendMailData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendMailResponseCopyWith<SendMailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMailResponseCopyWith<$Res> {
  factory $SendMailResponseCopyWith(
          SendMailResponse value, $Res Function(SendMailResponse) then) =
      _$SendMailResponseCopyWithImpl<$Res, SendMailResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "message") String message,
      @JsonKey(name: "data") SendMailData data});

  $SendMailDataCopyWith<$Res> get data;
}

/// @nodoc
class _$SendMailResponseCopyWithImpl<$Res, $Val extends SendMailResponse>
    implements $SendMailResponseCopyWith<$Res> {
  _$SendMailResponseCopyWithImpl(this._value, this._then);

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
              as SendMailData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SendMailDataCopyWith<$Res> get data {
    return $SendMailDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SendMailResponseImplCopyWith<$Res>
    implements $SendMailResponseCopyWith<$Res> {
  factory _$$SendMailResponseImplCopyWith(_$SendMailResponseImpl value,
          $Res Function(_$SendMailResponseImpl) then) =
      __$$SendMailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "message") String message,
      @JsonKey(name: "data") SendMailData data});

  @override
  $SendMailDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$SendMailResponseImplCopyWithImpl<$Res>
    extends _$SendMailResponseCopyWithImpl<$Res, _$SendMailResponseImpl>
    implements _$$SendMailResponseImplCopyWith<$Res> {
  __$$SendMailResponseImplCopyWithImpl(_$SendMailResponseImpl _value,
      $Res Function(_$SendMailResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$SendMailResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SendMailData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendMailResponseImpl implements _SendMailResponse {
  const _$SendMailResponseImpl(
      {@JsonKey(name: "message") required this.message,
      @JsonKey(name: "data") required this.data});

  factory _$SendMailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendMailResponseImplFromJson(json);

  @override
  @JsonKey(name: "message")
  final String message;
  @override
  @JsonKey(name: "data")
  final SendMailData data;

  @override
  String toString() {
    return 'SendMailResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMailResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMailResponseImplCopyWith<_$SendMailResponseImpl> get copyWith =>
      __$$SendMailResponseImplCopyWithImpl<_$SendMailResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendMailResponseImplToJson(
      this,
    );
  }
}

abstract class _SendMailResponse implements SendMailResponse {
  const factory _SendMailResponse(
          {@JsonKey(name: "message") required final String message,
          @JsonKey(name: "data") required final SendMailData data}) =
      _$SendMailResponseImpl;

  factory _SendMailResponse.fromJson(Map<String, dynamic> json) =
      _$SendMailResponseImpl.fromJson;

  @override
  @JsonKey(name: "message")
  String get message;
  @override
  @JsonKey(name: "data")
  SendMailData get data;
  @override
  @JsonKey(ignore: true)
  _$$SendMailResponseImplCopyWith<_$SendMailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SendMailData _$SendMailDataFromJson(Map<String, dynamic> json) {
  return _SendMailData.fromJson(json);
}

/// @nodoc
mixin _$SendMailData {
  @JsonKey(name: "emailToken_uuid")
  String get emailTokenUUID => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendMailDataCopyWith<SendMailData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMailDataCopyWith<$Res> {
  factory $SendMailDataCopyWith(
          SendMailData value, $Res Function(SendMailData) then) =
      _$SendMailDataCopyWithImpl<$Res, SendMailData>;
  @useResult
  $Res call(
      {@JsonKey(name: "emailToken_uuid") String emailTokenUUID,
      @JsonKey(name: "email") String email});
}

/// @nodoc
class _$SendMailDataCopyWithImpl<$Res, $Val extends SendMailData>
    implements $SendMailDataCopyWith<$Res> {
  _$SendMailDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailTokenUUID = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      emailTokenUUID: null == emailTokenUUID
          ? _value.emailTokenUUID
          : emailTokenUUID // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendMailDataImplCopyWith<$Res>
    implements $SendMailDataCopyWith<$Res> {
  factory _$$SendMailDataImplCopyWith(
          _$SendMailDataImpl value, $Res Function(_$SendMailDataImpl) then) =
      __$$SendMailDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "emailToken_uuid") String emailTokenUUID,
      @JsonKey(name: "email") String email});
}

/// @nodoc
class __$$SendMailDataImplCopyWithImpl<$Res>
    extends _$SendMailDataCopyWithImpl<$Res, _$SendMailDataImpl>
    implements _$$SendMailDataImplCopyWith<$Res> {
  __$$SendMailDataImplCopyWithImpl(
      _$SendMailDataImpl _value, $Res Function(_$SendMailDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailTokenUUID = null,
    Object? email = null,
  }) {
    return _then(_$SendMailDataImpl(
      emailTokenUUID: null == emailTokenUUID
          ? _value.emailTokenUUID
          : emailTokenUUID // ignore: cast_nullable_to_non_nullable
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
class _$SendMailDataImpl implements _SendMailData {
  const _$SendMailDataImpl(
      {@JsonKey(name: "emailToken_uuid") required this.emailTokenUUID,
      @JsonKey(name: "email") required this.email});

  factory _$SendMailDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendMailDataImplFromJson(json);

  @override
  @JsonKey(name: "emailToken_uuid")
  final String emailTokenUUID;
  @override
  @JsonKey(name: "email")
  final String email;

  @override
  String toString() {
    return 'SendMailData(emailTokenUUID: $emailTokenUUID, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMailDataImpl &&
            (identical(other.emailTokenUUID, emailTokenUUID) ||
                other.emailTokenUUID == emailTokenUUID) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, emailTokenUUID, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMailDataImplCopyWith<_$SendMailDataImpl> get copyWith =>
      __$$SendMailDataImplCopyWithImpl<_$SendMailDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendMailDataImplToJson(
      this,
    );
  }
}

abstract class _SendMailData implements SendMailData {
  const factory _SendMailData(
      {@JsonKey(name: "emailToken_uuid") required final String emailTokenUUID,
      @JsonKey(name: "email")
      required final String email}) = _$SendMailDataImpl;

  factory _SendMailData.fromJson(Map<String, dynamic> json) =
      _$SendMailDataImpl.fromJson;

  @override
  @JsonKey(name: "emailToken_uuid")
  String get emailTokenUUID;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$SendMailDataImplCopyWith<_$SendMailDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
