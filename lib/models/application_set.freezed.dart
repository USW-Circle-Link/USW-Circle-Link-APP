// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApplicationSet _$ApplicationSetFromJson(Map<String, dynamic> json) {
  return _ApplicationSet.fromJson(json);
}

/// @nodoc
mixin _$ApplicationSet {
  String get clubId => throw _privateConstructorUsedError;
  String? get formId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<ApplicationQuestion> get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationSetCopyWith<ApplicationSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationSetCopyWith<$Res> {
  factory $ApplicationSetCopyWith(
          ApplicationSet value, $Res Function(ApplicationSet) then) =
      _$ApplicationSetCopyWithImpl<$Res, ApplicationSet>;
  @useResult
  $Res call(
      {String clubId,
      String? formId,
      String? title,
      String? description,
      List<ApplicationQuestion> questions});
}

/// @nodoc
class _$ApplicationSetCopyWithImpl<$Res, $Val extends ApplicationSet>
    implements $ApplicationSetCopyWith<$Res> {
  _$ApplicationSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubId = null,
    Object? formId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as String,
      formId: freezed == formId
          ? _value.formId
          : formId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<ApplicationQuestion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationSetImplCopyWith<$Res>
    implements $ApplicationSetCopyWith<$Res> {
  factory _$$ApplicationSetImplCopyWith(_$ApplicationSetImpl value,
          $Res Function(_$ApplicationSetImpl) then) =
      __$$ApplicationSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String clubId,
      String? formId,
      String? title,
      String? description,
      List<ApplicationQuestion> questions});
}

