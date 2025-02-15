// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  String get message => throw _privateConstructorUsedError;
  List<CategoryData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call({String message, List<CategoryData> data});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

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
              as List<CategoryData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<CategoryData> data});
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$CategoryModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CategoryModelImpl extends _CategoryModel {
  _$CategoryModelImpl(
      {required this.message, required final List<CategoryData> data})
      : _data = data,
        super._();

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final String message;
  final List<CategoryData> _data;
  @override
  List<CategoryData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CategoryModel(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
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
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel extends CategoryModel {
  factory _CategoryModel(
      {required final String message,
      required final List<CategoryData> data}) = _$CategoryModelImpl;
  _CategoryModel._() : super._();

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  String get message;
  @override
  List<CategoryData> get data;
  @override
  @JsonKey(ignore: true)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) {
  return _CategoryData.fromJson(json);
}

/// @nodoc
mixin _$CategoryData {
  int get clubCategoryId => throw _privateConstructorUsedError;
  String get clubCategoryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryDataCopyWith<CategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDataCopyWith<$Res> {
  factory $CategoryDataCopyWith(
          CategoryData value, $Res Function(CategoryData) then) =
      _$CategoryDataCopyWithImpl<$Res, CategoryData>;
  @useResult
  $Res call({int clubCategoryId, String clubCategoryName});
}

/// @nodoc
class _$CategoryDataCopyWithImpl<$Res, $Val extends CategoryData>
    implements $CategoryDataCopyWith<$Res> {
  _$CategoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubCategoryId = null,
    Object? clubCategoryName = null,
  }) {
    return _then(_value.copyWith(
      clubCategoryId: null == clubCategoryId
          ? _value.clubCategoryId
          : clubCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      clubCategoryName: null == clubCategoryName
          ? _value.clubCategoryName
          : clubCategoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryDataImplCopyWith<$Res>
    implements $CategoryDataCopyWith<$Res> {
  factory _$$CategoryDataImplCopyWith(
          _$CategoryDataImpl value, $Res Function(_$CategoryDataImpl) then) =
      __$$CategoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int clubCategoryId, String clubCategoryName});
}

/// @nodoc
class __$$CategoryDataImplCopyWithImpl<$Res>
    extends _$CategoryDataCopyWithImpl<$Res, _$CategoryDataImpl>
    implements _$$CategoryDataImplCopyWith<$Res> {
  __$$CategoryDataImplCopyWithImpl(
      _$CategoryDataImpl _value, $Res Function(_$CategoryDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubCategoryId = null,
    Object? clubCategoryName = null,
  }) {
    return _then(_$CategoryDataImpl(
      clubCategoryId: null == clubCategoryId
          ? _value.clubCategoryId
          : clubCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      clubCategoryName: null == clubCategoryName
          ? _value.clubCategoryName
          : clubCategoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDataImpl implements _CategoryData {
  _$CategoryDataImpl(
      {required this.clubCategoryId, required this.clubCategoryName});

  factory _$CategoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDataImplFromJson(json);

  @override
  final int clubCategoryId;
  @override
  final String clubCategoryName;

  @override
  String toString() {
    return 'CategoryData(clubCategoryId: $clubCategoryId, clubCategoryName: $clubCategoryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDataImpl &&
            (identical(other.clubCategoryId, clubCategoryId) ||
                other.clubCategoryId == clubCategoryId) &&
            (identical(other.clubCategoryName, clubCategoryName) ||
                other.clubCategoryName == clubCategoryName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clubCategoryId, clubCategoryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDataImplCopyWith<_$CategoryDataImpl> get copyWith =>
      __$$CategoryDataImplCopyWithImpl<_$CategoryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDataImplToJson(
      this,
    );
  }
}

abstract class _CategoryData implements CategoryData {
  factory _CategoryData(
      {required final int clubCategoryId,
      required final String clubCategoryName}) = _$CategoryDataImpl;

  factory _CategoryData.fromJson(Map<String, dynamic> json) =
      _$CategoryDataImpl.fromJson;

  @override
  int get clubCategoryId;
  @override
  String get clubCategoryName;
  @override
  @JsonKey(ignore: true)
  _$$CategoryDataImplCopyWith<_$CategoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryModelError _$CategoryModelErrorFromJson(Map<String, dynamic> json) {
  return _CategoryModelError.fromJson(json);
}

/// @nodoc
mixin _$CategoryModelError {
  String get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelErrorCopyWith<CategoryModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelErrorCopyWith<$Res> {
  factory $CategoryModelErrorCopyWith(
          CategoryModelError value, $Res Function(CategoryModelError) then) =
      _$CategoryModelErrorCopyWithImpl<$Res, CategoryModelError>;
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class _$CategoryModelErrorCopyWithImpl<$Res, $Val extends CategoryModelError>
    implements $CategoryModelErrorCopyWith<$Res> {
  _$CategoryModelErrorCopyWithImpl(this._value, this._then);

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
abstract class _$$CategoryModelErrorImplCopyWith<$Res>
    implements $CategoryModelErrorCopyWith<$Res> {
  factory _$$CategoryModelErrorImplCopyWith(_$CategoryModelErrorImpl value,
          $Res Function(_$CategoryModelErrorImpl) then) =
      __$$CategoryModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$CategoryModelErrorImplCopyWithImpl<$Res>
    extends _$CategoryModelErrorCopyWithImpl<$Res, _$CategoryModelErrorImpl>
    implements _$$CategoryModelErrorImplCopyWith<$Res> {
  __$$CategoryModelErrorImplCopyWithImpl(_$CategoryModelErrorImpl _value,
      $Res Function(_$CategoryModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$CategoryModelErrorImpl(
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
class _$CategoryModelErrorImpl extends _CategoryModelError {
  _$CategoryModelErrorImpl({required this.message, this.code}) : super._();

  factory _$CategoryModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelErrorImplFromJson(json);

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'CategoryModelError(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelErrorImplCopyWith<_$CategoryModelErrorImpl> get copyWith =>
      __$$CategoryModelErrorImplCopyWithImpl<_$CategoryModelErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelErrorImplToJson(
      this,
    );
  }
}

abstract class _CategoryModelError extends CategoryModelError {
  factory _CategoryModelError(
      {required final String message,
      final String? code}) = _$CategoryModelErrorImpl;
  _CategoryModelError._() : super._();

  factory _CategoryModelError.fromJson(Map<String, dynamic> json) =
      _$CategoryModelErrorImpl.fromJson;

  @override
  String get message;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$CategoryModelErrorImplCopyWith<_$CategoryModelErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
