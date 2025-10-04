import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class CertificateRepository {
  Future<void> certificateRepository() async{
      // 서버에 요청 보내기
      ///await http.post();

  }

}

final certificateRepositoryProvider =
    Provider((ref) => CertificateRepository());