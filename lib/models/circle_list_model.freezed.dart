// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'circle_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CircleListModel _$CircleListModelFromJson(Map<String, dynamic> json) {
  return _CircleListModel.fromJson(json);
}

/// @nodoc
mixin _$CircleListModel {
  String get message => throw _privateConstructorUsedError;
  List<CircleListData> get data => throw _privateConstructorUsedError;
  CircleListModelType? get type => throw _privateConstructorUsedError;

  /// Serializes this CircleListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CircleListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CircleListModelCopyWith<CircleListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleListModelCopyWith<$Res> {
  factory $CircleListModelCopyWith(
          CircleListModel value, $Res Function(CircleListModel) then) =
      _$CircleListModelCopyWithImpl<$Res, CircleListModel>;
  @useResult
  $Res call(
      {String message, List<CircleListData> data, CircleListModelType? type});
}

/// @nodoc
class _$CircleListModelCopyWithImpl<$Res, $Val extends CircleListModel>
    implements $CircleListModelCopyWith<$Res> {
  _$CircleListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CircleListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CircleListData>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CircleListModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CircleListModelImplCopyWith<$Res>
    implements $CircleListModelCopyWith<$Res> {
  factory _$$CircleListModelImplCopyWith(_$CircleListModelImpl value,
          $Res Function(_$CircleListModelImpl) then) =
      __$$CircleListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message, List<CircleListData> data, CircleListModelType? type});
}

