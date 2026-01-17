import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:usw_circle_link/models/application_answer.dart';
import 'package:usw_circle_link/models/application_set.dart';

part 'application_state.freezed.dart';

@freezed
class ApplicationState with _$ApplicationState {
  factory ApplicationState({
    @Default(false) bool isLoading,
    String? applicationUrl,
    String? error,
    @Default(false) bool applySuccess,
    ApplicationSet? applicationSet,
    @Default({}) Map<int, ApplicationAnswer> answers,
  }) = _ApplicationState;
}
