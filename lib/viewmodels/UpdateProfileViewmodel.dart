import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:usw_circle_link/model/Circle.dart';

class UpdateprofileViewmodel {
  Future<List<Circle>> fetchCircles(String uuId) async {
    final response = await http.get(Uri.parse(""));

    if (response.statusCode == 200) {
      final responseBodyBytes = response.bodyBytes;
      final responseBody = utf8.decode(responseBodyBytes);
      print('Server response: $responseBody');
      final data =json.decode(responseBody)['data'] as List;
      return data.map((circle) => Circle.fromJson(circle)).toList();
    } else {
      print('Failed to fetch data: ${response.statusCode}');
      throw Exception('내 정보 조회에 실패하였습니다.');
    }
  }
}

final ProfileProvider = Provider<UpdateprofileViewmodel> ((ref) {
  return UpdateprofileViewmodel();
});

final updateProfileViewmodel = FutureProvider.family<List<Circle>, String>((ref, uuId) {
  final repository = ref.watch(ProfileProvider);
  return repository.fetchCircles(uuId);

});