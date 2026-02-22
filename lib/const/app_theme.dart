import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 앱 전역 테마 정의
///
/// 라이트/다크 테마를 정의하며, 기존 accent 색상(0xFFFFB052)을 유지합니다.
class AppTheme {
  AppTheme._();

  // 공통 색상
  static const Color primaryColor = Color(0xFFFFB052);
  static const Color errorColor = Color(0xFFE53935);

  // ─── 라이트 테마 ───
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        dividerColor: const Color(0xFFE0E0E0),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          secondary: primaryColor,
          surface: Colors.white,
          error: errorColor,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Color(0xFF111111),
          onSurfaceVariant: Color(0xFFA1A1A1),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF111111),
          elevation: 0,
          scrolledUnderElevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF111111)),
          bodyMedium: TextStyle(color: Color(0xFF111111)),
          bodySmall: TextStyle(color: Color(0xFF707070)),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF111111)),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
        ),
        dialogTheme: const DialogThemeData(
          backgroundColor: Colors.white,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: Colors.white,
          selectedColor: primaryColor,
          labelStyle: const TextStyle(color: Color(0xFF434343)),
          side: const BorderSide(color: Color(0xFFE5E5E5)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        extensions: const [AppColors.light],
      );

  // ─── 다크 테마 ───
  // Material Design 3 기반 다크 테마 (눈에 편한 표준 색상)
  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
        dividerColor: const Color(0xFF2C2C2C),
        colorScheme: const ColorScheme.dark(
          primary: primaryColor,
          secondary: primaryColor,
          surface: Color(0xFF1E1E1E),
          error: errorColor,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Color(0xFFE1E1E1),
          onSurfaceVariant: Color(0xFF9E9E9E),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          foregroundColor: Color(0xFFE1E1E1),
          elevation: 0,
          scrolledUnderElevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF121212),
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFE1E1E1)),
          bodyMedium: TextStyle(color: Color(0xFFE1E1E1)),
          bodySmall: TextStyle(color: Color(0xFF9E9E9E)),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFE1E1E1)),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color(0xFF1E1E1E),
        ),
        dialogTheme: const DialogThemeData(
          backgroundColor: Color(0xFF1E1E1E),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: const Color(0xFF2C2C2C),
          selectedColor: primaryColor,
          labelStyle: const TextStyle(color: Color(0xFFE1E1E1)),
          side: const BorderSide(color: Color(0xFF3C3C3C)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        extensions: const [AppColors.dark],
      );
}

