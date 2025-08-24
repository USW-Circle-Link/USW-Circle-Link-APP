import 'package:dio/dio.dart';
import '../../../domain/models/user/profile_model.dart';

class ProfileRepository {
  final Dio dio;

  ProfileRepository({required this.dio});

  Future<ProfileModelBase> getProfile() async {
    try {
      final response = await dio.get('/users/profile');
      return ProfileModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      return ProfileModelError(
          message: e.response?.data['message'] ?? '프로필 정보를 불러오는데 실패했습니다.');
    } catch (e) {
      return ProfileModelError(message: '알 수 없는 오류가 발생했습니다.');
    }
  }
}