/// @nodoc
class __$$CircleListModelImplCopyWithImpl<$Res>
    extends _$CircleListModelCopyWithImpl<$Res, _$CircleListModelImpl>
    implements _$$CircleListModelImplCopyWith<$Res> {
  __$$CircleListModelImplCopyWithImpl(
      _$CircleListModelImpl _value, $Res Function(_$CircleListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CircleListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
    Object? type = freezed,
  }) {
    return _then(_$CircleListModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CircleListData>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CircleListModelType?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CircleListModelImpl extends _CircleListModel {
  _$CircleListModelImpl(
      {required this.message,
      required final List<CircleListData> data,
      this.type})
      : _data = data,
        super._();

  factory _$CircleListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CircleListModelImplFromJson(json);

  @override
  final String message;
  final List<CircleListData> _data;
  @override
  List<CircleListData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final CircleListModelType? type;

  @override
  String toString() {
    return 'CircleListModel(message: $message, data: $data, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircleListModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data), type);

  /// Create a copy of CircleListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CircleListModelImplCopyWith<_$CircleListModelImpl> get copyWith =>
      __$$CircleListModelImplCopyWithImpl<_$CircleListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CircleListModelImplToJson(
      this,
    );
  }
}

abstract class _CircleListModel extends CircleListModel {
  factory _CircleListModel(
      {required final String message,
      required final List<CircleListData> data,
      final CircleListModelType? type}) = _$CircleListModelImpl;
  _CircleListModel._() : super._();

  factory _CircleListModel.fromJson(Map<String, dynamic> json) =
      _$CircleListModelImpl.fromJson;

  @override
  String get message;
  @override
  List<CircleListData> get data;
  @override
  CircleListModelType? get type;

  /// Create a copy of CircleListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CircleListModelImplCopyWith<_$CircleListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CircleListData _$CircleListDataFromJson(Map<String, dynamic> json) {
  return _CircleListData.fromJson(json);
}

/// @nodoc
mixin _$CircleListData {
  String get clubName => throw _privateConstructorUsedError;
  String get mainPhoto => throw _privateConstructorUsedError;
  String get departmentName => throw _privateConstructorUsedError;

  /// Serializes this CircleListData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CircleListData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CircleListDataCopyWith<CircleListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleListDataCopyWith<$Res> {
  factory $CircleListDataCopyWith(
          CircleListData value, $Res Function(CircleListData) then) =
      _$CircleListDataCopyWithImpl<$Res, CircleListData>;
  @useResult
  $Res call({String clubName, String mainPhoto, String departmentName});
}

/// @nodoc
class _$CircleListDataCopyWithImpl<$Res, $Val extends CircleListData>
    implements $CircleListDataCopyWith<$Res> {
  _$CircleListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CircleListData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubName = null,
    Object? mainPhoto = null,
    Object? departmentName = null,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CircleListDataImplCopyWith<$Res>
    implements $CircleListDataCopyWith<$Res> {
  factory _$$CircleListDataImplCopyWith(_$CircleListDataImpl value,
          $Res Function(_$CircleListDataImpl) then) =
      __$$CircleListDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String clubName, String mainPhoto, String departmentName});
}

/// @nodoc
class __$$CircleListDataImplCopyWithImpl<$Res>
    extends _$CircleListDataCopyWithImpl<$Res, _$CircleListDataImpl>
    implements _$$CircleListDataImplCopyWith<$Res> {
  __$$CircleListDataImplCopyWithImpl(
      _$CircleListDataImpl _value, $Res Function(_$CircleListDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CircleListData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubName = null,
    Object? mainPhoto = null,
    Object? departmentName = null,
  }) {
    return _then(_$CircleListDataImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CircleListDataImpl extends _CircleListData {
  _$CircleListDataImpl(
      {required this.clubName,
      required this.mainPhoto,
      required this.departmentName})
      : super._();

  factory _$CircleListDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CircleListDataImplFromJson(json);

  @override
  final String clubName;
  @override
  final String mainPhoto;
  @override
  final String departmentName;

  @override
  String toString() {
    return 'CircleListData(clubName: $clubName, mainPhoto: $mainPhoto, departmentName: $departmentName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircleListDataImpl &&
            (identical(other.clubName, clubName) ||
                other.clubName == clubName) &&
            (identical(other.mainPhoto, mainPhoto) ||
                other.mainPhoto == mainPhoto) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clubName, mainPhoto, departmentName);

  /// Create a copy of CircleListData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CircleListDataImplCopyWith<_$CircleListDataImpl> get copyWith =>
      __$$CircleListDataImplCopyWithImpl<_$CircleListDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CircleListDataImplToJson(
      this,
    );
  }
}

abstract class _CircleListData extends CircleListData {
  factory _CircleListData(
      {required final String clubName,
      required final String mainPhoto,
      required final String departmentName}) = _$CircleListDataImpl;
  _CircleListData._() : super._();

  factory _CircleListData.fromJson(Map<String, dynamic> json) =
      _$CircleListDataImpl.fromJson;

  @override
  String get clubName;
  @override
  String get mainPhoto;
  @override
  String get departmentName;

  /// Create a copy of CircleListData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CircleListDataImplCopyWith<_$CircleListDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CircleListModelError _$CircleListModelErrorFromJson(Map<String, dynamic> json) {
  return _CircleListModelError.fromJson(json);
}

/// @nodoc
mixin _$CircleListModelError {
  CircleListModelType? get type => throw _privateConstructorUsedError;

  /// Serializes this CircleListModelError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CircleListModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CircleListModelErrorCopyWith<CircleListModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleListModelErrorCopyWith<$Res> {
  factory $CircleListModelErrorCopyWith(CircleListModelError value,
          $Res Function(CircleListModelError) then) =
      _$CircleListModelErrorCopyWithImpl<$Res, CircleListModelError>;
  @useResult
  $Res call({CircleListModelType? type});
}

/// @nodoc
class _$CircleListModelErrorCopyWithImpl<$Res,
        $Val extends CircleListModelError>
    implements $CircleListModelErrorCopyWith<$Res> {
  _$CircleListModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CircleListModelError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CircleListModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CircleListModelErrorImplCopyWith<$Res>
    implements $CircleListModelErrorCopyWith<$Res> {
  factory _$$CircleListModelErrorImplCopyWith(_$CircleListModelErrorImpl value,
          $Res Function(_$CircleListModelErrorImpl) then) =
      __$$CircleListModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CircleListModelType? type});
}

/// @nodoc
class __$$CircleListModelErrorImplCopyWithImpl<$Res>
    extends _$CircleListModelErrorCopyWithImpl<$Res, _$CircleListModelErrorImpl>
    implements _$$CircleListModelErrorImplCopyWith<$Res> {
  __$$CircleListModelErrorImplCopyWithImpl(_$CircleListModelErrorImpl _value,
      $Res Function(_$CircleListModelErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CircleListModelError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_$CircleListModelErrorImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CircleListModelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CircleListModelErrorImpl extends _CircleListModelError {
  _$CircleListModelErrorImpl({this.type}) : super._();

  factory _$CircleListModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$CircleListModelErrorImplFromJson(json);

  @override
  final CircleListModelType? type;

  @override
  String toString() {
    return 'CircleListModelError(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircleListModelErrorImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of CircleListModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CircleListModelErrorImplCopyWith<_$CircleListModelErrorImpl>
      get copyWith =>
          __$$CircleListModelErrorImplCopyWithImpl<_$CircleListModelErrorImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CircleListModelErrorImplToJson(
      this,
    );
  }
}

abstract class _CircleListModelError extends CircleListModelError {
  factory _CircleListModelError({final CircleListModelType? type}) =
      _$CircleListModelErrorImpl;
  _CircleListModelError._() : super._();

  factory _CircleListModelError.fromJson(Map<String, dynamic> json) =
      _$CircleListModelErrorImpl.fromJson;

  @override
  CircleListModelType? get type;

  /// Create a copy of CircleListModelError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CircleListModelErrorImplCopyWith<_$CircleListModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
