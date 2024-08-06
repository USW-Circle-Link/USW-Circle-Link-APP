import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:usw_circle_link/model/Circle.dart';

class UpdateprofileViewmodel {
  Future<List<Circle>> fetchCircles(String uuId) async {
    final response = await http.get(Uri.parse("http://localhost:8080/profile/update-profile"));

    if (response.statusCode == 200) {
      final responseBodyBytes = response.bodyBytes;
      final responseBody = utf8.decode(responseBodyBytes);
      print('Server response: $responseBody');
      final data = json.decode(responseBody)['data'] as List;
      return data.map((circle) => Circle.fromJson(circle)).toList();
    } else {
      print('Failed to fetch data: ${response.statusCode}');
      throw Exception('내 정보 조회에 실패하였습니다.');
    }
  }

  Future<void> updateProfile(String uuId, Circle updatedProfile) async {
    final response = await http.put(
      Uri.parse("http://localhost:8080/profile/update-profile"),
      headers: {"Content-Type": "application/json"},
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

final updateProfileViewmodel = FutureProvider.family<List<Circle>, String>((ref, uuId) {
  final repository = ref.watch(ProfileProvider);
  return repository.fetchCircles(uuId);
});