/// @nodoc
class __$$ApplicationSetImplCopyWithImpl<$Res>
    extends _$ApplicationSetCopyWithImpl<$Res, _$ApplicationSetImpl>
    implements _$$ApplicationSetImplCopyWith<$Res> {
  __$$ApplicationSetImplCopyWithImpl(
      _$ApplicationSetImpl _value, $Res Function(_$ApplicationSetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clubId = null,
    Object? formId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? questions = null,
  }) {
    return _then(_$ApplicationSetImpl(
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as String,
      formId: freezed == formId
          ? _value.formId
          : formId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<ApplicationQuestion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationSetImpl implements _ApplicationSet {
  _$ApplicationSetImpl(
      {required this.clubId,
      this.formId,
      this.title,
      this.description,
      required final List<ApplicationQuestion> questions})
      : _questions = questions;

  factory _$ApplicationSetImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationSetImplFromJson(json);

  @override
  final String clubId;
  @override
  final String? formId;
  @override
  final String? title;
  @override
  final String? description;
  final List<ApplicationQuestion> _questions;
  @override
  List<ApplicationQuestion> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'ApplicationSet(clubId: $clubId, formId: $formId, title: $title, description: $description, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationSetImpl &&
            (identical(other.clubId, clubId) || other.clubId == clubId) &&
            (identical(other.formId, formId) || other.formId == formId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, clubId, formId, title,
      description, const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationSetImplCopyWith<_$ApplicationSetImpl> get copyWith =>
      __$$ApplicationSetImplCopyWithImpl<_$ApplicationSetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationSetImplToJson(
      this,
    );
  }
}

abstract class _ApplicationSet implements ApplicationSet {
  factory _ApplicationSet(
          {required final String clubId,
          final String? formId,
          final String? title,
          final String? description,
          required final List<ApplicationQuestion> questions}) =
      _$ApplicationSetImpl;

  factory _ApplicationSet.fromJson(Map<String, dynamic> json) =
      _$ApplicationSetImpl.fromJson;

  @override
  String get clubId;
  @override
  String? get formId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  List<ApplicationQuestion> get questions;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationSetImplCopyWith<_$ApplicationSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApplicationQuestion _$ApplicationQuestionFromJson(Map<String, dynamic> json) {
  return _ApplicationQuestion.fromJson(json);
}

/// @nodoc
mixin _$ApplicationQuestion {
  int get questionId => throw _privateConstructorUsedError;
  int get sequence => throw _privateConstructorUsedError;
  QuestionType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String get questionText => throw _privateConstructorUsedError;
  bool get required => throw _privateConstructorUsedError;
  List<QuestionOption> get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationQuestionCopyWith<ApplicationQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationQuestionCopyWith<$Res> {
  factory $ApplicationQuestionCopyWith(
          ApplicationQuestion value, $Res Function(ApplicationQuestion) then) =
      _$ApplicationQuestionCopyWithImpl<$Res, ApplicationQuestion>;
  @useResult
  $Res call(
      {int questionId,
      int sequence,
      QuestionType type,
      @JsonKey(name: 'content') String questionText,
      bool required,
      List<QuestionOption> options});
}

/// @nodoc
class _$ApplicationQuestionCopyWithImpl<$Res, $Val extends ApplicationQuestion>
    implements $ApplicationQuestionCopyWith<$Res> {
  _$ApplicationQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? sequence = null,
    Object? type = null,
    Object? questionText = null,
    Object? required = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuestionType,
      questionText: null == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<QuestionOption>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationQuestionImplCopyWith<$Res>
    implements $ApplicationQuestionCopyWith<$Res> {
  factory _$$ApplicationQuestionImplCopyWith(_$ApplicationQuestionImpl value,
          $Res Function(_$ApplicationQuestionImpl) then) =
      __$$ApplicationQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int questionId,
      int sequence,
      QuestionType type,
      @JsonKey(name: 'content') String questionText,
      bool required,
      List<QuestionOption> options});
}

/// @nodoc
class __$$ApplicationQuestionImplCopyWithImpl<$Res>
    extends _$ApplicationQuestionCopyWithImpl<$Res, _$ApplicationQuestionImpl>
    implements _$$ApplicationQuestionImplCopyWith<$Res> {
  __$$ApplicationQuestionImplCopyWithImpl(_$ApplicationQuestionImpl _value,
      $Res Function(_$ApplicationQuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? sequence = null,
    Object? type = null,
    Object? questionText = null,
    Object? required = null,
    Object? options = null,
  }) {
    return _then(_$ApplicationQuestionImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuestionType,
      questionText: null == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<QuestionOption>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationQuestionImpl implements _ApplicationQuestion {
  _$ApplicationQuestionImpl(
      {required this.questionId,
      required this.sequence,
      required this.type,
      @JsonKey(name: 'content') required this.questionText,
      this.required = true,
      final List<QuestionOption> options = const []})
      : _options = options;

  factory _$ApplicationQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationQuestionImplFromJson(json);

  @override
  final int questionId;
  @override
  final int sequence;
  @override
  final QuestionType type;
  @override
  @JsonKey(name: 'content')
  final String questionText;
  @override
  @JsonKey()
  final bool required;
  final List<QuestionOption> _options;
  @override
  @JsonKey()
  List<QuestionOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'ApplicationQuestion(questionId: $questionId, sequence: $sequence, type: $type, questionText: $questionText, required: $required, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationQuestionImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.required, required) ||
                other.required == required) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, questionId, sequence, type,
      questionText, required, const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationQuestionImplCopyWith<_$ApplicationQuestionImpl> get copyWith =>
      __$$ApplicationQuestionImplCopyWithImpl<_$ApplicationQuestionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationQuestionImplToJson(
      this,
    );
  }
}

abstract class _ApplicationQuestion implements ApplicationQuestion {
  factory _ApplicationQuestion(
      {required final int questionId,
      required final int sequence,
      required final QuestionType type,
      @JsonKey(name: 'content') required final String questionText,
      final bool required,
      final List<QuestionOption> options}) = _$ApplicationQuestionImpl;

  factory _ApplicationQuestion.fromJson(Map<String, dynamic> json) =
      _$ApplicationQuestionImpl.fromJson;

  @override
  int get questionId;
  @override
  int get sequence;
  @override
  QuestionType get type;
  @override
  @JsonKey(name: 'content')
  String get questionText;
  @override
  bool get required;
  @override
  List<QuestionOption> get options;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationQuestionImplCopyWith<_$ApplicationQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionOption _$QuestionOptionFromJson(Map<String, dynamic> json) {
  return _QuestionOption.fromJson(json);
}

/// @nodoc
mixin _$QuestionOption {
  int? get sequence => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  int? get optionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionOptionCopyWith<QuestionOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionOptionCopyWith<$Res> {
  factory $QuestionOptionCopyWith(
          QuestionOption value, $Res Function(QuestionOption) then) =
      _$QuestionOptionCopyWithImpl<$Res, QuestionOption>;
  @useResult
  $Res call({int? sequence, String content, String? value, int? optionId});
}

/// @nodoc
class _$QuestionOptionCopyWithImpl<$Res, $Val extends QuestionOption>
    implements $QuestionOptionCopyWith<$Res> {
  _$QuestionOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sequence = freezed,
    Object? content = null,
    Object? value = freezed,
    Object? optionId = freezed,
  }) {
    return _then(_value.copyWith(
      sequence: freezed == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      optionId: freezed == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionOptionImplCopyWith<$Res>
    implements $QuestionOptionCopyWith<$Res> {
  factory _$$QuestionOptionImplCopyWith(_$QuestionOptionImpl value,
          $Res Function(_$QuestionOptionImpl) then) =
      __$$QuestionOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? sequence, String content, String? value, int? optionId});
}

/// @nodoc
class __$$QuestionOptionImplCopyWithImpl<$Res>
    extends _$QuestionOptionCopyWithImpl<$Res, _$QuestionOptionImpl>
    implements _$$QuestionOptionImplCopyWith<$Res> {
  __$$QuestionOptionImplCopyWithImpl(
      _$QuestionOptionImpl _value, $Res Function(_$QuestionOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sequence = freezed,
    Object? content = null,
    Object? value = freezed,
    Object? optionId = freezed,
  }) {
    return _then(_$QuestionOptionImpl(
      sequence: freezed == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      optionId: freezed == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionOptionImpl implements _QuestionOption {
  _$QuestionOptionImpl(
      {this.sequence, required this.content, this.value, this.optionId});

  factory _$QuestionOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionOptionImplFromJson(json);

  @override
  final int? sequence;
  @override
  final String content;
  @override
  final String? value;
  @override
  final int? optionId;

  @override
  String toString() {
    return 'QuestionOption(sequence: $sequence, content: $content, value: $value, optionId: $optionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionOptionImpl &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sequence, content, value, optionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionOptionImplCopyWith<_$QuestionOptionImpl> get copyWith =>
      __$$QuestionOptionImplCopyWithImpl<_$QuestionOptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionOptionImplToJson(
      this,
    );
  }
}

abstract class _QuestionOption implements QuestionOption {
  factory _QuestionOption(
      {final int? sequence,
      required final String content,
      final String? value,
      final int? optionId}) = _$QuestionOptionImpl;

  factory _QuestionOption.fromJson(Map<String, dynamic> json) =
      _$QuestionOptionImpl.fromJson;

  @override
  int? get sequence;
  @override
  String get content;
  @override
  String? get value;
  @override
  int? get optionId;
  @override
  @JsonKey(ignore: true)
  _$$QuestionOptionImplCopyWith<_$QuestionOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
