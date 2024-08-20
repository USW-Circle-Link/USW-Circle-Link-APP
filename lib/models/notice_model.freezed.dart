// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) {
  return _NoticeModel.fromJson(json);
}

/// @nodoc
mixin _$NoticeModel {
  String get message => throw _privateConstructorUsedError;
  List<NoticeData> get data => throw _privateConstructorUsedError;
  NoticeModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeModelCopyWith<NoticeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeModelCopyWith<$Res> {
  factory $NoticeModelCopyWith(
          NoticeModel value, $Res Function(NoticeModel) then) =
      _$NoticeModelCopyWithImpl<$Res, NoticeModel>;
  @useResult
  $Res call({String message, List<NoticeData> data, NoticeModelType? type});
}

/// @nodoc
class _$NoticeModelCopyWithImpl<$Res, $Val extends NoticeModel>
    implements $NoticeModelCopyWith<$Res> {
  _$NoticeModelCopyWithImpl(this._value, this._then);

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
              as List<NoticeData>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NoticeModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeModelImplCopyWith<$Res>
    implements $NoticeModelCopyWith<$Res> {
  factory _$$NoticeModelImplCopyWith(
          _$NoticeModelImpl value, $Res Function(_$NoticeModelImpl) then) =
      __$$NoticeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<NoticeData> data, NoticeModelType? type});
}

