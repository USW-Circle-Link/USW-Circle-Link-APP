import 'package:logging/logging.dart';
import '../../../data/services/local/fcm_service.dart';
import '../../../data/repositories/auth/auth_repository.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

class LoginViewModel {
  LoginViewModel({
    required AuthRepository authRepository,
    required FCMService fcmService,
  })  : _authRepository = authRepository,
        _fcmService = fcmService {
    login = Command1<void, (String id, String password)>(_login);
  }

  final AuthRepository _authRepository;
  final FCMService _fcmService;
  final _log = Logger('LoginViewModel');

  late Command1 login;

  Future<Result<void>> _login((String, String) credentials) async {
    final (id, password) = credentials;
    final fcmToken = await _fcmService.getToken();
    if (fcmToken == null) {
      _log.warning('FCM token is null');
      return Result<void>.error(Exception('FCM token is null'));
    }
    final result = await _authRepository.login(
      id: id,
      password: password,
      fcmToken: fcmToken,
    );
    if (result is Error<void>) {
      _log.warning('Login failed! ${result.error}');
    }

    return result;
  }
}