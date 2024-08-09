// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ApplicationModel.dart';

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
  String get data => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

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
  $Res call({String data, String message});
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
    Object? data = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String data, String message});
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
    Object? data = null,
    Object? message = null,
  }) {
    return _then(_$ApplicationModelImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationModelImpl implements _ApplicationModel {
  _$ApplicationModelImpl({required this.data, required this.message});

  factory _$ApplicationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationModelImplFromJson(json);

  @override
  final String data;
  @override
  final String message;

  @override
  String toString() {
    return 'ApplicationModel(data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationModelImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, message);

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

abstract class _ApplicationModel implements ApplicationModel {
  factory _ApplicationModel(
      {required final String data,
      required final String message}) = _$ApplicationModelImpl;

  factory _ApplicationModel.fromJson(Map<String, dynamic> json) =
      _$ApplicationModelImpl.fromJson;

  @override
  String get data;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationModelImplCopyWith<_$ApplicationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApplicationModelComplete _$ApplicationModelCompleteFromJson(
    Map<String, dynamic> json) {
  return _ApplicationModelComplete.fromJson(json);
}

/// @nodoc
mixin _$ApplicationModelComplete {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationModelCompleteCopyWith<ApplicationModelComplete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationModelCompleteCopyWith<$Res> {
  factory $ApplicationModelCompleteCopyWith(ApplicationModelComplete value,
          $Res Function(ApplicationModelComplete) then) =
      _$ApplicationModelCompleteCopyWithImpl<$Res, ApplicationModelComplete>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ApplicationModelCompleteCopyWithImpl<$Res,
        $Val extends ApplicationModelComplete>
    implements $ApplicationModelCompleteCopyWith<$Res> {
  _$ApplicationModelCompleteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationModelCompleteImplCopyWith<$Res>
    implements $ApplicationModelCompleteCopyWith<$Res> {
  factory _$$ApplicationModelCompleteImplCopyWith(
          _$ApplicationModelCompleteImpl value,
          $Res Function(_$ApplicationModelCompleteImpl) then) =
      __$$ApplicationModelCompleteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ApplicationModelCompleteImplCopyWithImpl<$Res>
    extends _$ApplicationModelCompleteCopyWithImpl<$Res,
        _$ApplicationModelCompleteImpl>
    implements _$$ApplicationModelCompleteImplCopyWith<$Res> {
  __$$ApplicationModelCompleteImplCopyWithImpl(
      _$ApplicationModelCompleteImpl _value,
      $Res Function(_$ApplicationModelCompleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ApplicationModelCompleteImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationModelCompleteImpl implements _ApplicationModelComplete {
  _$ApplicationModelCompleteImpl({required this.message});

  factory _$ApplicationModelCompleteImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationModelCompleteImplFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'ApplicationModelComplete(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationModelCompleteImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationModelCompleteImplCopyWith<_$ApplicationModelCompleteImpl>
      get copyWith => __$$ApplicationModelCompleteImplCopyWithImpl<
          _$ApplicationModelCompleteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationModelCompleteImplToJson(
      this,
    );
  }
}

abstract class _ApplicationModelComplete implements ApplicationModelComplete {
  factory _ApplicationModelComplete({required final String message}) =
      _$ApplicationModelCompleteImpl;

  factory _ApplicationModelComplete.fromJson(Map<String, dynamic> json) =
      _$ApplicationModelCompleteImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationModelCompleteImplCopyWith<_$ApplicationModelCompleteImpl>
      get copyWith => throw _privateConstructorUsedError;
}
