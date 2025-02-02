// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor_photo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FloorPhotoModel _$FloorPhotoModelFromJson(Map<String, dynamic> json) {
  return _FloorPhotoModel.fromJson(json);
}

/// @nodoc
mixin _$FloorPhotoModel {
  String get message => throw _privateConstructorUsedError;
  FloorPhotoData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FloorPhotoModelCopyWith<FloorPhotoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorPhotoModelCopyWith<$Res> {
  factory $FloorPhotoModelCopyWith(
          FloorPhotoModel value, $Res Function(FloorPhotoModel) then) =
      _$FloorPhotoModelCopyWithImpl<$Res, FloorPhotoModel>;
  @useResult
  $Res call({String message, FloorPhotoData data});

  $FloorPhotoDataCopyWith<$Res> get data;
}

/// @nodoc
class _$FloorPhotoModelCopyWithImpl<$Res, $Val extends FloorPhotoModel>
    implements $FloorPhotoModelCopyWith<$Res> {
  _$FloorPhotoModelCopyWithImpl(this._value, this._then);

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
              as FloorPhotoData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FloorPhotoDataCopyWith<$Res> get data {
    return $FloorPhotoDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FloorPhotoModelImplCopyWith<$Res>
    implements $FloorPhotoModelCopyWith<$Res> {
  factory _$$FloorPhotoModelImplCopyWith(_$FloorPhotoModelImpl value,
          $Res Function(_$FloorPhotoModelImpl) then) =
      __$$FloorPhotoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, FloorPhotoData data});

  @override
  $FloorPhotoDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$FloorPhotoModelImplCopyWithImpl<$Res>
    extends _$FloorPhotoModelCopyWithImpl<$Res, _$FloorPhotoModelImpl>
    implements _$$FloorPhotoModelImplCopyWith<$Res> {
  __$$FloorPhotoModelImplCopyWithImpl(
      _$FloorPhotoModelImpl _value, $Res Function(_$FloorPhotoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$FloorPhotoModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FloorPhotoData,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$FloorPhotoModelImpl implements _FloorPhotoModel {
  _$FloorPhotoModelImpl({required this.message, required this.data});

  factory _$FloorPhotoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FloorPhotoModelImplFromJson(json);

  @override
  final String message;
  @override
  final FloorPhotoData data;

  @override
  String toString() {
    return 'FloorPhotoModel(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorPhotoModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FloorPhotoModelImplCopyWith<_$FloorPhotoModelImpl> get copyWith =>
      __$$FloorPhotoModelImplCopyWithImpl<_$FloorPhotoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FloorPhotoModelImplToJson(
      this,
    );
  }
}

abstract class _FloorPhotoModel implements FloorPhotoModel {
  factory _FloorPhotoModel(
      {required final String message,
      required final FloorPhotoData data}) = _$FloorPhotoModelImpl;

  factory _FloorPhotoModel.fromJson(Map<String, dynamic> json) =
      _$FloorPhotoModelImpl.fromJson;

  @override
  String get message;
  @override
  FloorPhotoData get data;
  @override
  @JsonKey(ignore: true)
  _$$FloorPhotoModelImplCopyWith<_$FloorPhotoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FloorPhotoData _$FloorPhotoDataFromJson(Map<String, dynamic> json) {
  return _FloorPhotoData.fromJson(json);
}

/// @nodoc
mixin _$FloorPhotoData {
  String get roomFloor => throw _privateConstructorUsedError;
  String get floorPhotoPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FloorPhotoDataCopyWith<FloorPhotoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorPhotoDataCopyWith<$Res> {
  factory $FloorPhotoDataCopyWith(
          FloorPhotoData value, $Res Function(FloorPhotoData) then) =
      _$FloorPhotoDataCopyWithImpl<$Res, FloorPhotoData>;
  @useResult
  $Res call({String roomFloor, String floorPhotoPath});
}

/// @nodoc
class _$FloorPhotoDataCopyWithImpl<$Res, $Val extends FloorPhotoData>
    implements $FloorPhotoDataCopyWith<$Res> {
  _$FloorPhotoDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomFloor = null,
    Object? floorPhotoPath = null,
  }) {
    return _then(_value.copyWith(
      roomFloor: null == roomFloor
          ? _value.roomFloor
          : roomFloor // ignore: cast_nullable_to_non_nullable
              as String,
      floorPhotoPath: null == floorPhotoPath
          ? _value.floorPhotoPath
          : floorPhotoPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FloorPhotoDataImplCopyWith<$Res>
    implements $FloorPhotoDataCopyWith<$Res> {
  factory _$$FloorPhotoDataImplCopyWith(_$FloorPhotoDataImpl value,
          $Res Function(_$FloorPhotoDataImpl) then) =
      __$$FloorPhotoDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String roomFloor, String floorPhotoPath});
}

/// @nodoc
class __$$FloorPhotoDataImplCopyWithImpl<$Res>
    extends _$FloorPhotoDataCopyWithImpl<$Res, _$FloorPhotoDataImpl>
    implements _$$FloorPhotoDataImplCopyWith<$Res> {
  __$$FloorPhotoDataImplCopyWithImpl(
      _$FloorPhotoDataImpl _value, $Res Function(_$FloorPhotoDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomFloor = null,
    Object? floorPhotoPath = null,
  }) {
    return _then(_$FloorPhotoDataImpl(
      roomFloor: null == roomFloor
          ? _value.roomFloor
          : roomFloor // ignore: cast_nullable_to_non_nullable
              as String,
      floorPhotoPath: null == floorPhotoPath
          ? _value.floorPhotoPath
          : floorPhotoPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FloorPhotoDataImpl implements _FloorPhotoData {
  _$FloorPhotoDataImpl({required this.roomFloor, required this.floorPhotoPath});

  factory _$FloorPhotoDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FloorPhotoDataImplFromJson(json);

  @override
  final String roomFloor;
  @override
  final String floorPhotoPath;

  @override
  String toString() {
    return 'FloorPhotoData(roomFloor: $roomFloor, floorPhotoPath: $floorPhotoPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorPhotoDataImpl &&
            (identical(other.roomFloor, roomFloor) ||
                other.roomFloor == roomFloor) &&
            (identical(other.floorPhotoPath, floorPhotoPath) ||
                other.floorPhotoPath == floorPhotoPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, roomFloor, floorPhotoPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FloorPhotoDataImplCopyWith<_$FloorPhotoDataImpl> get copyWith =>
      __$$FloorPhotoDataImplCopyWithImpl<_$FloorPhotoDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FloorPhotoDataImplToJson(
      this,
    );
  }
}

abstract class _FloorPhotoData implements FloorPhotoData {
  factory _FloorPhotoData(
      {required final String roomFloor,
      required final String floorPhotoPath}) = _$FloorPhotoDataImpl;

  factory _FloorPhotoData.fromJson(Map<String, dynamic> json) =
      _$FloorPhotoDataImpl.fromJson;

  @override
  String get roomFloor;
  @override
  String get floorPhotoPath;
  @override
  @JsonKey(ignore: true)
  _$$FloorPhotoDataImplCopyWith<_$FloorPhotoDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FloorPhotoModelError _$FloorPhotoModelErrorFromJson(Map<String, dynamic> json) {
  return _FloorPhotoModelError.fromJson(json);
}

/// @nodoc
mixin _$FloorPhotoModelError {
  String get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FloorPhotoModelErrorCopyWith<FloorPhotoModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorPhotoModelErrorCopyWith<$Res> {
  factory $FloorPhotoModelErrorCopyWith(FloorPhotoModelError value,
          $Res Function(FloorPhotoModelError) then) =
      _$FloorPhotoModelErrorCopyWithImpl<$Res, FloorPhotoModelError>;
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class _$FloorPhotoModelErrorCopyWithImpl<$Res,
        $Val extends FloorPhotoModelError>
    implements $FloorPhotoModelErrorCopyWith<$Res> {
  _$FloorPhotoModelErrorCopyWithImpl(this._value, this._then);

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
abstract class _$$FloorPhotoModelErrorImplCopyWith<$Res>
    implements $FloorPhotoModelErrorCopyWith<$Res> {
  factory _$$FloorPhotoModelErrorImplCopyWith(_$FloorPhotoModelErrorImpl value,
          $Res Function(_$FloorPhotoModelErrorImpl) then) =
      __$$FloorPhotoModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$FloorPhotoModelErrorImplCopyWithImpl<$Res>
    extends _$FloorPhotoModelErrorCopyWithImpl<$Res, _$FloorPhotoModelErrorImpl>
    implements _$$FloorPhotoModelErrorImplCopyWith<$Res> {
  __$$FloorPhotoModelErrorImplCopyWithImpl(_$FloorPhotoModelErrorImpl _value,
      $Res Function(_$FloorPhotoModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$FloorPhotoModelErrorImpl(
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
class _$FloorPhotoModelErrorImpl extends _FloorPhotoModelError {
  _$FloorPhotoModelErrorImpl({required this.message, this.code}) : super._();

  factory _$FloorPhotoModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$FloorPhotoModelErrorImplFromJson(json);

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'FloorPhotoModelError(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorPhotoModelErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FloorPhotoModelErrorImplCopyWith<_$FloorPhotoModelErrorImpl>
      get copyWith =>
          __$$FloorPhotoModelErrorImplCopyWithImpl<_$FloorPhotoModelErrorImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FloorPhotoModelErrorImplToJson(
      this,
    );
  }
}

abstract class _FloorPhotoModelError extends FloorPhotoModelError {
  factory _FloorPhotoModelError(
      {required final String message,
      final String? code}) = _$FloorPhotoModelErrorImpl;
  _FloorPhotoModelError._() : super._();

  factory _FloorPhotoModelError.fromJson(Map<String, dynamic> json) =
      _$FloorPhotoModelErrorImpl.fromJson;

  @override
  String get message;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$FloorPhotoModelErrorImplCopyWith<_$FloorPhotoModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
