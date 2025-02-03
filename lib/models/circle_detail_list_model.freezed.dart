// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'circle_detail_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CircleDetailListModel _$CircleDetailListModelFromJson(
    Map<String, dynamic> json) {
  return _CircleDetailListModel.fromJson(json);
}

/// @nodoc
mixin _$CircleDetailListModel {
  String get message => throw _privateConstructorUsedError;
  List<Circle> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CircleDetailListModelCopyWith<CircleDetailListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleDetailListModelCopyWith<$Res> {
  factory $CircleDetailListModelCopyWith(CircleDetailListModel value,
          $Res Function(CircleDetailListModel) then) =
      _$CircleDetailListModelCopyWithImpl<$Res, CircleDetailListModel>;
  @useResult
  $Res call({String message, List<Circle> data});
}

/// @nodoc
class _$CircleDetailListModelCopyWithImpl<$Res,
        $Val extends CircleDetailListModel>
    implements $CircleDetailListModelCopyWith<$Res> {
  _$CircleDetailListModelCopyWithImpl(this._value, this._then);

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
              as List<Circle>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CircleDetailListModelImplCopyWith<$Res>
    implements $CircleDetailListModelCopyWith<$Res> {
  factory _$$CircleDetailListModelImplCopyWith(
          _$CircleDetailListModelImpl value,
          $Res Function(_$CircleDetailListModelImpl) then) =
      __$$CircleDetailListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<Circle> data});
}

