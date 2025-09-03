import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final abnormalAccessNotifierProvider =
    ChangeNotifierProvider<AbnormalAccessNotifier>((ref) {
  return AbnormalAccessNotifier();
});

class AbnormalAccessNotifier extends ChangeNotifier {
  AbnormalAccessNotifier();

  void notify() {
    notifyListeners();
  }
}
