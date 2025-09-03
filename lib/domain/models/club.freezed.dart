// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Club _$ClubFromJson(Map<String, dynamic> json) {
  return _Club.fromJson(json);
}

/// @nodoc
mixin _$Club {
  /// Club UUID
  String get clubUUID => throw _privateConstructorUsedError;

  /// Club name
  String get clubName => throw _privateConstructorUsedError;

  /// Main photo URL
  String get mainPhoto => throw _privateConstructorUsedError;

  /// Department name
  String get departmentName => throw _privateConstructorUsedError;

  /// Club hashtags
  List<String> get clubHashtags => throw _privateConstructorUsedError;

  /// Serializes this Club to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClubCopyWith<Club> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubCopyWith<$Res> {
  factory $ClubCopyWith(Club value, $Res Function(Club) then) =
      _$ClubCopyWithImpl<$Res, Club>;
  @useResult
  $Res call(
      {String clubUUID,
      String clubName,
      String mainPhoto,
      String departmentName,
      List<String> clubHashtags});
}

/// @nodoc
class _$ClubCopyWithImpl<$Res, $Val extends Club>
    implements $ClubCopyWith<$Res> {
  _$ClubCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubUUID = null,
    Object? clubName = null,
    Object? mainPhoto = null,
    Object? departmentName = null,
    Object? clubHashtags = null,
  }) {
    return _then(_value.copyWith(
      clubUUID: null == clubUUID
          ? _value.clubUUID
          : clubUUID // ignore: cast_nullable_to_non_nullable
              as String,
      clubName: null == clubName
          ? _value.clubName
          : clubName // ignore: cast_nullable_to_non_nullable
              as String,
      mainPhoto: null == mainPhoto
          ? _value.mainPhoto
          : mainPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      clubHashtags: null == clubHashtags
          ? _value.clubHashtags
          : clubHashtags // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      {String clubUUID,
      String clubName,
      String mainPhoto,
      String departmentName,
      List<String> clubHashtags});
}

/// @nodoc
class __$$ClubImplCopyWithImpl<$Res>
    extends _$ClubCopyWithImpl<$Res, _$ClubImpl>
    implements _$$ClubImplCopyWith<$Res> {
  __$$ClubImplCopyWithImpl(_$ClubImpl _value, $Res Function(_$ClubImpl) _then)
      : super(_value, _then);

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubUUID = null,
    Object? clubName = null,
    Object? mainPhoto = null,
    Object? departmentName = null,
    Object? clubHashtags = null,
  }) {
    return _then(_$ClubImpl(
      clubUUID: null == clubUUID
          ? _value.clubUUID
          : clubUUID // ignore: cast_nullable_to_non_nullable
              as String,
      clubName: null == clubName
          ? _value.clubName
          : clubName // ignore: cast_nullable_to_non_nullable
              as String,
      mainPhoto: null == mainPhoto
          ? _value.mainPhoto
          : mainPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      clubHashtags: null == clubHashtags
          ? _value._clubHashtags
          : clubHashtags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubImpl implements _Club {
  const _$ClubImpl(
      {required this.clubUUID,
      required this.clubName,
      required this.mainPhoto,
      required this.departmentName,
      required final List<String> clubHashtags})
      : _clubHashtags = clubHashtags;

  factory _$ClubImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubImplFromJson(json);

  /// Club UUID
  @override
  final String clubUUID;

  /// Club name
  @override
  final String clubName;

  /// Main photo URL
  @override
  final String mainPhoto;

  /// Department name
  @override
  final String departmentName;

  /// Club hashtags
  final List<String> _clubHashtags;

  /// Club hashtags
  @override
  List<String> get clubHashtags {
    if (_clubHashtags is EqualUnmodifiableListView) return _clubHashtags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clubHashtags);
  }

  @override
  String toString() {
    return 'Club(clubUUID: $clubUUID, clubName: $clubName, mainPhoto: $mainPhoto, departmentName: $departmentName, clubHashtags: $clubHashtags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubImpl &&
            (identical(other.clubUUID, clubUUID) ||
                other.clubUUID == clubUUID) &&
            (identical(other.clubName, clubName) ||
                other.clubName == clubName) &&
            (identical(other.mainPhoto, mainPhoto) ||
                other.mainPhoto == mainPhoto) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            const DeepCollectionEquality()
                .equals(other._clubHashtags, _clubHashtags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clubUUID, clubName, mainPhoto,
      departmentName, const DeepCollectionEquality().hash(_clubHashtags));

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {required final String clubUUID,
      required final String clubName,
      required final String mainPhoto,
      required final String departmentName,
      required final List<String> clubHashtags}) = _$ClubImpl;

  factory _Club.fromJson(Map<String, dynamic> json) = _$ClubImpl.fromJson;

  /// Club UUID
  @override
  String get clubUUID;

  /// Club name
  @override
  String get clubName;

  /// Main photo URL
  @override
  String get mainPhoto;

  /// Department name
  @override
  String get departmentName;

  /// Club hashtags
  @override
  List<String> get clubHashtags;

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClubImplCopyWith<_$ClubImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
