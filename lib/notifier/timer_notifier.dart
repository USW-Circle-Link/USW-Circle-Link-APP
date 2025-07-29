import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerNotifier extends StateNotifier<int> {
  Timer? _timer;

  TimerNotifier() : super(0);

  void startTimer({int seconds = 300}) {
    cancel();
    state = seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state = state - 1;
      } else {
        cancel();
      }
    });
  }

  void cancel() {
    _timer?.cancel();
  }

  String get timerText {
    int minutes = state ~/ 60;
    int seconds = state % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    cancel();
    super.dispose();
  }
}

final timerProvider =
    StateNotifierProvider.autoDispose<TimerNotifier, int>((ref) {
  return TimerNotifier();
});
