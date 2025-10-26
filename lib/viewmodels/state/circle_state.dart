import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/circle_detail_model.dart';

part 'circle_state.freezed.dart';

@freezed
class CircleState with _$CircleState {
  factory CircleState({
    @Default(false) bool isLoading,
    bool? canApply,
    @Default(null) CircleDetailModel? circleDetail,
    String? error,
  }) = _CircleState;
}
