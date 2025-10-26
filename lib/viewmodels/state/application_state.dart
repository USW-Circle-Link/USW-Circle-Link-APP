import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_state.freezed.dart';

@freezed
class ApplicationState with _$ApplicationState {
  factory ApplicationState({
    @Default(false) bool isLoading,
    String? applicationUrl,
    String? error,
    @Default(false) bool applySuccess,
  }) = _ApplicationState;
}
