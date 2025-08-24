import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usw_circle_link/models/response/circle_list_response.dart';

part 'circle_list_state.freezed.dart';

@freezed
class CircleListState with _$CircleListState {
  factory CircleListState({
    @Default(false) bool isLoading,
    @Default([]) List<Club> circleList,
    @Default([]) List<Club> selectedCircleList,
    String? error,
  }) = _CircleListState;
}
