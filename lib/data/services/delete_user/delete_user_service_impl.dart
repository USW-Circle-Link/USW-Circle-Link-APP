import 'package:dio/dio.dart';
import 'delete_user_service.dart';

class DeleteUserServiceImpl implements DeleteUserService {
  final Dio _dio;
  DeleteUserServiceImpl(this._dio);

  @override
  Future<Map<String, dynamic>> deleteUser(Map<String, dynamic> body) async {
    final res = await _dio.delete('/users/exit', data: body);
    return res.data as Map<String, dynamic>;
  }
}