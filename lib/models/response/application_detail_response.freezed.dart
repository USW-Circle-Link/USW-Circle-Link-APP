// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApplicationDetailResponse {
  String get message => throw _privateConstructorUsedError;
  List<ApplicationQuestionAnswer> get data =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicationDetailResponseCopyWith<ApplicationDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationDetailResponseCopyWith<$Res> {
  factory $ApplicationDetailResponseCopyWith(ApplicationDetailResponse value,
          $Res Function(ApplicationDetailResponse) then) =
      _$ApplicationDetailResponseCopyWithImpl<$Res, ApplicationDetailResponse>;
  @useResult
  $Res call({String message, List<ApplicationQuestionAnswer> data});
}

/// @nodoc
class _$ApplicationDetailResponseCopyWithImpl<$Res,
        $Val extends ApplicationDetailResponse>
    implements $ApplicationDetailResponseCopyWith<$Res> {
  _$ApplicationDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ApplicationQuestionAnswer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationDetailResponseImplCopyWith<$Res>
    implements $ApplicationDetailResponseCopyWith<$Res> {
  factory _$$ApplicationDetailResponseImplCopyWith(
          _$ApplicationDetailResponseImpl value,
          $Res Function(_$ApplicationDetailResponseImpl) then) =
      __$$ApplicationDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<ApplicationQuestionAnswer> data});
}

/// @nodoc
class __$$ApplicationDetailResponseImplCopyWithImpl<$Res>
    extends _$ApplicationDetailResponseCopyWithImpl<$Res,
        _$ApplicationDetailResponseImpl>
    implements _$$ApplicationDetailResponseImplCopyWith<$Res> {
  __$$ApplicationDetailResponseImplCopyWithImpl(
      _$ApplicationDetailResponseImpl _value,
      $Res Function(_$ApplicationDetailResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$ApplicationDetailResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ApplicationQuestionAnswer>,
    ));
  }
}

/// @nodoc

class _$ApplicationDetailResponseImpl extends _ApplicationDetailResponse {
  _$ApplicationDetailResponseImpl(
      {required this.message,
      required final List<ApplicationQuestionAnswer> data})
      : _data = data,
        super._();

  @override
  final String message;
  final List<ApplicationQuestionAnswer> _data;
  @override
  List<ApplicationQuestionAnswer> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ApplicationDetailResponse(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationDetailResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationDetailResponseImplCopyWith<_$ApplicationDetailResponseImpl>
      get copyWith => __$$ApplicationDetailResponseImplCopyWithImpl<
          _$ApplicationDetailResponseImpl>(this, _$identity);
}

abstract class _ApplicationDetailResponse extends ApplicationDetailResponse {
  factory _ApplicationDetailResponse(
          {required final String message,
          required final List<ApplicationQuestionAnswer> data}) =
      _$ApplicationDetailResponseImpl;
  _ApplicationDetailResponse._() : super._();

  @override
  String get message;
  @override
  List<ApplicationQuestionAnswer> get data;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationDetailResponseImplCopyWith<_$ApplicationDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApplicationQuestionAnswer _$ApplicationQuestionAnswerFromJson(
    Map<String, dynamic> json) {
  return _ApplicationQuestionAnswer.fromJson(json);
}

/// @nodoc
mixin _$ApplicationQuestionAnswer {
  String get question => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;
  int? get optionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationQuestionAnswerCopyWith<ApplicationQuestionAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationQuestionAnswerCopyWith<$Res> {
  factory $ApplicationQuestionAnswerCopyWith(ApplicationQuestionAnswer value,
          $Res Function(ApplicationQuestionAnswer) then) =
      _$ApplicationQuestionAnswerCopyWithImpl<$Res, ApplicationQuestionAnswer>;
  @useResult
  $Res call({String question, String? answer, int? optionId});
}

/// @nodoc
class _$ApplicationQuestionAnswerCopyWithImpl<$Res,
        $Val extends ApplicationQuestionAnswer>
    implements $ApplicationQuestionAnswerCopyWith<$Res> {
  _$ApplicationQuestionAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = freezed,
    Object? optionId = freezed,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      optionId: freezed == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationQuestionAnswerImplCopyWith<$Res>
    implements $ApplicationQuestionAnswerCopyWith<$Res> {
  factory _$$ApplicationQuestionAnswerImplCopyWith(
          _$ApplicationQuestionAnswerImpl value,
          $Res Function(_$ApplicationQuestionAnswerImpl) then) =
      __$$ApplicationQuestionAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, String? answer, int? optionId});
}

/// @nodoc
class __$$ApplicationQuestionAnswerImplCopyWithImpl<$Res>
    extends _$ApplicationQuestionAnswerCopyWithImpl<$Res,
        _$ApplicationQuestionAnswerImpl>
    implements _$$ApplicationQuestionAnswerImplCopyWith<$Res> {
  __$$ApplicationQuestionAnswerImplCopyWithImpl(
      _$ApplicationQuestionAnswerImpl _value,
      $Res Function(_$ApplicationQuestionAnswerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = freezed,
    Object? optionId = freezed,
  }) {
    return _then(_$ApplicationQuestionAnswerImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
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
class _$ApplicationQuestionAnswerImpl implements _ApplicationQuestionAnswer {
  _$ApplicationQuestionAnswerImpl(
      {required this.question, this.answer, this.optionId});

  factory _$ApplicationQuestionAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationQuestionAnswerImplFromJson(json);

  @override
  final String question;
  @override
  final String? answer;
  @override
  final int? optionId;

  @override
  String toString() {
    return 'ApplicationQuestionAnswer(question: $question, answer: $answer, optionId: $optionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationQuestionAnswerImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, question, answer, optionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationQuestionAnswerImplCopyWith<_$ApplicationQuestionAnswerImpl>
      get copyWith => __$$ApplicationQuestionAnswerImplCopyWithImpl<
          _$ApplicationQuestionAnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationQuestionAnswerImplToJson(
      this,
    );
  }
}

abstract class _ApplicationQuestionAnswer implements ApplicationQuestionAnswer {
  factory _ApplicationQuestionAnswer(
      {required final String question,
      final String? answer,
      final int? optionId}) = _$ApplicationQuestionAnswerImpl;

  factory _ApplicationQuestionAnswer.fromJson(Map<String, dynamic> json) =
      _$ApplicationQuestionAnswerImpl.fromJson;

  @override
  String get question;
  @override
  String? get answer;
  @override
  int? get optionId;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationQuestionAnswerImplCopyWith<_$ApplicationQuestionAnswerImpl>
      get copyWith => throw _privateConstructorUsedError;
}
