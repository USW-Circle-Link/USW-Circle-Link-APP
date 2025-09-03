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
  EmailVerificationData get data => throw _privateConstructorUsedError;

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
      @JsonKey(name: "data") EmailVerificationData data});

  $EmailVerificationDataCopyWith<$Res> get data;
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
              as EmailVerificationData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EmailVerificationDataCopyWith<$Res> get data {
    return $EmailVerificationDataCopyWith<$Res>(_value.data, (value) {
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
      @JsonKey(name: "data") EmailVerificationData data});

  @override
  $EmailVerificationDataCopyWith<$Res> get data;
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
              as EmailVerificationData,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
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
  final EmailVerificationData data;

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
          @JsonKey(name: "data") required final EmailVerificationData data}) =
      _$EmailVerificationResponseImpl;

  factory _EmailVerificationResponse.fromJson(Map<String, dynamic> json) =
      _$EmailVerificationResponseImpl.fromJson;

  @override
  @JsonKey(name: "message")
  String get message;
  @override
  @JsonKey(name: "data")
  EmailVerificationData get data;
  @override
  @JsonKey(ignore: true)
  _$$EmailVerificationResponseImplCopyWith<_$EmailVerificationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EmailVerificationData _$EmailVerificationDataFromJson(
    Map<String, dynamic> json) {
  return _EmailVerificationData.fromJson(json);
}

/// @nodoc
mixin _$EmailVerificationData {
  @JsonKey(name: "emailTokenUUID")
  String get emailTokenUuid => throw _privateConstructorUsedError;
  @JsonKey(name: "signupUUID")
  String get signupUuid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailVerificationDataCopyWith<EmailVerificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationDataCopyWith<$Res> {
  factory $EmailVerificationDataCopyWith(EmailVerificationData value,
          $Res Function(EmailVerificationData) then) =
      _$EmailVerificationDataCopyWithImpl<$Res, EmailVerificationData>;
  @useResult
  $Res call(
      {@JsonKey(name: "emailTokenUUID") String emailTokenUuid,
      @JsonKey(name: "signupUUID") String signupUuid});
}

/// @nodoc
class _$EmailVerificationDataCopyWithImpl<$Res,
        $Val extends EmailVerificationData>
    implements $EmailVerificationDataCopyWith<$Res> {
  _$EmailVerificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailTokenUuid = null,
    Object? signupUuid = null,
  }) {
    return _then(_value.copyWith(
      emailTokenUuid: null == emailTokenUuid
          ? _value.emailTokenUuid
          : emailTokenUuid // ignore: cast_nullable_to_non_nullable
              as String,
      signupUuid: null == signupUuid
          ? _value.signupUuid
          : signupUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailVerificationDataImplCopyWith<$Res>
    implements $EmailVerificationDataCopyWith<$Res> {
  factory _$$EmailVerificationDataImplCopyWith(
          _$EmailVerificationDataImpl value,
          $Res Function(_$EmailVerificationDataImpl) then) =
      __$$EmailVerificationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "emailTokenUUID") String emailTokenUuid,
      @JsonKey(name: "signupUUID") String signupUuid});
}

/// @nodoc
class __$$EmailVerificationDataImplCopyWithImpl<$Res>
    extends _$EmailVerificationDataCopyWithImpl<$Res,
        _$EmailVerificationDataImpl>
    implements _$$EmailVerificationDataImplCopyWith<$Res> {
  __$$EmailVerificationDataImplCopyWithImpl(_$EmailVerificationDataImpl _value,
      $Res Function(_$EmailVerificationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailTokenUuid = null,
    Object? signupUuid = null,
  }) {
    return _then(_$EmailVerificationDataImpl(
      emailTokenUuid: null == emailTokenUuid
          ? _value.emailTokenUuid
          : emailTokenUuid // ignore: cast_nullable_to_non_nullable
              as String,
      signupUuid: null == signupUuid
          ? _value.signupUuid
          : signupUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailVerificationDataImpl implements _EmailVerificationData {
  const _$EmailVerificationDataImpl(
      {@JsonKey(name: "emailTokenUUID") required this.emailTokenUuid,
      @JsonKey(name: "signupUUID") required this.signupUuid});

  factory _$EmailVerificationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailVerificationDataImplFromJson(json);

  @override
  @JsonKey(name: "emailTokenUUID")
  final String emailTokenUuid;
  @override
  @JsonKey(name: "signupUUID")
  final String signupUuid;

  @override
  String toString() {
    return 'EmailVerificationData(emailTokenUuid: $emailTokenUuid, signupUuid: $signupUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationDataImpl &&
            (identical(other.emailTokenUuid, emailTokenUuid) ||
                other.emailTokenUuid == emailTokenUuid) &&
            (identical(other.signupUuid, signupUuid) ||
                other.signupUuid == signupUuid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, emailTokenUuid, signupUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerificationDataImplCopyWith<_$EmailVerificationDataImpl>
      get copyWith => __$$EmailVerificationDataImplCopyWithImpl<
          _$EmailVerificationDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailVerificationDataImplToJson(
      this,
    );
  }
}

abstract class _EmailVerificationData implements EmailVerificationData {
  const factory _EmailVerificationData(
      {@JsonKey(name: "emailTokenUUID") required final String emailTokenUuid,
      @JsonKey(name: "signupUUID")
      required final String signupUuid}) = _$EmailVerificationDataImpl;

  factory _EmailVerificationData.fromJson(Map<String, dynamic> json) =
      _$EmailVerificationDataImpl.fromJson;

  @override
  @JsonKey(name: "emailTokenUUID")
  String get emailTokenUuid;
  @override
  @JsonKey(name: "signupUUID")
  String get signupUuid;
  @override
  @JsonKey(ignore: true)
  _$$EmailVerificationDataImplCopyWith<_$EmailVerificationDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
