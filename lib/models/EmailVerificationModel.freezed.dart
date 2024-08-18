// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'EmailVerificationModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmailVerificationModel _$EmailVerificationModelFromJson(
    Map<String, dynamic> json) {
  return _EmailVerificationModel.fromJson(json);
}

/// @nodoc
mixin _$EmailVerificationModel {
  String get message => throw _privateConstructorUsedError;
  EmailVerificationData get data => throw _privateConstructorUsedError;
  EmailVerificationModelType? get type => throw _privateConstructorUsedError;

  /// Serializes this EmailVerificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmailVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailVerificationModelCopyWith<EmailVerificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationModelCopyWith<$Res> {
  factory $EmailVerificationModelCopyWith(EmailVerificationModel value,
          $Res Function(EmailVerificationModel) then) =
      _$EmailVerificationModelCopyWithImpl<$Res, EmailVerificationModel>;
  @useResult
  $Res call(
      {String message,
      EmailVerificationData data,
      EmailVerificationModelType? type});

  $EmailVerificationDataCopyWith<$Res> get data;
}

/// @nodoc
class _$EmailVerificationModelCopyWithImpl<$Res,
        $Val extends EmailVerificationModel>
    implements $EmailVerificationModelCopyWith<$Res> {
  _$EmailVerificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailVerificationModel
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
              as EmailVerificationData,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EmailVerificationModelType?,
    ) as $Val);
  }

  /// Create a copy of EmailVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmailVerificationDataCopyWith<$Res> get data {
    return $EmailVerificationDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmailVerificationModelImplCopyWith<$Res>
    implements $EmailVerificationModelCopyWith<$Res> {
  factory _$$EmailVerificationModelImplCopyWith(
          _$EmailVerificationModelImpl value,
          $Res Function(_$EmailVerificationModelImpl) then) =
      __$$EmailVerificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      EmailVerificationData data,
      EmailVerificationModelType? type});

  @override
  $EmailVerificationDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$EmailVerificationModelImplCopyWithImpl<$Res>
    extends _$EmailVerificationModelCopyWithImpl<$Res,
        _$EmailVerificationModelImpl>
    implements _$$EmailVerificationModelImplCopyWith<$Res> {
  __$$EmailVerificationModelImplCopyWithImpl(
      _$EmailVerificationModelImpl _value,
      $Res Function(_$EmailVerificationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmailVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
    Object? type = freezed,
  }) {
    return _then(_$EmailVerificationModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as EmailVerificationData,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EmailVerificationModelType?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EmailVerificationModelImpl extends _EmailVerificationModel {
  _$EmailVerificationModelImpl(
      {required this.message, required this.data, this.type})
      : super._();

  factory _$EmailVerificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailVerificationModelImplFromJson(json);

  @override
  final String message;
  @override
  final EmailVerificationData data;
  @override
  final EmailVerificationModelType? type;

  @override
  String toString() {
    return 'EmailVerificationModel(message: $message, data: $data, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data, type);

  /// Create a copy of EmailVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerificationModelImplCopyWith<_$EmailVerificationModelImpl>
      get copyWith => __$$EmailVerificationModelImplCopyWithImpl<
          _$EmailVerificationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailVerificationModelImplToJson(
      this,
    );
  }
}

abstract class _EmailVerificationModel extends EmailVerificationModel {
  factory _EmailVerificationModel(
      {required final String message,
      required final EmailVerificationData data,
      final EmailVerificationModelType? type}) = _$EmailVerificationModelImpl;
  _EmailVerificationModel._() : super._();

  factory _EmailVerificationModel.fromJson(Map<String, dynamic> json) =
      _$EmailVerificationModelImpl.fromJson;

  @override
  String get message;
  @override
  EmailVerificationData get data;
  @override
  EmailVerificationModelType? get type;

  /// Create a copy of EmailVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailVerificationModelImplCopyWith<_$EmailVerificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EmailVerificationData _$EmailVerificationDataFromJson(
    Map<String, dynamic> json) {
  return _EmailVerificationData.fromJson(json);
}

/// @nodoc
mixin _$EmailVerificationData {
  String get account => throw _privateConstructorUsedError;
  String get emailToken_uuid => throw _privateConstructorUsedError;

  /// Serializes this EmailVerificationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmailVerificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailVerificationDataCopyWith<EmailVerificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationDataCopyWith<$Res> {
  factory $EmailVerificationDataCopyWith(EmailVerificationData value,
          $Res Function(EmailVerificationData) then) =
      _$EmailVerificationDataCopyWithImpl<$Res, EmailVerificationData>;
  @useResult
  $Res call({String account, String emailToken_uuid});
}

/// @nodoc
class _$EmailVerificationDataCopyWithImpl<$Res,
        $Val extends EmailVerificationData>
    implements $EmailVerificationDataCopyWith<$Res> {
  _$EmailVerificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailVerificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? emailToken_uuid = null,
  }) {
    return _then(_value.copyWith(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      emailToken_uuid: null == emailToken_uuid
          ? _value.emailToken_uuid
          : emailToken_uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailVerificationDataImplCopyWith<$Res>
    implements $EmailVerificationDataCopyWith<$Res> {
  factory _$$EmailVerificationDataImplCopyWith(
          _$EmailVerificationDataImpl value,
          $Res Function(_$EmailVerificationDataImpl) then) =
      __$$EmailVerificationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String account, String emailToken_uuid});
}

/// @nodoc
class __$$EmailVerificationDataImplCopyWithImpl<$Res>
    extends _$EmailVerificationDataCopyWithImpl<$Res,
        _$EmailVerificationDataImpl>
    implements _$$EmailVerificationDataImplCopyWith<$Res> {
  __$$EmailVerificationDataImplCopyWithImpl(_$EmailVerificationDataImpl _value,
      $Res Function(_$EmailVerificationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmailVerificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? emailToken_uuid = null,
  }) {
    return _then(_$EmailVerificationDataImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      emailToken_uuid: null == emailToken_uuid
          ? _value.emailToken_uuid
          : emailToken_uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailVerificationDataImpl implements _EmailVerificationData {
  _$EmailVerificationDataImpl(
      {required this.account, required this.emailToken_uuid});

  factory _$EmailVerificationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailVerificationDataImplFromJson(json);

  @override
  final String account;
  @override
  final String emailToken_uuid;

  @override
  String toString() {
    return 'EmailVerificationData(account: $account, emailToken_uuid: $emailToken_uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationDataImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.emailToken_uuid, emailToken_uuid) ||
                other.emailToken_uuid == emailToken_uuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, account, emailToken_uuid);

  /// Create a copy of EmailVerificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerificationDataImplCopyWith<_$EmailVerificationDataImpl>
      get copyWith => __$$EmailVerificationDataImplCopyWithImpl<
          _$EmailVerificationDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailVerificationDataImplToJson(
      this,
    );
  }
}

abstract class _EmailVerificationData implements EmailVerificationData {
  factory _EmailVerificationData(
      {required final String account,
      required final String emailToken_uuid}) = _$EmailVerificationDataImpl;

  factory _EmailVerificationData.fromJson(Map<String, dynamic> json) =
      _$EmailVerificationDataImpl.fromJson;

  @override
  String get account;
  @override
  String get emailToken_uuid;

  /// Create a copy of EmailVerificationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailVerificationDataImplCopyWith<_$EmailVerificationDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EmailVerificationModelResend _$EmailVerificationModelResendFromJson(
    Map<String, dynamic> json) {
  return _EmailVerificationModelResend.fromJson(json);
}

/// @nodoc
mixin _$EmailVerificationModelResend {
  String get message => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  EmailVerificationModelType? get type => throw _privateConstructorUsedError;

  /// Serializes this EmailVerificationModelResend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmailVerificationModelResend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailVerificationModelResendCopyWith<EmailVerificationModelResend>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationModelResendCopyWith<$Res> {
  factory $EmailVerificationModelResendCopyWith(
          EmailVerificationModelResend value,
          $Res Function(EmailVerificationModelResend) then) =
      _$EmailVerificationModelResendCopyWithImpl<$Res,
          EmailVerificationModelResend>;
  @useResult
  $Res call({String message, String data, EmailVerificationModelType? type});
}

/// @nodoc
class _$EmailVerificationModelResendCopyWithImpl<$Res,
        $Val extends EmailVerificationModelResend>
    implements $EmailVerificationModelResendCopyWith<$Res> {
  _$EmailVerificationModelResendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailVerificationModelResend
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
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EmailVerificationModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailVerificationModelResendImplCopyWith<$Res>
    implements $EmailVerificationModelResendCopyWith<$Res> {
  factory _$$EmailVerificationModelResendImplCopyWith(
          _$EmailVerificationModelResendImpl value,
          $Res Function(_$EmailVerificationModelResendImpl) then) =
      __$$EmailVerificationModelResendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String data, EmailVerificationModelType? type});
}

/// @nodoc
class __$$EmailVerificationModelResendImplCopyWithImpl<$Res>
    extends _$EmailVerificationModelResendCopyWithImpl<$Res,
        _$EmailVerificationModelResendImpl>
    implements _$$EmailVerificationModelResendImplCopyWith<$Res> {
  __$$EmailVerificationModelResendImplCopyWithImpl(
      _$EmailVerificationModelResendImpl _value,
      $Res Function(_$EmailVerificationModelResendImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmailVerificationModelResend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
    Object? type = freezed,
  }) {
    return _then(_$EmailVerificationModelResendImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EmailVerificationModelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailVerificationModelResendImpl extends _EmailVerificationModelResend {
  _$EmailVerificationModelResendImpl(
      {required this.message, required this.data, this.type})
      : super._();

  factory _$EmailVerificationModelResendImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EmailVerificationModelResendImplFromJson(json);

  @override
  final String message;
  @override
  final String data;
  @override
  final EmailVerificationModelType? type;

  @override
  String toString() {
    return 'EmailVerificationModelResend(message: $message, data: $data, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationModelResendImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data, type);

  /// Create a copy of EmailVerificationModelResend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerificationModelResendImplCopyWith<
          _$EmailVerificationModelResendImpl>
      get copyWith => __$$EmailVerificationModelResendImplCopyWithImpl<
          _$EmailVerificationModelResendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailVerificationModelResendImplToJson(
      this,
    );
  }
}

abstract class _EmailVerificationModelResend
    extends EmailVerificationModelResend {
  factory _EmailVerificationModelResend(
          {required final String message,
          required final String data,
          final EmailVerificationModelType? type}) =
      _$EmailVerificationModelResendImpl;
  _EmailVerificationModelResend._() : super._();

  factory _EmailVerificationModelResend.fromJson(Map<String, dynamic> json) =
      _$EmailVerificationModelResendImpl.fromJson;

  @override
  String get message;
  @override
  String get data;
  @override
  EmailVerificationModelType? get type;

  /// Create a copy of EmailVerificationModelResend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailVerificationModelResendImplCopyWith<
          _$EmailVerificationModelResendImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EmailVerificationModelComplete _$EmailVerificationModelCompleteFromJson(
    Map<String, dynamic> json) {
  return _EmailVerificationModelComplete.fromJson(json);
}

/// @nodoc
mixin _$EmailVerificationModelComplete {
  String get message => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  EmailVerificationModelType? get type => throw _privateConstructorUsedError;

  /// Serializes this EmailVerificationModelComplete to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmailVerificationModelComplete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailVerificationModelCompleteCopyWith<EmailVerificationModelComplete>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationModelCompleteCopyWith<$Res> {
  factory $EmailVerificationModelCompleteCopyWith(
          EmailVerificationModelComplete value,
          $Res Function(EmailVerificationModelComplete) then) =
      _$EmailVerificationModelCompleteCopyWithImpl<$Res,
          EmailVerificationModelComplete>;
  @useResult
  $Res call({String message, String data, EmailVerificationModelType? type});
}

/// @nodoc
class _$EmailVerificationModelCompleteCopyWithImpl<$Res,
        $Val extends EmailVerificationModelComplete>
    implements $EmailVerificationModelCompleteCopyWith<$Res> {
  _$EmailVerificationModelCompleteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailVerificationModelComplete
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
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EmailVerificationModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailVerificationModelCompleteImplCopyWith<$Res>
    implements $EmailVerificationModelCompleteCopyWith<$Res> {
  factory _$$EmailVerificationModelCompleteImplCopyWith(
          _$EmailVerificationModelCompleteImpl value,
          $Res Function(_$EmailVerificationModelCompleteImpl) then) =
      __$$EmailVerificationModelCompleteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String data, EmailVerificationModelType? type});
}

/// @nodoc
class __$$EmailVerificationModelCompleteImplCopyWithImpl<$Res>
    extends _$EmailVerificationModelCompleteCopyWithImpl<$Res,
        _$EmailVerificationModelCompleteImpl>
    implements _$$EmailVerificationModelCompleteImplCopyWith<$Res> {
  __$$EmailVerificationModelCompleteImplCopyWithImpl(
      _$EmailVerificationModelCompleteImpl _value,
      $Res Function(_$EmailVerificationModelCompleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmailVerificationModelComplete
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
    Object? type = freezed,
  }) {
    return _then(_$EmailVerificationModelCompleteImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EmailVerificationModelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailVerificationModelCompleteImpl
    extends _EmailVerificationModelComplete {
  _$EmailVerificationModelCompleteImpl(
      {required this.message, required this.data, this.type})
      : super._();

  factory _$EmailVerificationModelCompleteImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EmailVerificationModelCompleteImplFromJson(json);

  @override
  final String message;
  @override
  final String data;
  @override
  final EmailVerificationModelType? type;

  @override
  String toString() {
    return 'EmailVerificationModelComplete(message: $message, data: $data, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationModelCompleteImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data, type);

  /// Create a copy of EmailVerificationModelComplete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerificationModelCompleteImplCopyWith<
          _$EmailVerificationModelCompleteImpl>
      get copyWith => __$$EmailVerificationModelCompleteImplCopyWithImpl<
          _$EmailVerificationModelCompleteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailVerificationModelCompleteImplToJson(
      this,
    );
  }
}

abstract class _EmailVerificationModelComplete
    extends EmailVerificationModelComplete {
  factory _EmailVerificationModelComplete(
          {required final String message,
          required final String data,
          final EmailVerificationModelType? type}) =
      _$EmailVerificationModelCompleteImpl;
  _EmailVerificationModelComplete._() : super._();

  factory _EmailVerificationModelComplete.fromJson(Map<String, dynamic> json) =
      _$EmailVerificationModelCompleteImpl.fromJson;

  @override
  String get message;
  @override
  String get data;
  @override
  EmailVerificationModelType? get type;

  /// Create a copy of EmailVerificationModelComplete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailVerificationModelCompleteImplCopyWith<
          _$EmailVerificationModelCompleteImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EmailVerificationModelError _$EmailVerificationModelErrorFromJson(
    Map<String, dynamic> json) {
  return _EmailVerificationModelError.fromJson(json);
}

/// @nodoc
mixin _$EmailVerificationModelError {
  String? get exception => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  EmailVerificationModelType? get type => throw _privateConstructorUsedError;

  /// Serializes this EmailVerificationModelError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmailVerificationModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailVerificationModelErrorCopyWith<EmailVerificationModelError>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationModelErrorCopyWith<$Res> {
  factory $EmailVerificationModelErrorCopyWith(
          EmailVerificationModelError value,
          $Res Function(EmailVerificationModelError) then) =
      _$EmailVerificationModelErrorCopyWithImpl<$Res,
          EmailVerificationModelError>;
  @useResult
  $Res call(
      {String? exception,
      String? code,
      String? error,
      int? status,
      String message,
      EmailVerificationModelType? type});
}

/// @nodoc
class _$EmailVerificationModelErrorCopyWithImpl<$Res,
        $Val extends EmailVerificationModelError>
    implements $EmailVerificationModelErrorCopyWith<$Res> {
  _$EmailVerificationModelErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailVerificationModelError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? code = freezed,
    Object? error = freezed,
    Object? status = freezed,
    Object? message = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EmailVerificationModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailVerificationModelErrorImplCopyWith<$Res>
    implements $EmailVerificationModelErrorCopyWith<$Res> {
  factory _$$EmailVerificationModelErrorImplCopyWith(
          _$EmailVerificationModelErrorImpl value,
          $Res Function(_$EmailVerificationModelErrorImpl) then) =
      __$$EmailVerificationModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? exception,
      String? code,
      String? error,
      int? status,
      String message,
      EmailVerificationModelType? type});
}

/// @nodoc
class __$$EmailVerificationModelErrorImplCopyWithImpl<$Res>
    extends _$EmailVerificationModelErrorCopyWithImpl<$Res,
        _$EmailVerificationModelErrorImpl>
    implements _$$EmailVerificationModelErrorImplCopyWith<$Res> {
  __$$EmailVerificationModelErrorImplCopyWithImpl(
      _$EmailVerificationModelErrorImpl _value,
      $Res Function(_$EmailVerificationModelErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmailVerificationModelError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? code = freezed,
    Object? error = freezed,
    Object? status = freezed,
    Object? message = null,
    Object? type = freezed,
  }) {
    return _then(_$EmailVerificationModelErrorImpl(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EmailVerificationModelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailVerificationModelErrorImpl extends _EmailVerificationModelError {
  _$EmailVerificationModelErrorImpl(
      {this.exception,
      this.code,
      this.error,
      this.status,
      required this.message,
      this.type})
      : super._();

  factory _$EmailVerificationModelErrorImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EmailVerificationModelErrorImplFromJson(json);

  @override
  final String? exception;
  @override
  final String? code;
  @override
  final String? error;
  @override
  final int? status;
  @override
  final String message;
  @override
  final EmailVerificationModelType? type;

  @override
  String toString() {
    return 'EmailVerificationModelError(exception: $exception, code: $code, error: $error, status: $status, message: $message, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationModelErrorImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, exception, code, error, status, message, type);

  /// Create a copy of EmailVerificationModelError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerificationModelErrorImplCopyWith<_$EmailVerificationModelErrorImpl>
      get copyWith => __$$EmailVerificationModelErrorImplCopyWithImpl<
          _$EmailVerificationModelErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailVerificationModelErrorImplToJson(
      this,
    );
  }
}

abstract class _EmailVerificationModelError
    extends EmailVerificationModelError {
  factory _EmailVerificationModelError(
          {final String? exception,
          final String? code,
          final String? error,
          final int? status,
          required final String message,
          final EmailVerificationModelType? type}) =
      _$EmailVerificationModelErrorImpl;
  _EmailVerificationModelError._() : super._();

  factory _EmailVerificationModelError.fromJson(Map<String, dynamic> json) =
      _$EmailVerificationModelErrorImpl.fromJson;

  @override
  String? get exception;
  @override
  String? get code;
  @override
  String? get error;
  @override
  int? get status;
  @override
  String get message;
  @override
  EmailVerificationModelType? get type;

  /// Create a copy of EmailVerificationModelError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailVerificationModelErrorImplCopyWith<_$EmailVerificationModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
