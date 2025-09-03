// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'circle_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CircleListState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Club> get circleList => throw _privateConstructorUsedError;
  List<Club> get selectedCircleList => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CircleListStateCopyWith<CircleListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleListStateCopyWith<$Res> {
  factory $CircleListStateCopyWith(
          CircleListState value, $Res Function(CircleListState) then) =
      _$CircleListStateCopyWithImpl<$Res, CircleListState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Club> circleList,
      List<Club> selectedCircleList,
      String? error});
}

/// @nodoc
class _$CircleListStateCopyWithImpl<$Res, $Val extends CircleListState>
    implements $CircleListStateCopyWith<$Res> {
  _$CircleListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? circleList = null,
    Object? selectedCircleList = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      circleList: null == circleList
          ? _value.circleList
          : circleList // ignore: cast_nullable_to_non_nullable
              as List<Club>,
      selectedCircleList: null == selectedCircleList
          ? _value.selectedCircleList
          : selectedCircleList // ignore: cast_nullable_to_non_nullable
              as List<Club>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CircleListStateImplCopyWith<$Res>
    implements $CircleListStateCopyWith<$Res> {
  factory _$$CircleListStateImplCopyWith(_$CircleListStateImpl value,
          $Res Function(_$CircleListStateImpl) then) =
      __$$CircleListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Club> circleList,
      List<Club> selectedCircleList,
      String? error});
}

/// @nodoc
class __$$CircleListStateImplCopyWithImpl<$Res>
    extends _$CircleListStateCopyWithImpl<$Res, _$CircleListStateImpl>
    implements _$$CircleListStateImplCopyWith<$Res> {
  __$$CircleListStateImplCopyWithImpl(
      _$CircleListStateImpl _value, $Res Function(_$CircleListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? circleList = null,
    Object? selectedCircleList = null,
    Object? error = freezed,
  }) {
    return _then(_$CircleListStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      circleList: null == circleList
          ? _value._circleList
          : circleList // ignore: cast_nullable_to_non_nullable
              as List<Club>,
      selectedCircleList: null == selectedCircleList
          ? _value._selectedCircleList
          : selectedCircleList // ignore: cast_nullable_to_non_nullable
              as List<Club>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CircleListStateImpl implements _CircleListState {
  _$CircleListStateImpl(
      {this.isLoading = false,
      final List<Club> circleList = const [],
      final List<Club> selectedCircleList = const [],
      this.error})
      : _circleList = circleList,
        _selectedCircleList = selectedCircleList;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Club> _circleList;
  @override
  @JsonKey()
  List<Club> get circleList {
    if (_circleList is EqualUnmodifiableListView) return _circleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_circleList);
  }

  final List<Club> _selectedCircleList;
  @override
  @JsonKey()
  List<Club> get selectedCircleList {
    if (_selectedCircleList is EqualUnmodifiableListView)
      return _selectedCircleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCircleList);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'CircleListState(isLoading: $isLoading, circleList: $circleList, selectedCircleList: $selectedCircleList, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircleListStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._circleList, _circleList) &&
            const DeepCollectionEquality()
                .equals(other._selectedCircleList, _selectedCircleList) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_circleList),
      const DeepCollectionEquality().hash(_selectedCircleList),
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CircleListStateImplCopyWith<_$CircleListStateImpl> get copyWith =>
      __$$CircleListStateImplCopyWithImpl<_$CircleListStateImpl>(
          this, _$identity);
}

abstract class _CircleListState implements CircleListState {
  factory _CircleListState(
      {final bool isLoading,
      final List<Club> circleList,
      final List<Club> selectedCircleList,
      final String? error}) = _$CircleListStateImpl;

  @override
  bool get isLoading;
  @override
  List<Club> get circleList;
  @override
  List<Club> get selectedCircleList;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$CircleListStateImplCopyWith<_$CircleListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
