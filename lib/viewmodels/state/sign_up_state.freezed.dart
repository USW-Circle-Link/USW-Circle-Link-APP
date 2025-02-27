// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get idVerified => throw _privateConstructorUsedError;
  bool get signUpSuccess => throw _privateConstructorUsedError;
  Map<String, dynamic> get signUpForm => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  FieldType? get errorField => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool idVerified,
      bool signUpSuccess,
      Map<String, dynamic> signUpForm,
      String? error,
      FieldType? errorField});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? idVerified = null,
    Object? signUpSuccess = null,
    Object? signUpForm = null,
    Object? error = freezed,
    Object? errorField = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      idVerified: null == idVerified
          ? _value.idVerified
          : idVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      signUpSuccess: null == signUpSuccess
          ? _value.signUpSuccess
          : signUpSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      signUpForm: null == signUpForm
          ? _value.signUpForm
          : signUpForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      errorField: freezed == errorField
          ? _value.errorField
          : errorField // ignore: cast_nullable_to_non_nullable
              as FieldType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpStateImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpStateImplCopyWith(
          _$SignUpStateImpl value, $Res Function(_$SignUpStateImpl) then) =
      __$$SignUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool idVerified,
      bool signUpSuccess,
      Map<String, dynamic> signUpForm,
      String? error,
      FieldType? errorField});
}

/// @nodoc
class __$$SignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateImpl>
    implements _$$SignUpStateImplCopyWith<$Res> {
  __$$SignUpStateImplCopyWithImpl(
      _$SignUpStateImpl _value, $Res Function(_$SignUpStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? idVerified = null,
    Object? signUpSuccess = null,
    Object? signUpForm = null,
    Object? error = freezed,
    Object? errorField = freezed,
  }) {
    return _then(_$SignUpStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      idVerified: null == idVerified
          ? _value.idVerified
          : idVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      signUpSuccess: null == signUpSuccess
          ? _value.signUpSuccess
          : signUpSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      signUpForm: null == signUpForm
          ? _value._signUpForm
          : signUpForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      errorField: freezed == errorField
          ? _value.errorField
          : errorField // ignore: cast_nullable_to_non_nullable
              as FieldType?,
    ));
  }
}

/// @nodoc

class _$SignUpStateImpl implements _SignUpState {
  _$SignUpStateImpl(
      {this.isLoading = false,
      this.idVerified = false,
      this.signUpSuccess = false,
      final Map<String, dynamic> signUpForm = const {},
      this.error,
      this.errorField})
      : _signUpForm = signUpForm;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool idVerified;
  @override
  @JsonKey()
  final bool signUpSuccess;
  final Map<String, dynamic> _signUpForm;
  @override
  @JsonKey()
  Map<String, dynamic> get signUpForm {
    if (_signUpForm is EqualUnmodifiableMapView) return _signUpForm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_signUpForm);
  }

  @override
  final String? error;
  @override
  final FieldType? errorField;

  @override
  String toString() {
    return 'SignUpState(isLoading: $isLoading, idVerified: $idVerified, signUpSuccess: $signUpSuccess, signUpForm: $signUpForm, error: $error, errorField: $errorField)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.idVerified, idVerified) ||
                other.idVerified == idVerified) &&
            (identical(other.signUpSuccess, signUpSuccess) ||
                other.signUpSuccess == signUpSuccess) &&
            const DeepCollectionEquality()
                .equals(other._signUpForm, _signUpForm) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorField, errorField) ||
                other.errorField == errorField));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      idVerified,
      signUpSuccess,
      const DeepCollectionEquality().hash(_signUpForm),
      error,
      errorField);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      __$$SignUpStateImplCopyWithImpl<_$SignUpStateImpl>(this, _$identity);
}

abstract class _SignUpState implements SignUpState {
  factory _SignUpState(
      {final bool isLoading,
      final bool idVerified,
      final bool signUpSuccess,
      final Map<String, dynamic> signUpForm,
      final String? error,
      final FieldType? errorField}) = _$SignUpStateImpl;

  @override
  bool get isLoading;
  @override
  bool get idVerified;
  @override
  bool get signUpSuccess;
  @override
  Map<String, dynamic> get signUpForm;
  @override
  String? get error;
  @override
  FieldType? get errorField;
  @override
  @JsonKey(ignore: true)
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
