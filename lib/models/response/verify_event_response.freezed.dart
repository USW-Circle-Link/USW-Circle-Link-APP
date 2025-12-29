// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_event_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyEventResponse _$VerifyEventResponseFromJson(Map<String, dynamic> json) {
  return _VerifyEventResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyEventResponse {
  String get clubUUID => throw _privateConstructorUsedError;
  bool get isFirstVerify => throw _privateConstructorUsedError;
  @JsonKey(name: "verified_at")
  String get verifiedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyEventResponseCopyWith<VerifyEventResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyEventResponseCopyWith<$Res> {
  factory $VerifyEventResponseCopyWith(
          VerifyEventResponse value, $Res Function(VerifyEventResponse) then) =
      _$VerifyEventResponseCopyWithImpl<$Res, VerifyEventResponse>;
  @useResult
  $Res call(
      {String clubUUID,
      bool isFirstVerify,
      @JsonKey(name: "verified_at") String verifiedAt});
}

/// @nodoc
class _$VerifyEventResponseCopyWithImpl<$Res, $Val extends VerifyEventResponse>
    implements $VerifyEventResponseCopyWith<$Res> {
  _$VerifyEventResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubUUID = null,
    Object? isFirstVerify = null,
    Object? verifiedAt = null,
  }) {
    return _then(_value.copyWith(
      clubUUID: null == clubUUID
          ? _value.clubUUID
          : clubUUID // ignore: cast_nullable_to_non_nullable
              as String,
      isFirstVerify: null == isFirstVerify
          ? _value.isFirstVerify
          : isFirstVerify // ignore: cast_nullable_to_non_nullable
              as bool,
      verifiedAt: null == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyEventResponseImplCopyWith<$Res>
    implements $VerifyEventResponseCopyWith<$Res> {
  factory _$$VerifyEventResponseImplCopyWith(_$VerifyEventResponseImpl value,
          $Res Function(_$VerifyEventResponseImpl) then) =
      __$$VerifyEventResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String clubUUID,
      bool isFirstVerify,
      @JsonKey(name: "verified_at") String verifiedAt});
}

/// @nodoc
class __$$VerifyEventResponseImplCopyWithImpl<$Res>
    extends _$VerifyEventResponseCopyWithImpl<$Res, _$VerifyEventResponseImpl>
    implements _$$VerifyEventResponseImplCopyWith<$Res> {
  __$$VerifyEventResponseImplCopyWithImpl(_$VerifyEventResponseImpl _value,
      $Res Function(_$VerifyEventResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubUUID = null,
    Object? isFirstVerify = null,
    Object? verifiedAt = null,
  }) {
    return _then(_$VerifyEventResponseImpl(
      clubUUID: null == clubUUID
          ? _value.clubUUID
          : clubUUID // ignore: cast_nullable_to_non_nullable
              as String,
      isFirstVerify: null == isFirstVerify
          ? _value.isFirstVerify
          : isFirstVerify // ignore: cast_nullable_to_non_nullable
              as bool,
      verifiedAt: null == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyEventResponseImpl implements _VerifyEventResponse {
  _$VerifyEventResponseImpl(
      {required this.clubUUID,
      required this.isFirstVerify,
      @JsonKey(name: "verified_at") required this.verifiedAt});

  factory _$VerifyEventResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyEventResponseImplFromJson(json);

  @override
  final String clubUUID;
  @override
  final bool isFirstVerify;
  @override
  @JsonKey(name: "verified_at")
  final String verifiedAt;

  @override
  String toString() {
    return 'VerifyEventResponse(clubUUID: $clubUUID, isFirstVerify: $isFirstVerify, verifiedAt: $verifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyEventResponseImpl &&
            (identical(other.clubUUID, clubUUID) ||
                other.clubUUID == clubUUID) &&
            (identical(other.isFirstVerify, isFirstVerify) ||
                other.isFirstVerify == isFirstVerify) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clubUUID, isFirstVerify, verifiedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyEventResponseImplCopyWith<_$VerifyEventResponseImpl> get copyWith =>
      __$$VerifyEventResponseImplCopyWithImpl<_$VerifyEventResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyEventResponseImplToJson(
      this,
    );
  }
}

abstract class _VerifyEventResponse implements VerifyEventResponse {
  factory _VerifyEventResponse(
          {required final String clubUUID,
          required final bool isFirstVerify,
          @JsonKey(name: "verified_at") required final String verifiedAt}) =
      _$VerifyEventResponseImpl;

  factory _VerifyEventResponse.fromJson(Map<String, dynamic> json) =
      _$VerifyEventResponseImpl.fromJson;

  @override
  String get clubUUID;
  @override
  bool get isFirstVerify;
  @override
  @JsonKey(name: "verified_at")
  String get verifiedAt;
  @override
  @JsonKey(ignore: true)
  _$$VerifyEventResponseImplCopyWith<_$VerifyEventResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
