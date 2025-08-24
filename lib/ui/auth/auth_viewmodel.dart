import '../../data/repositories/auth/auth_repository.dart';
import '../../utils/command.dart';
import '../../utils/result.dart';

class LogoutViewModel {
  LogoutViewModel({
    required AuthRepository authRepository,
  }) : _authLogoutRepository = authRepository {
    logout = Command0(_logout);
  }
  final AuthRepository _authLogoutRepository;
  late Command0 logout;

  Future<Result> _logout() async {
    final result = await _authLogoutRepository.logout();
    switch (result) {
      case Ok<void>():
        return Result.ok(null);
      case Error<void>():
        return result;
    }
  }
}