/// @nodoc
class __$$NoticeModelImplCopyWithImpl<$Res>
    extends _$NoticeModelCopyWithImpl<$Res, _$NoticeModelImpl>
    implements _$$NoticeModelImplCopyWith<$Res> {
  __$$NoticeModelImplCopyWithImpl(
      _$NoticeModelImpl _value, $Res Function(_$NoticeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
    Object? type = freezed,
  }) {
    return _then(_$NoticeModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NoticeData>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NoticeModelType?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NoticeModelImpl extends _NoticeModel {
  _$NoticeModelImpl(
      {required this.message, required final List<NoticeData> data, this.type})
      : _data = data,
        super._();

  factory _$NoticeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeModelImplFromJson(json);

  @override
  final String message;
  final List<NoticeData> _data;
  @override
  List<NoticeData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final NoticeModelType? type;

  @override
  String toString() {
    return 'NoticeModel(message: $message, data: $data, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeModelImpl &&
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
  _$$NoticeModelImplCopyWith<_$NoticeModelImpl> get copyWith =>
      __$$NoticeModelImplCopyWithImpl<_$NoticeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeModelImplToJson(
      this,
    );
  }
}

abstract class _NoticeModel extends NoticeModel {
  factory _NoticeModel(
      {required final String message,
      required final List<NoticeData> data,
      final NoticeModelType? type}) = _$NoticeModelImpl;
  _NoticeModel._() : super._();

  factory _NoticeModel.fromJson(Map<String, dynamic> json) =
      _$NoticeModelImpl.fromJson;

  @override
  String get message;
  @override
  List<NoticeData> get data;
  @override
  NoticeModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$NoticeModelImplCopyWith<_$NoticeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NoticeData _$NoticeDataFromJson(Map<String, dynamic> json) {
  return _NoticeData.fromJson(json);
}

/// @nodoc
mixin _$NoticeData {
  int get noticeId => throw _privateConstructorUsedError;
  String get noticeTitle => throw _privateConstructorUsedError;
  String get adminName => throw _privateConstructorUsedError;
  String get noticeCreatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeDataCopyWith<NoticeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeDataCopyWith<$Res> {
  factory $NoticeDataCopyWith(
          NoticeData value, $Res Function(NoticeData) then) =
      _$NoticeDataCopyWithImpl<$Res, NoticeData>;
  @useResult
  $Res call(
      {int noticeId,
      String noticeTitle,
      String adminName,
      String noticeCreatedAt});
}

/// @nodoc
class _$NoticeDataCopyWithImpl<$Res, $Val extends NoticeData>
    implements $NoticeDataCopyWith<$Res> {
  _$NoticeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noticeId = null,
    Object? noticeTitle = null,
    Object? adminName = null,
    Object? noticeCreatedAt = null,
  }) {
    return _then(_value.copyWith(
      noticeId: null == noticeId
          ? _value.noticeId
          : noticeId // ignore: cast_nullable_to_non_nullable
              as int,
      noticeTitle: null == noticeTitle
          ? _value.noticeTitle
          : noticeTitle // ignore: cast_nullable_to_non_nullable
              as String,
      adminName: null == adminName
          ? _value.adminName
          : adminName // ignore: cast_nullable_to_non_nullable
              as String,
      noticeCreatedAt: null == noticeCreatedAt
          ? _value.noticeCreatedAt
          : noticeCreatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeDataImplCopyWith<$Res>
    implements $NoticeDataCopyWith<$Res> {
  factory _$$NoticeDataImplCopyWith(
          _$NoticeDataImpl value, $Res Function(_$NoticeDataImpl) then) =
      __$$NoticeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int noticeId,
      String noticeTitle,
      String adminName,
      String noticeCreatedAt});
}

/// @nodoc
class __$$NoticeDataImplCopyWithImpl<$Res>
    extends _$NoticeDataCopyWithImpl<$Res, _$NoticeDataImpl>
    implements _$$NoticeDataImplCopyWith<$Res> {
  __$$NoticeDataImplCopyWithImpl(
      _$NoticeDataImpl _value, $Res Function(_$NoticeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noticeId = null,
    Object? noticeTitle = null,
    Object? adminName = null,
    Object? noticeCreatedAt = null,
  }) {
    return _then(_$NoticeDataImpl(
      noticeId: null == noticeId
          ? _value.noticeId
          : noticeId // ignore: cast_nullable_to_non_nullable
              as int,
      noticeTitle: null == noticeTitle
          ? _value.noticeTitle
          : noticeTitle // ignore: cast_nullable_to_non_nullable
              as String,
      adminName: null == adminName
          ? _value.adminName
          : adminName // ignore: cast_nullable_to_non_nullable
              as String,
      noticeCreatedAt: null == noticeCreatedAt
          ? _value.noticeCreatedAt
          : noticeCreatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeDataImpl implements _NoticeData {
  _$NoticeDataImpl(
      {required this.noticeId,
      required this.noticeTitle,
      required this.adminName,
      required this.noticeCreatedAt});

  factory _$NoticeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeDataImplFromJson(json);

  @override
  final int noticeId;
  @override
  final String noticeTitle;
  @override
  final String adminName;
  @override
  final String noticeCreatedAt;

  @override
  String toString() {
    return 'NoticeData(noticeId: $noticeId, noticeTitle: $noticeTitle, adminName: $adminName, noticeCreatedAt: $noticeCreatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeDataImpl &&
            (identical(other.noticeId, noticeId) ||
                other.noticeId == noticeId) &&
            (identical(other.noticeTitle, noticeTitle) ||
                other.noticeTitle == noticeTitle) &&
            (identical(other.adminName, adminName) ||
                other.adminName == adminName) &&
            (identical(other.noticeCreatedAt, noticeCreatedAt) ||
                other.noticeCreatedAt == noticeCreatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, noticeId, noticeTitle, adminName, noticeCreatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeDataImplCopyWith<_$NoticeDataImpl> get copyWith =>
      __$$NoticeDataImplCopyWithImpl<_$NoticeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeDataImplToJson(
      this,
    );
  }
}

abstract class _NoticeData implements NoticeData {
  factory _NoticeData(
      {required final int noticeId,
      required final String noticeTitle,
      required final String adminName,
      required final String noticeCreatedAt}) = _$NoticeDataImpl;

  factory _NoticeData.fromJson(Map<String, dynamic> json) =
      _$NoticeDataImpl.fromJson;

  @override
  int get noticeId;
  @override
  String get noticeTitle;
  @override
  String get adminName;
  @override
  String get noticeCreatedAt;
  @override
  @JsonKey(ignore: true)
  _$$NoticeDataImplCopyWith<_$NoticeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NoticeModelError _$NoticeModelErrorFromJson(Map<String, dynamic> json) {
  return _NoticeModelError.fromJson(json);
}

/// @nodoc
mixin _$NoticeModelError {
  String get message => throw _privateConstructorUsedError;
  NoticeModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeModelErrorCopyWith<NoticeModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeModelErrorCopyWith<$Res> {
  factory $NoticeModelErrorCopyWith(
          NoticeModelError value, $Res Function(NoticeModelError) then) =
      _$NoticeModelErrorCopyWithImpl<$Res, NoticeModelError>;
  @useResult
  $Res call({String message, NoticeModelType? type});
}

/// @nodoc
class _$NoticeModelErrorCopyWithImpl<$Res, $Val extends NoticeModelError>
    implements $NoticeModelErrorCopyWith<$Res> {
  _$NoticeModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NoticeModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeModelErrorImplCopyWith<$Res>
    implements $NoticeModelErrorCopyWith<$Res> {
  factory _$$NoticeModelErrorImplCopyWith(_$NoticeModelErrorImpl value,
          $Res Function(_$NoticeModelErrorImpl) then) =
      __$$NoticeModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, NoticeModelType? type});
}

/// @nodoc
class __$$NoticeModelErrorImplCopyWithImpl<$Res>
    extends _$NoticeModelErrorCopyWithImpl<$Res, _$NoticeModelErrorImpl>
    implements _$$NoticeModelErrorImplCopyWith<$Res> {
  __$$NoticeModelErrorImplCopyWithImpl(_$NoticeModelErrorImpl _value,
      $Res Function(_$NoticeModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = freezed,
  }) {
    return _then(_$NoticeModelErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NoticeModelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeModelErrorImpl extends _NoticeModelError {
  _$NoticeModelErrorImpl({required this.message, this.type}) : super._();

  factory _$NoticeModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeModelErrorImplFromJson(json);

  @override
  final String message;
  @override
  final NoticeModelType? type;

  @override
  String toString() {
    return 'NoticeModelError(message: $message, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeModelErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeModelErrorImplCopyWith<_$NoticeModelErrorImpl> get copyWith =>
      __$$NoticeModelErrorImplCopyWithImpl<_$NoticeModelErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeModelErrorImplToJson(
      this,
    );
  }
}

abstract class _NoticeModelError extends NoticeModelError {
  factory _NoticeModelError(
      {required final String message,
      final NoticeModelType? type}) = _$NoticeModelErrorImpl;
  _NoticeModelError._() : super._();

  factory _NoticeModelError.fromJson(Map<String, dynamic> json) =
      _$NoticeModelErrorImpl.fromJson;

  @override
  String get message;
  @override
  NoticeModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$NoticeModelErrorImplCopyWith<_$NoticeModelErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
