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

/// @nodoc
mixin _$NoticeModel {
  String? get message => throw _privateConstructorUsedError;
  List<NoticeData> get data => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get totalElements => throw _privateConstructorUsedError;
  int? get currentPage => throw _privateConstructorUsedError;
  NoticeModelType? get type => throw _privateConstructorUsedError;

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
  $Res call(
      {String? message,
      List<NoticeData> data,
      int? totalPages,
      int? totalElements,
      int? currentPage,
      NoticeModelType? type});
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
    Object? message = freezed,
    Object? data = null,
    Object? totalPages = freezed,
    Object? totalElements = freezed,
    Object? currentPage = freezed,
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
              as List<NoticeData>,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalElements: freezed == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
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
  $Res call(
      {String? message,
      List<NoticeData> data,
      int? totalPages,
      int? totalElements,
      int? currentPage,
      NoticeModelType? type});
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
    Object? message = freezed,
    Object? data = null,
    Object? totalPages = freezed,
    Object? totalElements = freezed,
    Object? currentPage = freezed,
    Object? type = freezed,
  }) {
    return _then(_$NoticeModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NoticeData>,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalElements: freezed == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {this.message,
      required final List<NoticeData> data,
      this.totalPages,
      this.totalElements,
      this.currentPage,
      this.type})
      : _data = data,
        super._();

  @override
  final String? message;
  final List<NoticeData> _data;
  @override
  List<NoticeData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int? totalPages;
  @override
  final int? totalElements;
  @override
  final int? currentPage;
  @override
  final NoticeModelType? type;

  @override
  String toString() {
    return 'NoticeModel(message: $message, data: $data, totalPages: $totalPages, totalElements: $totalElements, currentPage: $currentPage, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      const DeepCollectionEquality().hash(_data),
      totalPages,
      totalElements,
      currentPage,
      type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeModelImplCopyWith<_$NoticeModelImpl> get copyWith =>
      __$$NoticeModelImplCopyWithImpl<_$NoticeModelImpl>(this, _$identity);
}

abstract class _NoticeModel extends NoticeModel {
  factory _NoticeModel(
      {final String? message,
      required final List<NoticeData> data,
      final int? totalPages,
      final int? totalElements,
      final int? currentPage,
      final NoticeModelType? type}) = _$NoticeModelImpl;
  _NoticeModel._() : super._();

  @override
  String? get message;
  @override
  List<NoticeData> get data;
  @override
  int? get totalPages;
  @override
  int? get totalElements;
  @override
  int? get currentPage;
  @override
  NoticeModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$NoticeModelImplCopyWith<_$NoticeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NoticeData {
  String get noticeUUID => throw _privateConstructorUsedError;
  String get noticeTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'adminName')
  String? get adminName => throw _privateConstructorUsedError;
  @JsonKey(name: 'authorName')
  String? get authorName => throw _privateConstructorUsedError;
  String get noticeCreatedAt => throw _privateConstructorUsedError;

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
      {String noticeUUID,
      String noticeTitle,
      @JsonKey(name: 'adminName') String? adminName,
      @JsonKey(name: 'authorName') String? authorName,
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
    Object? noticeUUID = null,
    Object? noticeTitle = null,
    Object? adminName = freezed,
    Object? authorName = freezed,
    Object? noticeCreatedAt = null,
  }) {
    return _then(_value.copyWith(
      noticeUUID: null == noticeUUID
          ? _value.noticeUUID
          : noticeUUID // ignore: cast_nullable_to_non_nullable
              as String,
      noticeTitle: null == noticeTitle
          ? _value.noticeTitle
          : noticeTitle // ignore: cast_nullable_to_non_nullable
              as String,
      adminName: freezed == adminName
          ? _value.adminName
          : adminName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String noticeUUID,
      String noticeTitle,
      @JsonKey(name: 'adminName') String? adminName,
      @JsonKey(name: 'authorName') String? authorName,
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
    Object? noticeUUID = null,
    Object? noticeTitle = null,
    Object? adminName = freezed,
    Object? authorName = freezed,
    Object? noticeCreatedAt = null,
  }) {
    return _then(_$NoticeDataImpl(
      noticeUUID: null == noticeUUID
          ? _value.noticeUUID
          : noticeUUID // ignore: cast_nullable_to_non_nullable
              as String,
      noticeTitle: null == noticeTitle
          ? _value.noticeTitle
          : noticeTitle // ignore: cast_nullable_to_non_nullable
              as String,
      adminName: freezed == adminName
          ? _value.adminName
          : adminName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      noticeCreatedAt: null == noticeCreatedAt
          ? _value.noticeCreatedAt
          : noticeCreatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoticeDataImpl extends _NoticeData {
  _$NoticeDataImpl(
      {required this.noticeUUID,
      required this.noticeTitle,
      @JsonKey(name: 'adminName') this.adminName,
      @JsonKey(name: 'authorName') this.authorName,
      required this.noticeCreatedAt})
      : super._();

  @override
  final String noticeUUID;
  @override
  final String noticeTitle;
  @override
  @JsonKey(name: 'adminName')
  final String? adminName;
  @override
  @JsonKey(name: 'authorName')
  final String? authorName;
  @override
  final String noticeCreatedAt;

  @override
  String toString() {
    return 'NoticeData(noticeUUID: $noticeUUID, noticeTitle: $noticeTitle, adminName: $adminName, authorName: $authorName, noticeCreatedAt: $noticeCreatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeDataImpl &&
            (identical(other.noticeUUID, noticeUUID) ||
                other.noticeUUID == noticeUUID) &&
            (identical(other.noticeTitle, noticeTitle) ||
                other.noticeTitle == noticeTitle) &&
            (identical(other.adminName, adminName) ||
                other.adminName == adminName) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.noticeCreatedAt, noticeCreatedAt) ||
                other.noticeCreatedAt == noticeCreatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noticeUUID, noticeTitle,
      adminName, authorName, noticeCreatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeDataImplCopyWith<_$NoticeDataImpl> get copyWith =>
      __$$NoticeDataImplCopyWithImpl<_$NoticeDataImpl>(this, _$identity);
}

abstract class _NoticeData extends NoticeData {
  factory _NoticeData(
      {required final String noticeUUID,
      required final String noticeTitle,
      @JsonKey(name: 'adminName') final String? adminName,
      @JsonKey(name: 'authorName') final String? authorName,
      required final String noticeCreatedAt}) = _$NoticeDataImpl;
  _NoticeData._() : super._();

  @override
  String get noticeUUID;
  @override
  String get noticeTitle;
  @override
  @JsonKey(name: 'adminName')
  String? get adminName;
  @override
  @JsonKey(name: 'authorName')
  String? get authorName;
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
