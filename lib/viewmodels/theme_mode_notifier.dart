import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 테마 모드 상태 관리 Provider
///
/// `ThemeMode.system`(기본값), `ThemeMode.light`, `ThemeMode.dark` 지원.
/// SharedPreferences에 저장되어 앱 재시작 시에도 유지됩니다.
///
/// 초기화 시 SharedPreferences에서 동기적으로 로드하여 깜빡임 방지.
final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  static const _key = 'theme_mode';

  /// 앱 시작 전에 로드된 초기 테마 모드.
  /// [loadInitialThemeMode]를 main()에서 호출하여 설정해야 합니다.
  static ThemeMode _initialMode = ThemeMode.system;

  /// main()에서 앱 시작 전에 호출하여 SharedPreferences에서 테마를 미리 로드.
  /// 이렇게 하면 Provider 생성 시 이미 올바른 값으로 시작하여 깜빡임이 없습니다.
  static Future<void> loadInitialThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_key);
    if (value != null) {
      _initialMode = _fromString(value);
    }
  }

  ThemeModeNotifier() : super(_initialMode);

  /// 다크 ↔ 라이트 직접 전환 (시스템 모드에서는 현재 밝기의 반대로)
  Future<void> toggle(Brightness currentBrightness) async {
    if (state == ThemeMode.dark ||
        (state == ThemeMode.system && currentBrightness == Brightness.dark)) {
      await setThemeMode(ThemeMode.light);
    } else {
      await setThemeMode(ThemeMode.dark);
    }
  }

  /// 테마 모드 변경 및 저장
  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, _toString(mode));
  }

  static ThemeMode _fromString(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static String _toString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }
}
