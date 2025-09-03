import 'package:dio/dio.dart';
import 'change_pw_service.dart';

class ChangePwServiceImpl implements ChangePwService {
  final Dio _dio;
  ChangePwServiceImpl(this._dio);

  @override
  Future<Map<String, dynamic>> changePassword(Map<String, dynamic> body) async {
    final res = await _dio.post('/auth/password/change', data: body);
    return res.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> resetPassword(Map<String, dynamic> body) async {
    final res = await _dio.post('/auth/password/reset', data: body);
    return res.data as Map<String, dynamic>;
  }
}