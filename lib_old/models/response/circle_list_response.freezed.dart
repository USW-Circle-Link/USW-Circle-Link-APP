// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'circle_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CircleListResponse _$CircleListResponseFromJson(Map<String, dynamic> json) {
  return _CircleListResponse.fromJson(json);
}

/// @nodoc
mixin _$CircleListResponse {
  @JsonKey(name: "message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<Club> get clubs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CircleListResponseCopyWith<CircleListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleListResponseCopyWith<$Res> {
  factory $CircleListResponseCopyWith(
          CircleListResponse value, $Res Function(CircleListResponse) then) =
      _$CircleListResponseCopyWithImpl<$Res, CircleListResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "message") String message,
      @JsonKey(name: "data") List<Club> clubs});
}

/// @nodoc
class _$CircleListResponseCopyWithImpl<$Res, $Val extends CircleListResponse>
    implements $CircleListResponseCopyWith<$Res> {
  _$CircleListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? clubs = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      clubs: null == clubs
          ? _value.clubs
          : clubs // ignore: cast_nullable_to_non_nullable
              as List<Club>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CircleListResponseImplCopyWith<$Res>
    implements $CircleListResponseCopyWith<$Res> {
  factory _$$CircleListResponseImplCopyWith(_$CircleListResponseImpl value,
          $Res Function(_$CircleListResponseImpl) then) =
      __$$CircleListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "message") String message,
      @JsonKey(name: "data") List<Club> clubs});
}

