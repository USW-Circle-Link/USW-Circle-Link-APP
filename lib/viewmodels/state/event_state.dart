import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_state.freezed.dart';

@freezed
class EventState with _$EventState {
  factory EventState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(null) bool? isDialogError,
    String? error,
  }) = _EventState;
}
