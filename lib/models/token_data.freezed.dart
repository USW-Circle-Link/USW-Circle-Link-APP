// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TokenData {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  List<String> get clubUUIDs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenDataCopyWith<TokenData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenDataCopyWith<$Res> {
  factory $TokenDataCopyWith(TokenData value, $Res Function(TokenData) then) =
      _$TokenDataCopyWithImpl<$Res, TokenData>;
  @useResult
  $Res call({String accessToken, String refreshToken, List<String> clubUUIDs});
}

/// @nodoc
class _$TokenDataCopyWithImpl<$Res, $Val extends TokenData>
    implements $TokenDataCopyWith<$Res> {
  _$TokenDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? clubUUIDs = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      clubUUIDs: null == clubUUIDs
          ? _value.clubUUIDs
          : clubUUIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenDataImplCopyWith<$Res>
    implements $TokenDataCopyWith<$Res> {
  factory _$$TokenDataImplCopyWith(
          _$TokenDataImpl value, $Res Function(_$TokenDataImpl) then) =
      __$$TokenDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken, List<String> clubUUIDs});
}

/// @nodoc
class __$$TokenDataImplCopyWithImpl<$Res>
    extends _$TokenDataCopyWithImpl<$Res, _$TokenDataImpl>
    implements _$$TokenDataImplCopyWith<$Res> {
  __$$TokenDataImplCopyWithImpl(
      _$TokenDataImpl _value, $Res Function(_$TokenDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? clubUUIDs = null,
  }) {
    return _then(_$TokenDataImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      clubUUIDs: null == clubUUIDs
          ? _value._clubUUIDs
          : clubUUIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$TokenDataImpl implements _TokenData {
  const _$TokenDataImpl(
      {required this.accessToken,
      required this.refreshToken,
      required final List<String> clubUUIDs})
      : _clubUUIDs = clubUUIDs;

  @override
  final String accessToken;
  @override
  final String refreshToken;
  final List<String> _clubUUIDs;
  @override
  List<String> get clubUUIDs {
    if (_clubUUIDs is EqualUnmodifiableListView) return _clubUUIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clubUUIDs);
  }

  @override
  String toString() {
    return 'TokenData(accessToken: $accessToken, refreshToken: $refreshToken, clubUUIDs: $clubUUIDs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenDataImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            const DeepCollectionEquality()
                .equals(other._clubUUIDs, _clubUUIDs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken,
      const DeepCollectionEquality().hash(_clubUUIDs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenDataImplCopyWith<_$TokenDataImpl> get copyWith =>
      __$$TokenDataImplCopyWithImpl<_$TokenDataImpl>(this, _$identity);
}

abstract class _TokenData implements TokenData {
  const factory _TokenData(
      {required final String accessToken,
      required final String refreshToken,
      required final List<String> clubUUIDs}) = _$TokenDataImpl;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  List<String> get clubUUIDs;
  @override
  @JsonKey(ignore: true)
  _$$TokenDataImplCopyWith<_$TokenDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
