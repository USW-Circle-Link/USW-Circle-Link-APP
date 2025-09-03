abstract class ChangePwService {
  Future<Map<String, dynamic>> changePassword(Map<String, dynamic> body);
  Future<Map<String, dynamic>> resetPassword(Map<String, dynamic> body);
}