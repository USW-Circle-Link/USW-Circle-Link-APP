import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:usw_circle_link/dio/dio.dart';
import 'package:usw_circle_link/models/user_model.dart';
import 'package:usw_circle_link/const/data.dart';

part 'user_me_repository.g.dart';

final userMeRepositoryProvider = Provider<UserMeRepository>((ref) {
  final dio = ref.watch(dioProvider);
 
  return UserMeRepository(
    dio,
    baseUrl: 'https://$host:$port/user/me',
  );
});
 
@RestApi()
abstract class UserMeRepository {
  factory UserMeRepository(Dio dio, {String baseUrl}) = _UserMeRepository;
 
  @GET('/')
  @Headers({'accessToken': 'true'}) // Retrofit Headers 를 사용하기 위해 Dio Headers는 hide
  Future<UserModel> getMe();
}