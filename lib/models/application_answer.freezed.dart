// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApplicationAnswer _$ApplicationAnswerFromJson(Map<String, dynamic> json) {
  return _ApplicationAnswer.fromJson(json);
}

/// @nodoc
mixin _$ApplicationAnswer {
  int get questionId => throw _privateConstructorUsedError;
  int? get optionId => throw _privateConstructorUsedError;
  String? get answerText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationAnswerCopyWith<ApplicationAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationAnswerCopyWith<$Res> {
  factory $ApplicationAnswerCopyWith(
          ApplicationAnswer value, $Res Function(ApplicationAnswer) then) =
      _$ApplicationAnswerCopyWithImpl<$Res, ApplicationAnswer>;
  @useResult
  $Res call({int questionId, int? optionId, String? answerText});
}

/// @nodoc
class _$ApplicationAnswerCopyWithImpl<$Res, $Val extends ApplicationAnswer>
    implements $ApplicationAnswerCopyWith<$Res> {
  _$ApplicationAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? optionId = freezed,
    Object? answerText = freezed,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      optionId: freezed == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as int?,
      answerText: freezed == answerText
          ? _value.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationAnswerImplCopyWith<$Res>
    implements $ApplicationAnswerCopyWith<$Res> {
  factory _$$ApplicationAnswerImplCopyWith(_$ApplicationAnswerImpl value,
          $Res Function(_$ApplicationAnswerImpl) then) =
      __$$ApplicationAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int questionId, int? optionId, String? answerText});
}

/// @nodoc
class __$$ApplicationAnswerImplCopyWithImpl<$Res>
    extends _$ApplicationAnswerCopyWithImpl<$Res, _$ApplicationAnswerImpl>
    implements _$$ApplicationAnswerImplCopyWith<$Res> {
  __$$ApplicationAnswerImplCopyWithImpl(_$ApplicationAnswerImpl _value,
      $Res Function(_$ApplicationAnswerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? optionId = freezed,
    Object? answerText = freezed,
  }) {
    return _then(_$ApplicationAnswerImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      optionId: freezed == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as int?,
      answerText: freezed == answerText
          ? _value.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationAnswerImpl implements _ApplicationAnswer {
  _$ApplicationAnswerImpl(
      {required this.questionId, this.optionId, this.answerText});

  factory _$ApplicationAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationAnswerImplFromJson(json);

  @override
  final int questionId;
  @override
  final int? optionId;
  @override
  final String? answerText;

  @override
  String toString() {
    return 'ApplicationAnswer(questionId: $questionId, optionId: $optionId, answerText: $answerText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationAnswerImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId) &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, questionId, optionId, answerText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationAnswerImplCopyWith<_$ApplicationAnswerImpl> get copyWith =>
      __$$ApplicationAnswerImplCopyWithImpl<_$ApplicationAnswerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationAnswerImplToJson(
      this,
    );
  }
}

abstract class _ApplicationAnswer implements ApplicationAnswer {
  factory _ApplicationAnswer(
      {required final int questionId,
      final int? optionId,
      final String? answerText}) = _$ApplicationAnswerImpl;

  factory _ApplicationAnswer.fromJson(Map<String, dynamic> json) =
      _$ApplicationAnswerImpl.fromJson;

  @override
  int get questionId;
  @override
  int? get optionId;
  @override
  String? get answerText;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationAnswerImplCopyWith<_$ApplicationAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