/// @nodoc
class __$$CircleListResponseImplCopyWithImpl<$Res>
    extends _$CircleListResponseCopyWithImpl<$Res, _$CircleListResponseImpl>
    implements _$$CircleListResponseImplCopyWith<$Res> {
  __$$CircleListResponseImplCopyWithImpl(_$CircleListResponseImpl _value,
      $Res Function(_$CircleListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? clubs = null,
  }) {
    return _then(_$CircleListResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      clubs: null == clubs
          ? _value._clubs
          : clubs // ignore: cast_nullable_to_non_nullable
              as List<Club>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CircleListResponseImpl implements _CircleListResponse {
  const _$CircleListResponseImpl(
      {@JsonKey(name: "message") required this.message,
      @JsonKey(name: "data") required final List<Club> clubs})
      : _clubs = clubs;

  factory _$CircleListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CircleListResponseImplFromJson(json);

  @override
  @JsonKey(name: "message")
  final String message;
  final List<Club> _clubs;
  @override
  @JsonKey(name: "data")
  List<Club> get clubs {
    if (_clubs is EqualUnmodifiableListView) return _clubs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clubs);
  }

  @override
  String toString() {
    return 'CircleListResponse(message: $message, clubs: $clubs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircleListResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._clubs, _clubs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_clubs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CircleListResponseImplCopyWith<_$CircleListResponseImpl> get copyWith =>
      __$$CircleListResponseImplCopyWithImpl<_$CircleListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CircleListResponseImplToJson(
      this,
    );
  }
}

abstract class _CircleListResponse implements CircleListResponse {
  const factory _CircleListResponse(
          {@JsonKey(name: "message") required final String message,
          @JsonKey(name: "data") required final List<Club> clubs}) =
      _$CircleListResponseImpl;

  factory _CircleListResponse.fromJson(Map<String, dynamic> json) =
      _$CircleListResponseImpl.fromJson;

  @override
  @JsonKey(name: "message")
  String get message;
  @override
  @JsonKey(name: "data")
  List<Club> get clubs;
  @override
  @JsonKey(ignore: true)
  _$$CircleListResponseImplCopyWith<_$CircleListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Club _$ClubFromJson(Map<String, dynamic> json) {
  return _Club.fromJson(json);
}

/// @nodoc
mixin _$Club {
  @JsonKey(name: "clubUUID")
  String get clubUuid => throw _privateConstructorUsedError;
  @JsonKey(name: "clubName")
  String get clubName => throw _privateConstructorUsedError;
  @JsonKey(name: "mainPhoto")
  String? get mainPhoto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClubCopyWith<Club> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubCopyWith<$Res> {
  factory $ClubCopyWith(Club value, $Res Function(Club) then) =
      _$ClubCopyWithImpl<$Res, Club>;
  @useResult
  $Res call(
      {@JsonKey(name: "clubUUID") String clubUuid,
      @JsonKey(name: "clubName") String clubName,
      @JsonKey(name: "mainPhoto") String? mainPhoto});
}

/// @nodoc
class _$ClubCopyWithImpl<$Res, $Val extends Club>
    implements $ClubCopyWith<$Res> {
  _$ClubCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubUuid = null,
    Object? clubName = null,
    Object? mainPhoto = freezed,
  }) {
    return _then(_value.copyWith(
      clubUuid: null == clubUuid
          ? _value.clubUuid
          : clubUuid // ignore: cast_nullable_to_non_nullable
              as String,
      clubName: null == clubName
          ? _value.clubName
          : clubName // ignore: cast_nullable_to_non_nullable
              as String,
      mainPhoto: freezed == mainPhoto
          ? _value.mainPhoto
          : mainPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClubImplCopyWith<$Res> implements $ClubCopyWith<$Res> {
  factory _$$ClubImplCopyWith(
          _$ClubImpl value, $Res Function(_$ClubImpl) then) =
      __$$ClubImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "clubUUID") String clubUuid,
      @JsonKey(name: "clubName") String clubName,
      @JsonKey(name: "mainPhoto") String? mainPhoto});
}

/// @nodoc
class __$$ClubImplCopyWithImpl<$Res>
    extends _$ClubCopyWithImpl<$Res, _$ClubImpl>
    implements _$$ClubImplCopyWith<$Res> {
  __$$ClubImplCopyWithImpl(_$ClubImpl _value, $Res Function(_$ClubImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubUuid = null,
    Object? clubName = null,
    Object? mainPhoto = freezed,
  }) {
    return _then(_$ClubImpl(
      clubUuid: null == clubUuid
          ? _value.clubUuid
          : clubUuid // ignore: cast_nullable_to_non_nullable
              as String,
      clubName: null == clubName
          ? _value.clubName
          : clubName // ignore: cast_nullable_to_non_nullable
              as String,
      mainPhoto: freezed == mainPhoto
          ? _value.mainPhoto
          : mainPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubImpl implements _Club {
  const _$ClubImpl(
      {@JsonKey(name: "clubUUID") required this.clubUuid,
      @JsonKey(name: "clubName") required this.clubName,
      @JsonKey(name: "mainPhoto") required this.mainPhoto});

  factory _$ClubImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubImplFromJson(json);

  @override
  @JsonKey(name: "clubUUID")
  final String clubUuid;
  @override
  @JsonKey(name: "clubName")
  final String clubName;
  @override
  @JsonKey(name: "mainPhoto")
  final String? mainPhoto;

  @override
  String toString() {
    return 'Club(clubUuid: $clubUuid, clubName: $clubName, mainPhoto: $mainPhoto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubImpl &&
            (identical(other.clubUuid, clubUuid) ||
                other.clubUuid == clubUuid) &&
            (identical(other.clubName, clubName) ||
                other.clubName == clubName) &&
            (identical(other.mainPhoto, mainPhoto) ||
                other.mainPhoto == mainPhoto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, clubUuid, clubName, mainPhoto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubImplCopyWith<_$ClubImpl> get copyWith =>
      __$$ClubImplCopyWithImpl<_$ClubImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubImplToJson(
      this,
    );
  }
}

abstract class _Club implements Club {
  const factory _Club(
          {@JsonKey(name: "clubUUID") required final String clubUuid,
          @JsonKey(name: "clubName") required final String clubName,
          @JsonKey(name: "mainPhoto") required final String? mainPhoto}) =
      _$ClubImpl;

  factory _Club.fromJson(Map<String, dynamic> json) = _$ClubImpl.fromJson;

  @override
  @JsonKey(name: "clubUUID")
  String get clubUuid;
  @override
  @JsonKey(name: "clubName")
  String get clubName;
  @override
  @JsonKey(name: "mainPhoto")
  String? get mainPhoto;
  @override
  @JsonKey(ignore: true)
  _$$ClubImplCopyWith<_$ClubImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
