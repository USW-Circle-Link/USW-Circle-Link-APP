// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_pw_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChangePwModel _$ChangePwModelFromJson(Map<String, dynamic> json) {
  return _ChangePwModel.fromJson(json);
}

/// @nodoc
mixin _$ChangePwModel {
  String get message => throw _privateConstructorUsedError;
  ChangePwType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangePwModelCopyWith<ChangePwModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePwModelCopyWith<$Res> {
  factory $ChangePwModelCopyWith(
          ChangePwModel value, $Res Function(ChangePwModel) then) =
      _$ChangePwModelCopyWithImpl<$Res, ChangePwModel>;
  @useResult
  $Res call({String message, ChangePwType type});
}

/// @nodoc
class _$ChangePwModelCopyWithImpl<$Res, $Val extends ChangePwModel>
    implements $ChangePwModelCopyWith<$Res> {
  _$ChangePwModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChangePwType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePwModelImplCopyWith<$Res>
    implements $ChangePwModelCopyWith<$Res> {
  factory _$$ChangePwModelImplCopyWith(
          _$ChangePwModelImpl value, $Res Function(_$ChangePwModelImpl) then) =
      __$$ChangePwModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, ChangePwType type});
}

/// @nodoc
class __$$ChangePwModelImplCopyWithImpl<$Res>
    extends _$ChangePwModelCopyWithImpl<$Res, _$ChangePwModelImpl>
    implements _$$ChangePwModelImplCopyWith<$Res> {
  __$$ChangePwModelImplCopyWithImpl(
      _$ChangePwModelImpl _value, $Res Function(_$ChangePwModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
  }) {
    return _then(_$ChangePwModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChangePwType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePwModelImpl extends _ChangePwModel {
  const _$ChangePwModelImpl({required this.message, required this.type})
      : super._();

  factory _$ChangePwModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePwModelImplFromJson(json);

  @override
  final String message;
  @override
  final ChangePwType type;

  @override
  String toString() {
    return 'ChangePwModel(message: $message, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePwModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePwModelImplCopyWith<_$ChangePwModelImpl> get copyWith =>
      __$$ChangePwModelImplCopyWithImpl<_$ChangePwModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePwModelImplToJson(
      this,
    );
  }
}

abstract class _ChangePwModel extends ChangePwModel {
  const factory _ChangePwModel(
      {required final String message,
      required final ChangePwType type}) = _$ChangePwModelImpl;
  const _ChangePwModel._() : super._();

  factory _ChangePwModel.fromJson(Map<String, dynamic> json) =
      _$ChangePwModelImpl.fromJson;

  @override
  String get message;
  @override
  ChangePwType get type;
  @override
  @JsonKey(ignore: true)
  _$$ChangePwModelImplCopyWith<_$ChangePwModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
