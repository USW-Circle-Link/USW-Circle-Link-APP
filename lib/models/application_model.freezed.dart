// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApplicationModel _$ApplicationModelFromJson(Map<String, dynamic> json) {
  return _ApplicationModel.fromJson(json);
}

/// @nodoc
mixin _$ApplicationModel {
  String get message => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;
  ApplicationModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationModelCopyWith<ApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationModelCopyWith<$Res> {
  factory $ApplicationModelCopyWith(
          ApplicationModel value, $Res Function(ApplicationModel) then) =
      _$ApplicationModelCopyWithImpl<$Res, ApplicationModel>;
  @useResult
  $Res call({String message, String? data, ApplicationModelType? type});
}

/// @nodoc
class _$ApplicationModelCopyWithImpl<$Res, $Val extends ApplicationModel>
    implements $ApplicationModelCopyWith<$Res> {
  _$ApplicationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ApplicationModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationModelImplCopyWith<$Res>
    implements $ApplicationModelCopyWith<$Res> {
  factory _$$ApplicationModelImplCopyWith(_$ApplicationModelImpl value,
          $Res Function(_$ApplicationModelImpl) then) =
      __$$ApplicationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? data, ApplicationModelType? type});
}

/// @nodoc
class __$$ApplicationModelImplCopyWithImpl<$Res>
    extends _$ApplicationModelCopyWithImpl<$Res, _$ApplicationModelImpl>
    implements _$$ApplicationModelImplCopyWith<$Res> {
  __$$ApplicationModelImplCopyWithImpl(_$ApplicationModelImpl _value,
      $Res Function(_$ApplicationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = freezed,
    Object? type = freezed,
  }) {
    return _then(_$ApplicationModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ApplicationModelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationModelImpl extends _ApplicationModel {
  _$ApplicationModelImpl({required this.message, this.data, this.type})
      : super._();

  factory _$ApplicationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationModelImplFromJson(json);

  @override
  final String message;
  @override
  final String? data;
  @override
  final ApplicationModelType? type;

  @override
  String toString() {
    return 'ApplicationModel(message: $message, data: $data, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationModelImpl &&
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
  _$$ApplicationModelImplCopyWith<_$ApplicationModelImpl> get copyWith =>
      __$$ApplicationModelImplCopyWithImpl<_$ApplicationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationModelImplToJson(
      this,
    );
  }
}

abstract class _ApplicationModel extends ApplicationModel {
  factory _ApplicationModel(
      {required final String message,
      final String? data,
      final ApplicationModelType? type}) = _$ApplicationModelImpl;
  _ApplicationModel._() : super._();

  factory _ApplicationModel.fromJson(Map<String, dynamic> json) =
      _$ApplicationModelImpl.fromJson;

  @override
  String get message;
  @override
  String? get data;
  @override
  ApplicationModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationModelImplCopyWith<_$ApplicationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApplicationModelError _$ApplicationModelErrorFromJson(
    Map<String, dynamic> json) {
  return _ApplicationModelError.fromJson(json);
}

/// @nodoc
mixin _$ApplicationModelError {
  String get message => throw _privateConstructorUsedError;
  ApplicationModelType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationModelErrorCopyWith<ApplicationModelError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationModelErrorCopyWith<$Res> {
  factory $ApplicationModelErrorCopyWith(ApplicationModelError value,
          $Res Function(ApplicationModelError) then) =
      _$ApplicationModelErrorCopyWithImpl<$Res, ApplicationModelError>;
  @useResult
  $Res call({String message, ApplicationModelType? type});
}

/// @nodoc
class _$ApplicationModelErrorCopyWithImpl<$Res,
        $Val extends ApplicationModelError>
    implements $ApplicationModelErrorCopyWith<$Res> {
  _$ApplicationModelErrorCopyWithImpl(this._value, this._then);

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
              as ApplicationModelType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationModelErrorImplCopyWith<$Res>
    implements $ApplicationModelErrorCopyWith<$Res> {
  factory _$$ApplicationModelErrorImplCopyWith(
          _$ApplicationModelErrorImpl value,
          $Res Function(_$ApplicationModelErrorImpl) then) =
      __$$ApplicationModelErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, ApplicationModelType? type});
}

/// @nodoc
class __$$ApplicationModelErrorImplCopyWithImpl<$Res>
    extends _$ApplicationModelErrorCopyWithImpl<$Res,
        _$ApplicationModelErrorImpl>
    implements _$$ApplicationModelErrorImplCopyWith<$Res> {
  __$$ApplicationModelErrorImplCopyWithImpl(_$ApplicationModelErrorImpl _value,
      $Res Function(_$ApplicationModelErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = freezed,
  }) {
    return _then(_$ApplicationModelErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ApplicationModelType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationModelErrorImpl extends _ApplicationModelError {
  _$ApplicationModelErrorImpl({required this.message, this.type}) : super._();

  factory _$ApplicationModelErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationModelErrorImplFromJson(json);

  @override
  final String message;
  @override
  final ApplicationModelType? type;

  @override
  String toString() {
    return 'ApplicationModelError(message: $message, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationModelErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationModelErrorImplCopyWith<_$ApplicationModelErrorImpl>
      get copyWith => __$$ApplicationModelErrorImplCopyWithImpl<
          _$ApplicationModelErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationModelErrorImplToJson(
      this,
    );
  }
}

abstract class _ApplicationModelError extends ApplicationModelError {
  factory _ApplicationModelError(
      {required final String message,
      final ApplicationModelType? type}) = _$ApplicationModelErrorImpl;
  _ApplicationModelError._() : super._();

  factory _ApplicationModelError.fromJson(Map<String, dynamic> json) =
      _$ApplicationModelErrorImpl.fromJson;

  @override
  String get message;
  @override
  ApplicationModelType? get type;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationModelErrorImplCopyWith<_$ApplicationModelErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
