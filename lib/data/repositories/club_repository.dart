import 'package:dio/dio.dart';
import '../../utils/result.dart';
import '../../domain/models/club.dart';

class ClubRepository {
  final Dio dio;

  ClubRepository({required this.dio});

  Future<Result<List<Club>>> getClubs() async {
    try {
      final response = await dio.get('/clubs');
      final List<dynamic> data = response.data['data'];
      return Result.ok(data.map((item) => Club.fromJson(item)).toList());
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
