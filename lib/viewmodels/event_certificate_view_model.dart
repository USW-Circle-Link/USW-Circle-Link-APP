import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/response/global_exception.dart';
import '../repositories/event_repository.dart';
import '../utils/error_util.dart';
import '../utils/result.dart';
import 'state/event_state.dart';

final eventCertificateViewModelProvider =
    StateNotifierProvider.autoDispose<EventCertificateViewModel, EventState>(
  (ref) {
    final eventRepository = ref.read(eventRepositoryProvider);
    return EventCertificateViewModel(eventRepository);
  },
);

class EventCertificateViewModel extends StateNotifier<EventState> {
  EventCertificateViewModel(this.eventRepository) : super(EventState());
  final EventRepository eventRepository;

  Future<void> getStatus() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      isDialogError: null,
    );

    final result = await eventRepository.getStatus();
    switch (result) {
      case Ok():
        if (result.value) {
          // 이미 입장한 회원
          state = state.copyWith(
            isLoading: false,
            isDialogError: true,
            error: "이미 입장한 회원입니다.",
          );
        } else {
          // 중앙동아리 소속인데 인증 아직 안 한 사람
          state = state.copyWith(
            isLoading: false,
            isDialogError: false,
          );
        }
      case Error():
        var exception = result.error;
        if (exception is GlobalException) {
          state = state.copyWith(
            isLoading: false,
            isDialogError: true,
            error: ErrorUtil.instance.getErrorMessage(exception.code) ??
                exception.message,
          );
          return;
        }
        exception = exception.toGlobalException();
        ErrorUtil.instance.logError(exception, screen: 'EventCertificate');
        state = state.copyWith(
          isLoading: false,
          isDialogError: true,
          error: exception.message,
        );
    }
  }

  Future<void> verify(String code) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      isSuccess: false,
    );

    if (code.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        error:
            ErrorUtil.instance.getErrorMessage("EVT-101") ?? "인증코드가 올바르지 않습니다.",
      );
      return;
    }

    final result = await eventRepository.verify(code: code);
    switch (result) {
      case Ok():
        if (result.value) {
          state = state.copyWith(
            isLoading: false,
            isSuccess: true,
          );
        } else {
          state = state.copyWith(
            isLoading: false,
            isSuccess: false,
            error: "이미 입장한 회원입니다.",
          );
        }
      case Error():
        var exception = result.error;
        if (exception is GlobalException) {
          state = state.copyWith(
            isLoading: false,
            error: ErrorUtil.instance.getErrorMessage(exception.code) ??
                exception.message,
          );
          return;
        }
        exception = exception.toGlobalException();
        ErrorUtil.instance.logError(exception, screen: 'EventCertificate');
        state = state.copyWith(
          isLoading: false,
          error: exception.message,
        );
        return;
    }
  }
}
