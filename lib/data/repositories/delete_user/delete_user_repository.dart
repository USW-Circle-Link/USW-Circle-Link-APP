import 'package:usw_circle_link/data/services/delete_user/delete_user_service.dart';

class DeleteUserReposiory {
  final DeleteUserService _deleteUserService;
  DeleteUserReposiory(this._deleteUserService);

  Future<DeleteUserModel> deleteUser({
    required String code,
  }) async {
    final body = {
      "authCode": code,
    };
    final json = await _deleteUserService.deleteUser(body);
    final message = (json['message'] as String?) ?? '탈퇴가 완료되었습니다.';
    return DeleteUserModel.deleted(message: message);
  }
}