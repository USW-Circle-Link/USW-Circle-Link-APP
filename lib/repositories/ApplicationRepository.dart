import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/ApplicationModel.dart';

part 'ApplicationRepository.g.dart';

final applicationRepositoryProvider = Provider<ApplicationRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return ApplicationRepository(
    dio,
    baseUrl: 'http://$host:$port/user/me',
  );
});

@RestApi()
abstract class ApplicationRepository {
  factory ApplicationRepository(Dio dio, {String baseUrl}) =
      _ApplicationRepository;

  @GET('/apply/{clud_id}')
  @Headers(
      {'accessToken': 'false'}) // Retrofit Headers 를 사용하기 위해 Dio Headers는 hide
  Future<ApplicationModel> getApplication(@Path() int cludId);

  @GET('/apply/{clud_id}')
  @Headers({'accessToken': 'true'})
  Future<ApplicationModel> apply({
    @Path() required int clubId,
    required String aplictGoogleFormUrl,
  });
}
