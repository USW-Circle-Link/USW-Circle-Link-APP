import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:usw_circle_link/const/data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const accessTokenKey = 'access_token';

class CertificateRepository {
  Future<bool> certificateRepository({
    required String clubUUID,
    required int code,
   }) //async{
  //    await Future.delayed(const Duration(seconds: 1)); // 테스트용 딜레이
  //     print("테스트용: code=$code, clubUUID=$clubUUID");
  //     return true; // ✅ 서버 없이 성공 응답
//
// // 🧩 가짜 데이터 예시
//     const validClubUUID = "54e34bfa-2131-4f58-9c05-b498255612a6"; // 가입된 동아리
//
//     // 🧪 동아리에 가입되지 않은 경우
//     if (clubUUID != validClubUUID) {
//       throw Exception("소속 동아리가 없어 인증에 실패했습니다.");
//     }
//
//     // 🧪 3) 정상 인증
//     return true;
  // }
async {

    final storage = const FlutterSecureStorage();
    final accessToken = await storage.read(key: accessTokenKey);

    final url = Uri.parse("https://donggurami.net/api/user/event/verify");
    final body = jsonEncode({
       'clubUUID' : clubUUID,
      'code' : code});

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        // 서버가 {"success": true} 식으로 응답한다고 가정
        final data = jsonDecode(response.body);
        return data['success'] == true;
      } else {
        throw Exception("서버 통신 실패 (${response.body})");
        }
      }
  }


final certificateRepositoryProvider =
    Provider((ref) => CertificateRepository());
