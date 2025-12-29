import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/user_view_model.dart';

final authProvider = ChangeNotifierProvider((ref) => AuthNotifier(ref: ref));

class AuthNotifier extends ChangeNotifier {
  final Ref ref;
  AuthNotifier({
    required this.ref,
  }) {
    ref.listen(userViewModelProvider, (previous, next) {
      // userViewModel에서 변경 사항이 생겼을 때만
      // authProvider에서 이를 감지
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  void logout() {
    ref.read(userViewModelProvider.notifier).logout.execute();
  }

  /// 앱을 처음 시작했을 때 토큰이 존재하는 지를 확인하고,
  /// [LoginScreen] 또는 [MainScreen]으로 이동한다.
  ///
  /// - Token이 존재: [MainScreen]
  /// - Token이 존재하지 않음: [LoginScreen]
  String? redirectLogic(BuildContext _, GoRouterState goState) {
    final user = ref.read(userViewModelProvider).state;

    final logginIn = goState.fullPath == '/login';

    // 유저 정보가 없는데 로그인 중이면 그대로 로그인 페이지에 둔다
    // 만약에 로그인이 아니라면, 로그인 페이지로 이동시킨다
    if (user.isAuthorized == false) {
      return logginIn ? null : '/login';
    }

    return null;
  }
}
