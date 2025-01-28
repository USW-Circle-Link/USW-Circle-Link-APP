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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data), type);

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
  _$$CircleListModelImplCopyWith<_$CircleListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CircleFilteredListModel _$CircleFilteredListModelFromJson(
    Map<String, dynamic> json) {
  return _CircleFilteredListModel.fromJson(json);
}

/// @nodoc
mixin _$CircleFilteredListModel {
  String get message => throw _privateConstructorUsedError;
  List<CircleFilteredListData> get data => throw _privateConstructorUsedError;
  CircleListModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CircleFilteredListModelCopyWith<CircleFilteredListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleFilteredListModelCopyWith<$Res> {
  factory $CircleFilteredListModelCopyWith(CircleFilteredListModel value,
          $Res Function(CircleFilteredListModel) then) =
      _$CircleFilteredListModelCopyWithImpl<$Res, CircleFilteredListModel>;
  @useResult
  $Res call(
      {String message,
      List<CircleFilteredListData> data,
      CircleListModelType? type});
}

/// @nodoc
class _$CircleFilteredListModelCopyWithImpl<$Res,
        $Val extends CircleFilteredListModel>
    implements $CircleFilteredListModelCopyWith<$Res> {
  _$CircleFilteredListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              as List<CircleFilteredListData>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CircleListModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CircleFilteredListModelImplCopyWith<$Res>
    implements $CircleFilteredListModelCopyWith<$Res> {
  factory _$$CircleFilteredListModelImplCopyWith(
          _$CircleFilteredListModelImpl value,
          $Res Function(_$CircleFilteredListModelImpl) then) =
      __$$CircleFilteredListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      List<CircleFilteredListData> data,
      CircleListModelType? type});
}