/// @nodoc
class __$$CircleDetailListModelImplCopyWithImpl<$Res>
    extends _$CircleDetailListModelCopyWithImpl<$Res,
        _$CircleDetailListModelImpl>
    implements _$$CircleDetailListModelImplCopyWith<$Res> {
  __$$CircleDetailListModelImplCopyWithImpl(_$CircleDetailListModelImpl _value,
      $Res Function(_$CircleDetailListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$CircleDetailListModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Circle>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CircleDetailListModelImpl implements _CircleDetailListModel {
  _$CircleDetailListModelImpl(
      {required this.message, required final List<Circle> data})
      : _data = data;

  factory _$CircleDetailListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CircleDetailListModelImplFromJson(json);

  @override
  final String message;
  final List<Circle> _data;
  @override
  List<Circle> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CircleDetailListModel(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircleDetailListModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CircleDetailListModelImplCopyWith<_$CircleDetailListModelImpl>
      get copyWith => __$$CircleDetailListModelImplCopyWithImpl<
          _$CircleDetailListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CircleDetailListModelImplToJson(
      this,
    );
  }
}

abstract class _CircleDetailListModel implements CircleDetailListModel {
  factory _CircleDetailListModel(
      {required final String message,
      required final List<Circle> data}) = _$CircleDetailListModelImpl;

  factory _CircleDetailListModel.fromJson(Map<String, dynamic> json) =
      _$CircleDetailListModelImpl.fromJson;

  @override
  String get message;
  @override
  List<Circle> get data;
  @override
  @JsonKey(ignore: true)
  _$$CircleDetailListModelImplCopyWith<_$CircleDetailListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Circle _$CircleFromJson(Map<String, dynamic> json) {
  return _Circle.fromJson(json);
}

/// @nodoc
mixin _$Circle {
  int get clubId => throw _privateConstructorUsedError;
  String? get mainPhotoPath => throw _privateConstructorUsedError;
  String get clubName => throw _privateConstructorUsedError;
  String get leaderName => throw _privateConstructorUsedError;
  String get leaderHp => throw _privateConstructorUsedError;
  String get clubInsta => throw _privateConstructorUsedError;
  String? get clubRoomNumber => throw _privateConstructorUsedError;
  String? get aplictStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CircleCopyWith<Circle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleCopyWith<$Res> {
  factory $CircleCopyWith(Circle value, $Res Function(Circle) then) =
      _$CircleCopyWithImpl<$Res, Circle>;
  @useResult
  $Res call(
      {int clubId,
      String? mainPhotoPath,
      String clubName,
      String leaderName,
      String leaderHp,
      String clubInsta,
      String? clubRoomNumber,
      String? aplictStatus});
}

/// @nodoc
class _$CircleCopyWithImpl<$Res, $Val extends Circle>
    implements $CircleCopyWith<$Res> {
  _$CircleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubId = null,
    Object? mainPhotoPath = freezed,
    Object? clubName = null,
    Object? leaderName = null,
    Object? leaderHp = null,
    Object? clubInsta = null,
    Object? clubRoomNumber = freezed,
    Object? aplictStatus = freezed,
  }) {
    return _then(_value.copyWith(
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as int,
      mainPhotoPath: freezed == mainPhotoPath
          ? _value.mainPhotoPath
          : mainPhotoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      clubName: null == clubName
          ? _value.clubName
          : clubName // ignore: cast_nullable_to_non_nullable
              as String,
      leaderName: null == leaderName
          ? _value.leaderName
          : leaderName // ignore: cast_nullable_to_non_nullable
              as String,
      leaderHp: null == leaderHp
          ? _value.leaderHp
          : leaderHp // ignore: cast_nullable_to_non_nullable
              as String,
      clubInsta: null == clubInsta
          ? _value.clubInsta
          : clubInsta // ignore: cast_nullable_to_non_nullable
              as String,
      clubRoomNumber: freezed == clubRoomNumber
          ? _value.clubRoomNumber
          : clubRoomNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      aplictStatus: freezed == aplictStatus
          ? _value.aplictStatus
          : aplictStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CircleImplCopyWith<$Res> implements $CircleCopyWith<$Res> {
  factory _$$CircleImplCopyWith(
          _$CircleImpl value, $Res Function(_$CircleImpl) then) =
      __$$CircleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int clubId,
      String? mainPhotoPath,
      String clubName,
      String leaderName,
      String leaderHp,
      String clubInsta,
      String? clubRoomNumber,
      String? aplictStatus});
}

/// @nodoc
class __$$CircleImplCopyWithImpl<$Res>
    extends _$CircleCopyWithImpl<$Res, _$CircleImpl>
    implements _$$CircleImplCopyWith<$Res> {
  __$$CircleImplCopyWithImpl(
      _$CircleImpl _value, $Res Function(_$CircleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubId = null,
    Object? mainPhotoPath = freezed,
    Object? clubName = null,
    Object? leaderName = null,
    Object? leaderHp = null,
    Object? clubInsta = null,
    Object? clubRoomNumber = freezed,
    Object? aplictStatus = freezed,
  }) {
    return _then(_$CircleImpl(
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as int,
      mainPhotoPath: freezed == mainPhotoPath
          ? _value.mainPhotoPath
          : mainPhotoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      clubName: null == clubName
          ? _value.clubName
          : clubName // ignore: cast_nullable_to_non_nullable
              as String,
      leaderName: null == leaderName
          ? _value.leaderName
          : leaderName // ignore: cast_nullable_to_non_nullable
              as String,
      leaderHp: null == leaderHp
          ? _value.leaderHp
          : leaderHp // ignore: cast_nullable_to_non_nullable
              as String,
      clubInsta: null == clubInsta
          ? _value.clubInsta
          : clubInsta // ignore: cast_nullable_to_non_nullable
              as String,
      clubRoomNumber: freezed == clubRoomNumber
          ? _value.clubRoomNumber
          : clubRoomNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      aplictStatus: freezed == aplictStatus
          ? _value.aplictStatus
          : aplictStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CircleImpl implements _Circle {
  _$CircleImpl(
      {required this.clubId,
      this.mainPhotoPath,
      required this.clubName,
      required this.leaderName,
      required this.leaderHp,
      required this.clubInsta,
      this.clubRoomNumber,
      this.aplictStatus});

  factory _$CircleImpl.fromJson(Map<String, dynamic> json) =>
      _$$CircleImplFromJson(json);

  @override
  final int clubId;
  @override
  final String? mainPhotoPath;
  @override
  final String clubName;
  @override
  final String leaderName;
  @override
  final String leaderHp;
  @override
  final String clubInsta;
  @override
  final String? clubRoomNumber;
  @override
  final String? aplictStatus;

  @override
  String toString() {
    return 'Circle(clubId: $clubId, mainPhotoPath: $mainPhotoPath, clubName: $clubName, leaderName: $leaderName, leaderHp: $leaderHp, clubInsta: $clubInsta, clubRoomNumber: $clubRoomNumber, aplictStatus: $aplictStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircleImpl &&
            (identical(other.clubId, clubId) || other.clubId == clubId) &&
            (identical(other.mainPhotoPath, mainPhotoPath) ||
                other.mainPhotoPath == mainPhotoPath) &&
            (identical(other.clubName, clubName) ||
                other.clubName == clubName) &&
            (identical(other.leaderName, leaderName) ||
                other.leaderName == leaderName) &&
            (identical(other.leaderHp, leaderHp) ||
                other.leaderHp == leaderHp) &&
            (identical(other.clubInsta, clubInsta) ||
                other.clubInsta == clubInsta) &&
            (identical(other.clubRoomNumber, clubRoomNumber) ||
                other.clubRoomNumber == clubRoomNumber) &&
            (identical(other.aplictStatus, aplictStatus) ||
                other.aplictStatus == aplictStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, clubId, mainPhotoPath, clubName,
      leaderName, leaderHp, clubInsta, clubRoomNumber, aplictStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CircleImplCopyWith<_$CircleImpl> get copyWith =>
      __$$CircleImplCopyWithImpl<_$CircleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CircleImplToJson(
      this,
    );
  }
}

abstract class _Circle implements Circle {
  factory _Circle(
      {required final int clubId,
      final String? mainPhotoPath,
      required final String clubName,
      required final String leaderName,
      required final String leaderHp,
      required final String clubInsta,
      final String? clubRoomNumber,
      final String? aplictStatus}) = _$CircleImpl;

  factory _Circle.fromJson(Map<String, dynamic> json) = _$CircleImpl.fromJson;

  @override
  int get clubId;
  @override
  String? get mainPhotoPath;
  @override
  String get clubName;
  @override
  String get leaderName;
  @override
  String get leaderHp;
  @override
  String get clubInsta;
  @override
  String? get clubRoomNumber;
  @override
  String? get aplictStatus;
  @override
  @JsonKey(ignore: true)
  _$$CircleImplCopyWith<_$CircleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CircleDetailListModelError _$CircleDetailListModelErrorFromJson(
    Map<String, dynamic> json) {
  return _CircleDetailListModelError.fromJson(json);
}

/// @nodoc
mixin _$CircleDetailListModelError {
  String get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CircleDetailListModelErrorCopyWith<CircleDetailListModelError>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleDetailListModelErrorCopyWith<$Res> {
  factory $CircleDetailListModelErrorCopyWith(CircleDetailListModelError value,
          $Res Function(CircleDetailListModelError) then) =
      _$CircleDetailListModelErrorCopyWithImpl<$Res,
          CircleDetailListModelError>;
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class _$CircleDetailListModelErrorCopyWithImpl<$Res,
        $Val extends CircleDetailListModelError>
    implements $CircleDetailListModelErrorCopyWith<$Res> {
  _$CircleDetailListModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CircleDetailListModelErrorImplCopyWith<$Res>
    implements $CircleDetailListModelErrorCopyWith<$Res> {
  factory _$$CircleDetailListModelErrorImplCopyWith(
          _$CircleDetailListModelErrorImpl value,
          $Res Function(_$CircleDetailListModelErrorImpl) then) =
      __$$CircleDetailListModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$CircleDetailListModelErrorImplCopyWithImpl<$Res>
    extends _$CircleDetailListModelErrorCopyWithImpl<$Res,
        _$CircleDetailListModelErrorImpl>
    implements _$$CircleDetailListModelErrorImplCopyWith<$Res> {
  __$$CircleDetailListModelErrorImplCopyWithImpl(
      _$CircleDetailListModelErrorImpl _value,
      $Res Function(_$CircleDetailListModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$CircleDetailListModelErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CircleDetailListModelErrorImpl extends _CircleDetailListModelError {
  _$CircleDetailListModelErrorImpl({required this.message, this.code})
      : super._();

  factory _$CircleDetailListModelErrorImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CircleDetailListModelErrorImplFromJson(json);

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'CircleDetailListModelError(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircleDetailListModelErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CircleDetailListModelErrorImplCopyWith<_$CircleDetailListModelErrorImpl>
      get copyWith => __$$CircleDetailListModelErrorImplCopyWithImpl<
          _$CircleDetailListModelErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CircleDetailListModelErrorImplToJson(
      this,
    );
  }
}

abstract class _CircleDetailListModelError extends CircleDetailListModelError {
  factory _CircleDetailListModelError(
      {required final String message,
      final String? code}) = _$CircleDetailListModelErrorImpl;
  _CircleDetailListModelError._() : super._();

  factory _CircleDetailListModelError.fromJson(Map<String, dynamic> json) =
      _$CircleDetailListModelErrorImpl.fromJson;

  @override
  String get message;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$CircleDetailListModelErrorImplCopyWith<_$CircleDetailListModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