/// 기존 하드코딩 색상을 테마별로 매핑하는 Extension
///
/// 사용법: `Theme.of(context).extension<AppColors>()!.cardBackground`
@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color cardBackground;
  final Color subTextColor;
  final Color hintColor;
  final Color borderColor;
  final Color drawerBackground;
  final Color secondaryText;
  final Color disabledText;
  final Color disabledBackground;
  final Color badgeText;
  final Color inputBackground;
  final Color inputTextColor;
  final Color linkColor;
  final Color imagePlaceholder;
  final Color indicatorInactive;
  final Color shadowColor;
  final Color overlayBarrier;

  const AppColors({
    required this.cardBackground,
    required this.subTextColor,
    required this.hintColor,
    required this.borderColor,
    required this.drawerBackground,
    required this.secondaryText,
    required this.disabledText,
    required this.disabledBackground,
    required this.badgeText,
    required this.inputBackground,
    required this.inputTextColor,
    required this.linkColor,
    required this.imagePlaceholder,
    required this.indicatorInactive,
    required this.shadowColor,
    required this.overlayBarrier,
  });

  static const AppColors light = AppColors(
    cardBackground: Colors.white,
    subTextColor: Color(0xFF707070),
    hintColor: Color(0xFF989898),
    borderColor: Color(0xFFDBDBDB),
    drawerBackground: Color(0xFFF0F2F5),
    secondaryText: Color(0xFF353549),
    disabledText: Color(0xFFABABAB),
    disabledBackground: Color(0xFFEBEBEB),
    badgeText: Color(0xFF767676),
    inputBackground: Colors.white,
    inputTextColor: Color(0xFF111111),
    linkColor: Color(0xFF0085FF),
    imagePlaceholder: Color(0xFFBDBDBD),
    indicatorInactive: Color(0xFFD9D9D9),
    shadowColor: Color(0x1A000000),
    overlayBarrier: Color(0x8A000000),
  );

  static const AppColors dark = AppColors(
    cardBackground: Color(0xFF1E1E1E),
    subTextColor: Color(0xFF9E9E9E),
    hintColor: Color(0xFF757575),
    borderColor: Color(0xFF3C3C3C),
    drawerBackground: Color(0xFF1A1A1A),
    secondaryText: Color(0xFFBDBDBD),
    disabledText: Color(0xFF616161),
    disabledBackground: Color(0xFF2C2C2C),
    badgeText: Color(0xFF9E9E9E),
    inputBackground: Color(0xFF2C2C2C),
    inputTextColor: Color(0xFFE1E1E1),
    linkColor: Color(0xFF64B5F6),
    imagePlaceholder: Color(0xFF424242),
    indicatorInactive: Color(0xFF424242),
    shadowColor: Color(0x40000000),
    overlayBarrier: Color(0x8A000000),
  );

  @override
  AppColors copyWith({
    Color? cardBackground,
    Color? subTextColor,
    Color? hintColor,
    Color? borderColor,
    Color? drawerBackground,
    Color? secondaryText,
    Color? disabledText,
    Color? disabledBackground,
    Color? badgeText,
    Color? inputBackground,
    Color? inputTextColor,
    Color? linkColor,
    Color? imagePlaceholder,
    Color? indicatorInactive,
    Color? shadowColor,
    Color? overlayBarrier,
  }) {
    return AppColors(
      cardBackground: cardBackground ?? this.cardBackground,
      subTextColor: subTextColor ?? this.subTextColor,
      hintColor: hintColor ?? this.hintColor,
      borderColor: borderColor ?? this.borderColor,
      drawerBackground: drawerBackground ?? this.drawerBackground,
      secondaryText: secondaryText ?? this.secondaryText,
      disabledText: disabledText ?? this.disabledText,
      disabledBackground: disabledBackground ?? this.disabledBackground,
      badgeText: badgeText ?? this.badgeText,
      inputBackground: inputBackground ?? this.inputBackground,
      inputTextColor: inputTextColor ?? this.inputTextColor,
      linkColor: linkColor ?? this.linkColor,
      imagePlaceholder: imagePlaceholder ?? this.imagePlaceholder,
      indicatorInactive: indicatorInactive ?? this.indicatorInactive,
      shadowColor: shadowColor ?? this.shadowColor,
      overlayBarrier: overlayBarrier ?? this.overlayBarrier,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      subTextColor: Color.lerp(subTextColor, other.subTextColor, t)!,
      hintColor: Color.lerp(hintColor, other.hintColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      drawerBackground:
          Color.lerp(drawerBackground, other.drawerBackground, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      disabledText: Color.lerp(disabledText, other.disabledText, t)!,
      disabledBackground:
          Color.lerp(disabledBackground, other.disabledBackground, t)!,
      badgeText: Color.lerp(badgeText, other.badgeText, t)!,
      inputBackground:
          Color.lerp(inputBackground, other.inputBackground, t)!,
      inputTextColor: Color.lerp(inputTextColor, other.inputTextColor, t)!,
      linkColor: Color.lerp(linkColor, other.linkColor, t)!,
      imagePlaceholder:
          Color.lerp(imagePlaceholder, other.imagePlaceholder, t)!,
      indicatorInactive:
          Color.lerp(indicatorInactive, other.indicatorInactive, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      overlayBarrier: Color.lerp(overlayBarrier, other.overlayBarrier, t)!,
    );
  }
}
