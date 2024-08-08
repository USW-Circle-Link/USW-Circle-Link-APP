// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ChangePWModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChangePWModel _$ChangePWModelFromJson(Map<String, dynamic> json) {
  return _ChangePWModel.fromJson(json);
}

/// @nodoc
mixin _$ChangePWModel {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangePWModelCopyWith<ChangePWModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePWModelCopyWith<$Res> {
  factory $ChangePWModelCopyWith(
          ChangePWModel value, $Res Function(ChangePWModel) then) =
      _$ChangePWModelCopyWithImpl<$Res, ChangePWModel>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ChangePWModelCopyWithImpl<$Res, $Val extends ChangePWModel>
    implements $ChangePWModelCopyWith<$Res> {
  _$ChangePWModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ChangePWModelImplCopyWith<$Res>
    implements $ChangePWModelCopyWith<$Res> {
  factory _$$ChangePWModelImplCopyWith(
          _$ChangePWModelImpl value, $Res Function(_$ChangePWModelImpl) then) =
      __$$ChangePWModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ChangePWModelImplCopyWithImpl<$Res>
    extends _$ChangePWModelCopyWithImpl<$Res, _$ChangePWModelImpl>
    implements _$$ChangePWModelImplCopyWith<$Res> {
  __$$ChangePWModelImplCopyWithImpl(
      _$ChangePWModelImpl _value, $Res Function(_$ChangePWModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ChangePWModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePWModelImpl implements _ChangePWModel {
  _$ChangePWModelImpl({required this.message});

  factory _$ChangePWModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePWModelImplFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'ChangePWModel(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePWModelImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePWModelImplCopyWith<_$ChangePWModelImpl> get copyWith =>
      __$$ChangePWModelImplCopyWithImpl<_$ChangePWModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePWModelImplToJson(
      this,
    );
  }
}

abstract class _ChangePWModel implements ChangePWModel {
  factory _ChangePWModel({required final String message}) = _$ChangePWModelImpl;

  factory _ChangePWModel.fromJson(Map<String, dynamic> json) =
      _$ChangePWModelImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ChangePWModelImplCopyWith<_$ChangePWModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
