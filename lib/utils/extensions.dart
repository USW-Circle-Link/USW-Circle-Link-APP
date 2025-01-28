import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension URLExt on String {
  bool get isValidUrl {
    if (isEmpty) return false;
    return Uri.tryParse(this) != null;
  }
}

extension ContextExt on BuildContext {
  void goRelative(
    String location, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) {
    assert(
      !location.startsWith('/'),
      "Relative locations must not start with a '/'.",
    );

    final state = GoRouterState.of(this);
    final currentUrl = state.uri;
    String newPath = '${currentUrl.path}/$location';
    for (final entry in params.entries) {
      newPath.replaceAll(':${entry.key}', entry.value);
    }
    final newUrl = currentUrl.replace(path: newPath, queryParameters: {
      ...currentUrl.queryParameters,
      ...queryParams,
    });

    go(newUrl.toString(), extra: extra);
  }
}

extension AddDashToPhoneNumber on String {
  String addDash() {
    if (length != 11) {
      throw FormatException("전화번호가 11자리가 아닙니다.");
    }
    return '${substring(0, 3)}-${substring(3, 7)}-${substring(7)}';
  }

  String? addDashOrNull() {
    if (length != 11) {
      return null;
    }
    return '${substring(0, 3)}-${substring(3, 7)}-${substring(7)}';
  }
}
