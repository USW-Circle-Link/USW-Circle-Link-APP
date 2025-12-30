import 'package:flutter/material.dart';

/// Popover의 상태를 관리하는 컨트롤러
///
/// show(), hide(), toggle() 메서드를 통해 Popover의 표시 상태를 제어합니다.
///
/// 사용 예시:
/// ```dart
/// final controller = PopoverController();
///
/// // 표시
/// controller.show();
///
/// // 숨기기
/// controller.hide();
///
/// // 토글
/// controller.toggle();
///
/// // 상태 확인
/// if (controller.isShown) {
///   print('Popover is visible');
/// }
///
/// // 리스너 등록
/// controller.addListener(() {
///   print('Popover state changed: ${controller.isShown}');
/// });
/// ```
class PopoverController extends ChangeNotifier {
  bool _isShown = false;

  /// 현재 Popover가 표시되고 있는지 여부
  bool get isShown => _isShown;

  /// Popover를 표시합니다.
  void show() {
    if (!_isShown) {
      _isShown = true;
      notifyListeners();
    }
  }

  /// Popover를 숨깁니다.
  void hide() {
    if (_isShown) {
      _isShown = false;
      notifyListeners();
    }
  }

  /// Popover의 표시 상태를 토글합니다.
  void toggle() {
    _isShown = !_isShown;
    notifyListeners();
  }
}
