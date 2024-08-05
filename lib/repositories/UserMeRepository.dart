import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/UserModel.dart';
import 'package:usw_circle_link/const/data.dart';

part 'UserMeRepository.g.dart';

final userMeRepositoryProvider = Provider<UserMeRepository>((ref) {
  final dio = ref.watch(dioProvider);
 
  return UserMeRepository(
    dio,
    baseUrl: 'http://$host:$port/user/me',
  );
});
 
@RestApi()
abstract class UserMeRepository {
  factory UserMeRepository(Dio dio, {String baseUrl}) = _UserMeRepository;
 
  @GET('/')
  @Headers({'accessToken': 'true'}) // Retrofit Headers 를 사용하기 위해 Dio Headers는 hide
  Future<UserModel> getMe();
}