/// @nodoc
class __$$CircleFilteredListModelImplCopyWithImpl<$Res>
    extends _$CircleFilteredListModelCopyWithImpl<$Res,
        _$CircleFilteredListModelImpl>
    implements _$$CircleFilteredListModelImplCopyWith<$Res> {
  __$$CircleFilteredListModelImplCopyWithImpl(
      _$CircleFilteredListModelImpl _value,
      $Res Function(_$CircleFilteredListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
    Object? type = freezed,
  }) {
    return _then(_$CircleFilteredListModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CircleFilteredListData>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CircleListModelType?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CircleFilteredListModelImpl extends _CircleFilteredListModel {
  _$CircleFilteredListModelImpl(
      {required this.message,
      required final List<CircleFilteredListData> data,
      this.type})
      : _data = data,
        super._();

  factory _$CircleFilteredListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CircleFilteredListModelImplFromJson(json);

  @override
  final String message;
  final List<CircleFilteredListData> _data;
  @override
  List<CircleFilteredListData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final CircleListModelType? type;

  @override
  String toString() {
    return 'CircleFilteredListModel(message: $message, data: $data, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircleFilteredListModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data), type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CircleFilteredListModelImplCopyWith<_$CircleFilteredListModelImpl>
      get copyWith => __$$CircleFilteredListModelImplCopyWithImpl<
          _$CircleFilteredListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CircleFilteredListModelImplToJson(
      this,
    );
  }
}

abstract class _CircleFilteredListModel extends CircleFilteredListModel {
  factory _CircleFilteredListModel(
      {required final String message,
      required final List<CircleFilteredListData> data,
      final CircleListModelType? type}) = _$CircleFilteredListModelImpl;
  _CircleFilteredListModel._() : super._();

  factory _CircleFilteredListModel.fromJson(Map<String, dynamic> json) =
      _$CircleFilteredListModelImpl.fromJson;

  @override
  String get message;
  @override
  List<CircleFilteredListData> get data;
  @override
  CircleListModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$CircleFilteredListModelImplCopyWith<_$CircleFilteredListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CircleListData _$CircleListDataFromJson(Map<String, dynamic> json) {
  return _CircleListData.fromJson(json);
}

/// @nodoc
mixin _$CircleListData {
  int get clubId => throw _privateConstructorUsedError;
  String get clubName => throw _privateConstructorUsedError;
  String? get mainPhoto => throw _privateConstructorUsedError;
  String? get departmentName => throw _privateConstructorUsedError;
  List<String>? get clubHashtags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CircleListDataCopyWith<CircleListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleListDataCopyWith<$Res> {
  factory $CircleListDataCopyWith(
          CircleListData value, $Res Function(CircleListData) then) =
      _$CircleListDataCopyWithImpl<$Res, CircleListData>;
  @useResult
  $Res call(
      {int clubId,
      String clubName,
      String? mainPhoto,
      String? departmentName,
      List<String>? clubHashtags});
}

/// @nodoc
class _$CircleListDataCopyWithImpl<$Res, $Val extends CircleListData>
    implements $CircleListDataCopyWith<$Res> {
  _$CircleListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubId = null,
    Object? clubName = null,
    Object? mainPhoto = freezed,
    Object? departmentName = freezed,
    Object? clubHashtags = freezed,
  }) {
    return _then(_value.copyWith(
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as int,
      clubName: null == clubName
          ? _value.clubName
          : clubName // ignore: cast_nullable_to_non_nullable
              as String,
      mainPhoto: freezed == mainPhoto
          ? _value.mainPhoto
          : mainPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      clubHashtags: freezed == clubHashtags
          ? _value.clubHashtags
          : clubHashtags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
  $Res call(
      {int clubId,
      String clubName,
      String? mainPhoto,
      String? departmentName,
      List<String>? clubHashtags});
}

/// @nodoc
class __$$CircleListDataImplCopyWithImpl<$Res>
    extends _$CircleListDataCopyWithImpl<$Res, _$CircleListDataImpl>
    implements _$$CircleListDataImplCopyWith<$Res> {
  __$$CircleListDataImplCopyWithImpl(
      _$CircleListDataImpl _value, $Res Function(_$CircleListDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubId = null,
    Object? clubName = null,
    Object? mainPhoto = freezed,
    Object? departmentName = freezed,
    Object? clubHashtags = freezed,
  }) {
    return _then(_$CircleListDataImpl(
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as int,
      clubName: null == clubName
          ? _value.clubName
          : clubName // ignore: cast_nullable_to_non_nullable
              as String,
      mainPhoto: freezed == mainPhoto
          ? _value.mainPhoto
          : mainPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      clubHashtags: freezed == clubHashtags
          ? _value._clubHashtags
          : clubHashtags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CircleListDataImpl extends _CircleListData {
  _$CircleListDataImpl(
      {required this.clubId,
      required this.clubName,
      this.mainPhoto,
      this.departmentName,
      final List<String>? clubHashtags})
      : _clubHashtags = clubHashtags,
        super._();

  factory _$CircleListDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CircleListDataImplFromJson(json);

  @override
  final int clubId;
  @override
  final String clubName;
  @override
  final String? mainPhoto;
  @override
  final String? departmentName;
  final List<String>? _clubHashtags;
  @override
  List<String>? get clubHashtags {
    final value = _clubHashtags;
    if (value == null) return null;
    if (_clubHashtags is EqualUnmodifiableListView) return _clubHashtags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CircleListData(clubId: $clubId, clubName: $clubName, mainPhoto: $mainPhoto, departmentName: $departmentName, clubHashtags: $clubHashtags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircleListDataImpl &&
            (identical(other.clubId, clubId) || other.clubId == clubId) &&
            (identical(other.clubName, clubName) ||
                other.clubName == clubName) &&
            (identical(other.mainPhoto, mainPhoto) ||
                other.mainPhoto == mainPhoto) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            const DeepCollectionEquality()
                .equals(other._clubHashtags, _clubHashtags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, clubId, clubName, mainPhoto,
      departmentName, const DeepCollectionEquality().hash(_clubHashtags));

  @JsonKey(ignore: true)
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
      {required final int clubId,
      required final String clubName,
      final String? mainPhoto,
      final String? departmentName,
      final List<String>? clubHashtags}) = _$CircleListDataImpl;
  _CircleListData._() : super._();

  factory _CircleListData.fromJson(Map<String, dynamic> json) =
      _$CircleListDataImpl.fromJson;

  @override
  int get clubId;
  @override
  String get clubName;
  @override
  String? get mainPhoto;
  @override
  String? get departmentName;
  @override
  List<String>? get clubHashtags;
  @override
  @JsonKey(ignore: true)
  _$$CircleListDataImplCopyWith<_$CircleListDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CircleFilteredListData _$CircleFilteredListDataFromJson(
    Map<String, dynamic> json) {
  return _CircleFilteredListData.fromJson(json);
}

/// @nodoc
mixin _$CircleFilteredListData {
  int get categoryId => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<CircleListData> get clubs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CircleFilteredListDataCopyWith<CircleFilteredListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleFilteredListDataCopyWith<$Res> {
  factory $CircleFilteredListDataCopyWith(CircleFilteredListData value,
          $Res Function(CircleFilteredListData) then) =
      _$CircleFilteredListDataCopyWithImpl<$Res, CircleFilteredListData>;
  @useResult
  $Res call({int categoryId, String category, List<CircleListData> clubs});
}

/// @nodoc
class _$CircleFilteredListDataCopyWithImpl<$Res,
        $Val extends CircleFilteredListData>
    implements $CircleFilteredListDataCopyWith<$Res> {
  _$CircleFilteredListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? category = null,
    Object? clubs = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      clubs: null == clubs
          ? _value.clubs
          : clubs // ignore: cast_nullable_to_non_nullable
              as List<CircleListData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CircleFilteredListDataImplCopyWith<$Res>
    implements $CircleFilteredListDataCopyWith<$Res> {
  factory _$$CircleFilteredListDataImplCopyWith(
          _$CircleFilteredListDataImpl value,
          $Res Function(_$CircleFilteredListDataImpl) then) =
      __$$CircleFilteredListDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int categoryId, String category, List<CircleListData> clubs});
}

/// @nodoc
class __$$CircleFilteredListDataImplCopyWithImpl<$Res>
    extends _$CircleFilteredListDataCopyWithImpl<$Res,
        _$CircleFilteredListDataImpl>
    implements _$$CircleFilteredListDataImplCopyWith<$Res> {
  __$$CircleFilteredListDataImplCopyWithImpl(
      _$CircleFilteredListDataImpl _value,
      $Res Function(_$CircleFilteredListDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? category = null,
    Object? clubs = null,
  }) {
    return _then(_$CircleFilteredListDataImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      clubs: null == clubs
          ? _value._clubs
          : clubs // ignore: cast_nullable_to_non_nullable
              as List<CircleListData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CircleFilteredListDataImpl implements _CircleFilteredListData {
  _$CircleFilteredListDataImpl(
      {required this.categoryId,
      required this.category,
      required final List<CircleListData> clubs})
      : _clubs = clubs;

  factory _$CircleFilteredListDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CircleFilteredListDataImplFromJson(json);

  @override
  final int categoryId;
  @override
  final String category;
  final List<CircleListData> _clubs;
  @override
  List<CircleListData> get clubs {
    if (_clubs is EqualUnmodifiableListView) return _clubs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clubs);
  }

  @override
  String toString() {
    return 'CircleFilteredListData(categoryId: $categoryId, category: $category, clubs: $clubs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircleFilteredListDataImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._clubs, _clubs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, category,
      const DeepCollectionEquality().hash(_clubs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CircleFilteredListDataImplCopyWith<_$CircleFilteredListDataImpl>
      get copyWith => __$$CircleFilteredListDataImplCopyWithImpl<
          _$CircleFilteredListDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CircleFilteredListDataImplToJson(
      this,
    );
  }
}

abstract class _CircleFilteredListData implements CircleFilteredListData {
  factory _CircleFilteredListData(
          {required final int categoryId,
          required final String category,
          required final List<CircleListData> clubs}) =
      _$CircleFilteredListDataImpl;

  factory _CircleFilteredListData.fromJson(Map<String, dynamic> json) =
      _$CircleFilteredListDataImpl.fromJson;

  @override
  int get categoryId;
  @override
  String get category;
  @override
  List<CircleListData> get clubs;
  @override
  @JsonKey(ignore: true)
  _$$CircleFilteredListDataImplCopyWith<_$CircleFilteredListDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CircleListModelError _$CircleListModelErrorFromJson(Map<String, dynamic> json) {
  return _CircleListModelError.fromJson(json);
}

/// @nodoc
mixin _$CircleListModelError {
  String? get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  CircleListModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CircleListModelErrorCopyWith<CircleListModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleListModelErrorCopyWith<$Res> {
  factory $CircleListModelErrorCopyWith(CircleListModelError value,
          $Res Function(CircleListModelError) then) =
      _$CircleListModelErrorCopyWithImpl<$Res, CircleListModelError>;
  @useResult
  $Res call({String? message, String? code, CircleListModelType? type});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({String? message, String? code, CircleListModelType? type});
}

/// @nodoc
class __$$CircleListModelErrorImplCopyWithImpl<$Res>
    extends _$CircleListModelErrorCopyWithImpl<$Res, _$CircleListModelErrorImpl>
    implements _$$CircleListModelErrorImplCopyWith<$Res> {
  __$$CircleListModelErrorImplCopyWithImpl(_$CircleListModelErrorImpl _value,
      $Res Function(_$CircleListModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? type = freezed,
  }) {
    return _then(_$CircleListModelErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
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
  _$CircleListModelErrorImpl({this.message, this.code, this.type}) : super._();

  factory _$CircleListModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$CircleListModelErrorImplFromJson(json);

  @override
  final String? message;
  @override
  final String? code;
  @override
  final CircleListModelType? type;

  @override
  String toString() {
    return 'CircleListModelError(message: $message, code: $code, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircleListModelErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, code, type);

  @JsonKey(ignore: true)
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
  factory _CircleListModelError(
      {final String? message,
      final String? code,
      final CircleListModelType? type}) = _$CircleListModelErrorImpl;
  _CircleListModelError._() : super._();

  factory _CircleListModelError.fromJson(Map<String, dynamic> json) =
      _$CircleListModelErrorImpl.fromJson;

  @override
  String? get message;
  @override
  String? get code;
  @override
  CircleListModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$CircleListModelErrorImplCopyWith<_$CircleListModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
