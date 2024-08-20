// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoticeDetailModel _$NoticeDetailModelFromJson(Map<String, dynamic> json) {
  return _NoticeDetailModel.fromJson(json);
}

/// @nodoc
mixin _$NoticeDetailModel {
  String? get message => throw _privateConstructorUsedError;
  NoticeDetailData get data => throw _privateConstructorUsedError;
  NoticeDetailModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeDetailModelCopyWith<NoticeDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeDetailModelCopyWith<$Res> {
  factory $NoticeDetailModelCopyWith(
          NoticeDetailModel value, $Res Function(NoticeDetailModel) then) =
      _$NoticeDetailModelCopyWithImpl<$Res, NoticeDetailModel>;
  @useResult
  $Res call(
      {String? message, NoticeDetailData data, NoticeDetailModelType? type});

  $NoticeDetailDataCopyWith<$Res> get data;
}

/// @nodoc
class _$NoticeDetailModelCopyWithImpl<$Res, $Val extends NoticeDetailModel>
    implements $NoticeDetailModelCopyWith<$Res> {
  _$NoticeDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NoticeDetailData,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NoticeDetailModelType?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NoticeDetailDataCopyWith<$Res> get data {
    return $NoticeDetailDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NoticeDetailModelImplCopyWith<$Res>
    implements $NoticeDetailModelCopyWith<$Res> {
  factory _$$NoticeDetailModelImplCopyWith(_$NoticeDetailModelImpl value,
          $Res Function(_$NoticeDetailModelImpl) then) =
      __$$NoticeDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? message, NoticeDetailData data, NoticeDetailModelType? type});

  @override
  $NoticeDetailDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$NoticeDetailModelImplCopyWithImpl<$Res>
    extends _$NoticeDetailModelCopyWithImpl<$Res, _$NoticeDetailModelImpl>
    implements _$$NoticeDetailModelImplCopyWith<$Res> {
  __$$NoticeDetailModelImplCopyWithImpl(_$NoticeDetailModelImpl _value,
      $Res Function(_$NoticeDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = null,
    Object? type = freezed,
  }) {
    return _then(_$NoticeDetailModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NoticeDetailData,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NoticeDetailModelType?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NoticeDetailModelImpl extends _NoticeDetailModel {
  _$NoticeDetailModelImpl({this.message, required this.data, this.type})
      : super._();

  factory _$NoticeDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeDetailModelImplFromJson(json);

  @override
  final String? message;
  @override
  final NoticeDetailData data;
  @override
  final NoticeDetailModelType? type;

  @override
  String toString() {
    return 'NoticeDetailModel(message: $message, data: $data, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeDetailModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeDetailModelImplCopyWith<_$NoticeDetailModelImpl> get copyWith =>
      __$$NoticeDetailModelImplCopyWithImpl<_$NoticeDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeDetailModelImplToJson(
      this,
    );
  }
}

abstract class _NoticeDetailModel extends NoticeDetailModel {
  factory _NoticeDetailModel(
      {final String? message,
      required final NoticeDetailData data,
      final NoticeDetailModelType? type}) = _$NoticeDetailModelImpl;
  _NoticeDetailModel._() : super._();

  factory _NoticeDetailModel.fromJson(Map<String, dynamic> json) =
      _$NoticeDetailModelImpl.fromJson;

  @override
  String? get message;
  @override
  NoticeDetailData get data;
  @override
  NoticeDetailModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$NoticeDetailModelImplCopyWith<_$NoticeDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NoticeDetailData _$NoticeDetailDataFromJson(Map<String, dynamic> json) {
  return _NoticeDetailData.fromJson(json);
}

/// @nodoc
mixin _$NoticeDetailData {
  int get noticeId => throw _privateConstructorUsedError;
  String get noticeTitle => throw _privateConstructorUsedError;
  String get noticeContent => throw _privateConstructorUsedError;
  String? get adminName => throw _privateConstructorUsedError;
  String get noticeCreatedAt => throw _privateConstructorUsedError;
  List<String>? get noticePhotos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeDetailDataCopyWith<NoticeDetailData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeDetailDataCopyWith<$Res> {
  factory $NoticeDetailDataCopyWith(
          NoticeDetailData value, $Res Function(NoticeDetailData) then) =
      _$NoticeDetailDataCopyWithImpl<$Res, NoticeDetailData>;
  @useResult
  $Res call(
      {int noticeId,
      String noticeTitle,
      String noticeContent,
      String? adminName,
      String noticeCreatedAt,
      List<String>? noticePhotos});
}

/// @nodoc
class _$NoticeDetailDataCopyWithImpl<$Res, $Val extends NoticeDetailData>
    implements $NoticeDetailDataCopyWith<$Res> {
  _$NoticeDetailDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noticeId = null,
    Object? noticeTitle = null,
    Object? noticeContent = null,
    Object? adminName = freezed,
    Object? noticeCreatedAt = null,
    Object? noticePhotos = freezed,
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
      noticeContent: null == noticeContent
          ? _value.noticeContent
          : noticeContent // ignore: cast_nullable_to_non_nullable
              as String,
      adminName: freezed == adminName
          ? _value.adminName
          : adminName // ignore: cast_nullable_to_non_nullable
              as String?,
      noticeCreatedAt: null == noticeCreatedAt
          ? _value.noticeCreatedAt
          : noticeCreatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      noticePhotos: freezed == noticePhotos
          ? _value.noticePhotos
          : noticePhotos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeDetailDataImplCopyWith<$Res>
    implements $NoticeDetailDataCopyWith<$Res> {
  factory _$$NoticeDetailDataImplCopyWith(_$NoticeDetailDataImpl value,
          $Res Function(_$NoticeDetailDataImpl) then) =
      __$$NoticeDetailDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int noticeId,
      String noticeTitle,
      String noticeContent,
      String? adminName,
      String noticeCreatedAt,
      List<String>? noticePhotos});
}

/// @nodoc
class __$$NoticeDetailDataImplCopyWithImpl<$Res>
    extends _$NoticeDetailDataCopyWithImpl<$Res, _$NoticeDetailDataImpl>
    implements _$$NoticeDetailDataImplCopyWith<$Res> {
  __$$NoticeDetailDataImplCopyWithImpl(_$NoticeDetailDataImpl _value,
      $Res Function(_$NoticeDetailDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noticeId = null,
    Object? noticeTitle = null,
    Object? noticeContent = null,
    Object? adminName = freezed,
    Object? noticeCreatedAt = null,
    Object? noticePhotos = freezed,
  }) {
    return _then(_$NoticeDetailDataImpl(
      noticeId: null == noticeId
          ? _value.noticeId
          : noticeId // ignore: cast_nullable_to_non_nullable
              as int,
      noticeTitle: null == noticeTitle
          ? _value.noticeTitle
          : noticeTitle // ignore: cast_nullable_to_non_nullable
              as String,
      noticeContent: null == noticeContent
          ? _value.noticeContent
          : noticeContent // ignore: cast_nullable_to_non_nullable
              as String,
      adminName: freezed == adminName
          ? _value.adminName
          : adminName // ignore: cast_nullable_to_non_nullable
              as String?,
      noticeCreatedAt: null == noticeCreatedAt
          ? _value.noticeCreatedAt
          : noticeCreatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      noticePhotos: freezed == noticePhotos
          ? _value._noticePhotos
          : noticePhotos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NoticeDetailDataImpl implements _NoticeDetailData {
  _$NoticeDetailDataImpl(
      {required this.noticeId,
      required this.noticeTitle,
      required this.noticeContent,
      this.adminName,
      required this.noticeCreatedAt,
      final List<String>? noticePhotos})
      : _noticePhotos = noticePhotos;

  factory _$NoticeDetailDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeDetailDataImplFromJson(json);

  @override
  final int noticeId;
  @override
  final String noticeTitle;
  @override
  final String noticeContent;
  @override
  final String? adminName;
  @override
  final String noticeCreatedAt;
  final List<String>? _noticePhotos;
  @override
  List<String>? get noticePhotos {
    final value = _noticePhotos;
    if (value == null) return null;
    if (_noticePhotos is EqualUnmodifiableListView) return _noticePhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NoticeDetailData(noticeId: $noticeId, noticeTitle: $noticeTitle, noticeContent: $noticeContent, adminName: $adminName, noticeCreatedAt: $noticeCreatedAt, noticePhotos: $noticePhotos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeDetailDataImpl &&
            (identical(other.noticeId, noticeId) ||
                other.noticeId == noticeId) &&
            (identical(other.noticeTitle, noticeTitle) ||
                other.noticeTitle == noticeTitle) &&
            (identical(other.noticeContent, noticeContent) ||
                other.noticeContent == noticeContent) &&
            (identical(other.adminName, adminName) ||
                other.adminName == adminName) &&
            (identical(other.noticeCreatedAt, noticeCreatedAt) ||
                other.noticeCreatedAt == noticeCreatedAt) &&
            const DeepCollectionEquality()
                .equals(other._noticePhotos, _noticePhotos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      noticeId,
      noticeTitle,
      noticeContent,
      adminName,
      noticeCreatedAt,
      const DeepCollectionEquality().hash(_noticePhotos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeDetailDataImplCopyWith<_$NoticeDetailDataImpl> get copyWith =>
      __$$NoticeDetailDataImplCopyWithImpl<_$NoticeDetailDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeDetailDataImplToJson(
      this,
    );
  }
}

abstract class _NoticeDetailData implements NoticeDetailData {
  factory _NoticeDetailData(
      {required final int noticeId,
      required final String noticeTitle,
      required final String noticeContent,
      final String? adminName,
      required final String noticeCreatedAt,
      final List<String>? noticePhotos}) = _$NoticeDetailDataImpl;

  factory _NoticeDetailData.fromJson(Map<String, dynamic> json) =
      _$NoticeDetailDataImpl.fromJson;

  @override
  int get noticeId;
  @override
  String get noticeTitle;
  @override
  String get noticeContent;
  @override
  String? get adminName;
  @override
  String get noticeCreatedAt;
  @override
  List<String>? get noticePhotos;
  @override
  @JsonKey(ignore: true)
  _$$NoticeDetailDataImplCopyWith<_$NoticeDetailDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NoticeDetailModelError _$NoticeDetailModelErrorFromJson(
    Map<String, dynamic> json) {
  return _NoticeDetailModelError.fromJson(json);
}

/// @nodoc
mixin _$NoticeDetailModelError {
  String get message => throw _privateConstructorUsedError;
  NoticeDetailModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeDetailModelErrorCopyWith<NoticeDetailModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeDetailModelErrorCopyWith<$Res> {
  factory $NoticeDetailModelErrorCopyWith(NoticeDetailModelError value,
          $Res Function(NoticeDetailModelError) then) =
      _$NoticeDetailModelErrorCopyWithImpl<$Res, NoticeDetailModelError>;
  @useResult
  $Res call({String message, NoticeDetailModelType? type});
}

/// @nodoc
class _$NoticeDetailModelErrorCopyWithImpl<$Res,
        $Val extends NoticeDetailModelError>
    implements $NoticeDetailModelErrorCopyWith<$Res> {
  _$NoticeDetailModelErrorCopyWithImpl(this._value, this._then);

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
              as NoticeDetailModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeDetailModelErrorImplCopyWith<$Res>
    implements $NoticeDetailModelErrorCopyWith<$Res> {
  factory _$$NoticeDetailModelErrorImplCopyWith(
          _$NoticeDetailModelErrorImpl value,
          $Res Function(_$NoticeDetailModelErrorImpl) then) =
      __$$NoticeDetailModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, NoticeDetailModelType? type});
}

/// @nodoc
class __$$NoticeDetailModelErrorImplCopyWithImpl<$Res>
    extends _$NoticeDetailModelErrorCopyWithImpl<$Res,
        _$NoticeDetailModelErrorImpl>
    implements _$$NoticeDetailModelErrorImplCopyWith<$Res> {
  __$$NoticeDetailModelErrorImplCopyWithImpl(
      _$NoticeDetailModelErrorImpl _value,
      $Res Function(_$NoticeDetailModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = freezed,
  }) {
    return _then(_$NoticeDetailModelErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NoticeDetailModelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeDetailModelErrorImpl extends _NoticeDetailModelError {
  _$NoticeDetailModelErrorImpl({required this.message, this.type}) : super._();

  factory _$NoticeDetailModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeDetailModelErrorImplFromJson(json);

  @override
  final String message;
  @override
  final NoticeDetailModelType? type;

  @override
  String toString() {
    return 'NoticeDetailModelError(message: $message, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeDetailModelErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeDetailModelErrorImplCopyWith<_$NoticeDetailModelErrorImpl>
      get copyWith => __$$NoticeDetailModelErrorImplCopyWithImpl<
          _$NoticeDetailModelErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeDetailModelErrorImplToJson(
      this,
    );
  }
}

abstract class _NoticeDetailModelError extends NoticeDetailModelError {
  factory _NoticeDetailModelError(
      {required final String message,
      final NoticeDetailModelType? type}) = _$NoticeDetailModelErrorImpl;
  _NoticeDetailModelError._() : super._();

  factory _NoticeDetailModelError.fromJson(Map<String, dynamic> json) =
      _$NoticeDetailModelErrorImpl.fromJson;

  @override
  String get message;
  @override
  NoticeDetailModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$NoticeDetailModelErrorImplCopyWith<_$NoticeDetailModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
