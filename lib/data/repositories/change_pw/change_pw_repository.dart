import 'package:usw_circle_link/domain/models/change_pw/change_pw_model.dart';
import '../../services/change_pw/change_pw_service.dart';

class ChangePwRepository {
  final ChangePwService _service;
  ChangePwRepository(this._service);

  Future<ChangePwModel> changePassword({
    required String userPw,
    required String newPw,
    required String confirmNewPw,
  }) async {
    final body = {
      'userPw': userPw,
      'newPw': newPw,
      'confirmNewPw': confirmNewPw,
      'type': 'change',
    };
    final json = await _service.changePassword(body);
    final message = (json['message'] as String?) ?? '비밀번호가 변경되었습니다.';
    return ChangePwModel.changed(message: message);
  }

  Future<ChangePwModel> resetPassword({
    required String newPw,
    required String confirmNewPw,
    required String uuid,
  }) async {
    final body = {
      'newPw': newPw,
      'confirmNewPw': confirmNewPw,
      'uuid': uuid,
      'type': 'reset',
    };
    final json = await _service.resetPassword(body);
    final message = (json['message'] as String?) ?? '비밀번호가 재설정되었습니다.';
    return ChangePwModel.reset(message: message);
  }
}