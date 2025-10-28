// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool? get isDialogError => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventStateCopyWith<EventState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventStateCopyWith<$Res> {
  factory $EventStateCopyWith(
          EventState value, $Res Function(EventState) then) =
      _$EventStateCopyWithImpl<$Res, EventState>;
  @useResult
  $Res call(
      {bool isLoading, bool isSuccess, bool? isDialogError, String? error});
}

/// @nodoc
class _$EventStateCopyWithImpl<$Res, $Val extends EventState>
    implements $EventStateCopyWith<$Res> {
  _$EventStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isDialogError = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isDialogError: freezed == isDialogError
          ? _value.isDialogError
          : isDialogError // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventStateImplCopyWith<$Res>
    implements $EventStateCopyWith<$Res> {
  factory _$$EventStateImplCopyWith(
          _$EventStateImpl value, $Res Function(_$EventStateImpl) then) =
      __$$EventStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, bool isSuccess, bool? isDialogError, String? error});
}

/// @nodoc
class __$$EventStateImplCopyWithImpl<$Res>
    extends _$EventStateCopyWithImpl<$Res, _$EventStateImpl>
    implements _$$EventStateImplCopyWith<$Res> {
  __$$EventStateImplCopyWithImpl(
      _$EventStateImpl _value, $Res Function(_$EventStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isDialogError = freezed,
    Object? error = freezed,
  }) {
    return _then(_$EventStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isDialogError: freezed == isDialogError
          ? _value.isDialogError
          : isDialogError // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EventStateImpl implements _EventState {
  _$EventStateImpl(
      {this.isLoading = false,
      this.isSuccess = false,
      this.isDialogError = null,
      this.error});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool? isDialogError;
  @override
  final String? error;

  @override
  String toString() {
    return 'EventState(isLoading: $isLoading, isSuccess: $isSuccess, isDialogError: $isDialogError, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isDialogError, isDialogError) ||
                other.isDialogError == isDialogError) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isSuccess, isDialogError, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventStateImplCopyWith<_$EventStateImpl> get copyWith =>
      __$$EventStateImplCopyWithImpl<_$EventStateImpl>(this, _$identity);
}

abstract class _EventState implements EventState {
  factory _EventState(
      {final bool isLoading,
      final bool isSuccess,
      final bool? isDialogError,
      final String? error}) = _$EventStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool? get isDialogError;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$EventStateImplCopyWith<_$EventStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
