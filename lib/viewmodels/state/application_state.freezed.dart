// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApplicationState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get applicationUrl => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get applySuccess => throw _privateConstructorUsedError;
  ApplicationSet? get applicationSet => throw _privateConstructorUsedError;
  Map<int, ApplicationAnswer> get answers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicationStateCopyWith<ApplicationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationStateCopyWith<$Res> {
  factory $ApplicationStateCopyWith(
          ApplicationState value, $Res Function(ApplicationState) then) =
      _$ApplicationStateCopyWithImpl<$Res, ApplicationState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? applicationUrl,
      String? error,
      bool applySuccess,
      ApplicationSet? applicationSet,
      Map<int, ApplicationAnswer> answers});

  $ApplicationSetCopyWith<$Res>? get applicationSet;
}

/// @nodoc
class _$ApplicationStateCopyWithImpl<$Res, $Val extends ApplicationState>
    implements $ApplicationStateCopyWith<$Res> {
  _$ApplicationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? applicationUrl = freezed,
    Object? error = freezed,
    Object? applySuccess = null,
    Object? applicationSet = freezed,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      applicationUrl: freezed == applicationUrl
          ? _value.applicationUrl
          : applicationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      applySuccess: null == applySuccess
          ? _value.applySuccess
          : applySuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      applicationSet: freezed == applicationSet
          ? _value.applicationSet
          : applicationSet // ignore: cast_nullable_to_non_nullable
              as ApplicationSet?,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<int, ApplicationAnswer>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApplicationSetCopyWith<$Res>? get applicationSet {
    if (_value.applicationSet == null) {
      return null;
    }

    return $ApplicationSetCopyWith<$Res>(_value.applicationSet!, (value) {
      return _then(_value.copyWith(applicationSet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApplicationStateImplCopyWith<$Res>
    implements $ApplicationStateCopyWith<$Res> {
  factory _$$ApplicationStateImplCopyWith(_$ApplicationStateImpl value,
          $Res Function(_$ApplicationStateImpl) then) =
      __$$ApplicationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? applicationUrl,
      String? error,
      bool applySuccess,
      ApplicationSet? applicationSet,
      Map<int, ApplicationAnswer> answers});

  @override
  $ApplicationSetCopyWith<$Res>? get applicationSet;
}

/// @nodoc
class __$$ApplicationStateImplCopyWithImpl<$Res>
    extends _$ApplicationStateCopyWithImpl<$Res, _$ApplicationStateImpl>
    implements _$$ApplicationStateImplCopyWith<$Res> {
  __$$ApplicationStateImplCopyWithImpl(_$ApplicationStateImpl _value,
      $Res Function(_$ApplicationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? applicationUrl = freezed,
    Object? error = freezed,
    Object? applySuccess = null,
    Object? applicationSet = freezed,
    Object? answers = null,
  }) {
    return _then(_$ApplicationStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      applicationUrl: freezed == applicationUrl
          ? _value.applicationUrl
          : applicationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      applySuccess: null == applySuccess
          ? _value.applySuccess
          : applySuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      applicationSet: freezed == applicationSet
          ? _value.applicationSet
          : applicationSet // ignore: cast_nullable_to_non_nullable
              as ApplicationSet?,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<int, ApplicationAnswer>,
    ));
  }
}

/// @nodoc

class _$ApplicationStateImpl implements _ApplicationState {
  _$ApplicationStateImpl(
      {this.isLoading = false,
      this.applicationUrl,
      this.error,
      this.applySuccess = false,
      this.applicationSet,
      final Map<int, ApplicationAnswer> answers = const {}})
      : _answers = answers;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? applicationUrl;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool applySuccess;
  @override
  final ApplicationSet? applicationSet;
  final Map<int, ApplicationAnswer> _answers;
  @override
  @JsonKey()
  Map<int, ApplicationAnswer> get answers {
    if (_answers is EqualUnmodifiableMapView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answers);
  }

  @override
  String toString() {
    return 'ApplicationState(isLoading: $isLoading, applicationUrl: $applicationUrl, error: $error, applySuccess: $applySuccess, applicationSet: $applicationSet, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.applicationUrl, applicationUrl) ||
                other.applicationUrl == applicationUrl) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.applySuccess, applySuccess) ||
                other.applySuccess == applySuccess) &&
            (identical(other.applicationSet, applicationSet) ||
                other.applicationSet == applicationSet) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      applicationUrl,
      error,
      applySuccess,
      applicationSet,
      const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationStateImplCopyWith<_$ApplicationStateImpl> get copyWith =>
      __$$ApplicationStateImplCopyWithImpl<_$ApplicationStateImpl>(
          this, _$identity);
}

abstract class _ApplicationState implements ApplicationState {
  factory _ApplicationState(
      {final bool isLoading,
      final String? applicationUrl,
      final String? error,
      final bool applySuccess,
      final ApplicationSet? applicationSet,
      final Map<int, ApplicationAnswer> answers}) = _$ApplicationStateImpl;

  @override
  bool get isLoading;
  @override
  String? get applicationUrl;
  @override
  String? get error;
  @override
  bool get applySuccess;
  @override
  ApplicationSet? get applicationSet;
  @override
  Map<int, ApplicationAnswer> get answers;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationStateImplCopyWith<_$ApplicationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
