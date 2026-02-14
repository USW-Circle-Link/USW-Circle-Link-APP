// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'circle_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CircleState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool? get canApply => throw _privateConstructorUsedError;
  CircleDetailModel? get circleDetail => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CircleStateCopyWith<CircleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleStateCopyWith<$Res> {
  factory $CircleStateCopyWith(
          CircleState value, $Res Function(CircleState) then) =
      _$CircleStateCopyWithImpl<$Res, CircleState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool? canApply,
      CircleDetailModel? circleDetail,
      String? error});

  $CircleDetailModelCopyWith<$Res>? get circleDetail;
}

/// @nodoc
class _$CircleStateCopyWithImpl<$Res, $Val extends CircleState>
    implements $CircleStateCopyWith<$Res> {
  _$CircleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? canApply = freezed,
    Object? circleDetail = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      canApply: freezed == canApply
          ? _value.canApply
          : canApply // ignore: cast_nullable_to_non_nullable
              as bool?,
      circleDetail: freezed == circleDetail
          ? _value.circleDetail
          : circleDetail // ignore: cast_nullable_to_non_nullable
              as CircleDetailModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CircleDetailModelCopyWith<$Res>? get circleDetail {
    if (_value.circleDetail == null) {
      return null;
    }

    return $CircleDetailModelCopyWith<$Res>(_value.circleDetail!, (value) {
      return _then(_value.copyWith(circleDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CircleStateImplCopyWith<$Res>
    implements $CircleStateCopyWith<$Res> {
  factory _$$CircleStateImplCopyWith(
          _$CircleStateImpl value, $Res Function(_$CircleStateImpl) then) =
      __$$CircleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool? canApply,
      CircleDetailModel? circleDetail,
      String? error});

  @override
  $CircleDetailModelCopyWith<$Res>? get circleDetail;
}

/// @nodoc
class __$$CircleStateImplCopyWithImpl<$Res>
    extends _$CircleStateCopyWithImpl<$Res, _$CircleStateImpl>
    implements _$$CircleStateImplCopyWith<$Res> {
  __$$CircleStateImplCopyWithImpl(
      _$CircleStateImpl _value, $Res Function(_$CircleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? canApply = freezed,
    Object? circleDetail = freezed,
    Object? error = freezed,
  }) {
    return _then(_$CircleStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      canApply: freezed == canApply
          ? _value.canApply
          : canApply // ignore: cast_nullable_to_non_nullable
              as bool?,
      circleDetail: freezed == circleDetail
          ? _value.circleDetail
          : circleDetail // ignore: cast_nullable_to_non_nullable
              as CircleDetailModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CircleStateImpl implements _CircleState {
  _$CircleStateImpl(
      {this.isLoading = false,
      this.canApply,
      this.circleDetail = null,
      this.error});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final bool? canApply;
  @override
  @JsonKey()
  final CircleDetailModel? circleDetail;
  @override
  final String? error;

  @override
  String toString() {
    return 'CircleState(isLoading: $isLoading, canApply: $canApply, circleDetail: $circleDetail, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircleStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.canApply, canApply) ||
                other.canApply == canApply) &&
            (identical(other.circleDetail, circleDetail) ||
                other.circleDetail == circleDetail) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, canApply, circleDetail, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CircleStateImplCopyWith<_$CircleStateImpl> get copyWith =>
      __$$CircleStateImplCopyWithImpl<_$CircleStateImpl>(this, _$identity);
}

abstract class _CircleState implements CircleState {
  factory _CircleState(
      {final bool isLoading,
      final bool? canApply,
      final CircleDetailModel? circleDetail,
      final String? error}) = _$CircleStateImpl;

  @override
  bool get isLoading;
  @override
  bool? get canApply;
  @override
  CircleDetailModel? get circleDetail;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$CircleStateImplCopyWith<_$CircleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
