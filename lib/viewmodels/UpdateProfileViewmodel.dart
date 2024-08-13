import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:usw_circle_link/model/Circle.dart';

class UpdateprofileViewmodel {
  Future<Circle> fetchCircles(String token) async {
    final response = await http.get(Uri.parse("http://43.200.140.186:8080/profiles/"),
    headers: {
      'Authorization' : 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final responseBodyBytes = response.bodyBytes;
      final responseBody = utf8.decode(responseBodyBytes);
      print('Server response: $responseBody');
      final data = json.decode(responseBody)['data'];
      return Circle.fromJson(data);
    } else {
      print('Failed to fetch data: ${response.statusCode}');
      throw Exception('내 정보 조회에 실패하였습니다.');
    }
  }

  Future<void> updateProfile(String token, Circle updatedProfile) async {
    final response = await http.patch(
      Uri.parse("http://43.200.140.186:8080/profiles/"),
        headers: {
          'Authorization' : 'Bearer $token'
        });
      body: json.encode({
        "userName": updatedProfile.userName,
        "studentNumber": updatedProfile.studentNumber,
        "userHp": updatedProfile.userHp,
        "major": updatedProfile.major,
      }),
    );

    if (response.statusCode == 200) {
      print('Profile updated successfully');
    } else {
      print('Failed to update profile: ${response.statusCode}');
      throw Exception('프로필 업데이트에 실패하였습니다.');
    }
  }
}

final ProfileProvider = Provider<UpdateprofileViewmodel>((ref) {
  return UpdateprofileViewmodel();
});

final updateProfileViewmodel = FutureProvider.family<Circle, String>((ref, token) {
  final repository = ref.watch(ProfileProvider);
  return repository.fetchCircles(token);
});
