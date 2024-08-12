import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/ChangePWModel.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/EmailVerificationModel.dart';
import 'package:usw_circle_link/models/FindIdModel.dart';
import 'package:usw_circle_link/models/FindPWModel.dart';
import 'package:usw_circle_link/models/SignUpModel.dart';
import 'package:usw_circle_link/models/UserModel.dart';
import 'package:usw_circle_link/utils/logger/Logger.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return AuthRepository(
    baseUrl: 'http://$host:$port/users',
    dio: dio,
  );
});

class AuthRepository {
  final String baseUrl;
  final Dio dio;

  AuthRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<SignUpModel> verifyId({
    required String id,
  }) async {
    final response = await dio.get(
      '$baseUrl/verify-duplicate/$id',
    );

    logger
        .d('verifyId - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return SignUpModel.fromJson(response.data)
          .setType(SignUpModelType.verify);
    } else {
      // Bad Request
      throw SignUpModel.fromJson(response.data)
          .setType(SignUpModelType.validatePasswordMatch);
    }
  }

  Future<SignUpModel> validatePasswordMatch({
    required String password,
    required String passwordConfirm,
  }) async {
    final body = {
      "password": password,
      "confirmPassword": passwordConfirm,
    };

    final response = await dio.post(
      '$baseUrl/validate-passwords-match',
      data: body,
    );

    logger.d(
        'validatePasswordMatch - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return SignUpModel.fromJson(response.data)
          .setType(SignUpModelType.validatePasswordMatch);
    } else {
      // Bad Request
      throw SignUpModelError.fromJson(response.data)
          .setType(SignUpModelType.validatePasswordMatch);
    }
  }

  Future<EmailVerificationModel> sendMail({
    required String account,
    required String password,
    required String userName,
    required String telephone,
    required String studentNumber,
    required String major,
    required String email,
  }) async {
    final body = {
      "account": account,
      "password": password,
      "userName": userName,
      "telephone": telephone,
      "studentNumber": studentNumber,
      "major": major,
      "email": email,
    };

    final response = await dio.post(
      '$baseUrl/temporary',
      data: body,
      options: Options(headers: {
        'Content-Type': 'application/json',
      }),
    );

    logger
        .d('sendMail - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return EmailVerificationModel.fromJson(response.data)
          .setType(EmailVerificationModelType.sendMail);
    } else {
      // Bad Request
      throw EmailVerificationModelError.fromJson(response.data)
          .setType(EmailVerificationModelType.sendMail);
    }
  }

  Future<EmailVerificationModel> resendMail({
    required String emailTokenId,
  }) async {
    final body = {
      "emailToken_uuid": emailTokenId,
    };

    final response = await dio.post(
      '$baseUrl/email/resend-confirmation',
      data: body,
      options: Options(headers: {
        'Content-Type': 'application/json',
      }),
    );

    logger.d(
        'resendMail - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return EmailVerificationModel.fromJson(response.data)
          .setType(EmailVerificationModelType.resendMail);
    } else {
      // Bad Request
      throw EmailVerificationModelError.fromJson(response.data)
          .setType(EmailVerificationModelType.resendMail);
    }
  }

  Future<EmailVerificationModelComplete> signUp({
    required String account,
  }) async {
    final body = {
      'account': account,
    };
    final response = await dio.post(
      '$baseUrl/finish-signup',
      data: body,
      options: Options(headers: {
        'Content-Type': 'application/json',
      }),
    );

    logger.d('signUp - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return EmailVerificationModelComplete.fromJson(response.data)
          .setType(EmailVerificationModelType.completeSignUp);
    } else {
      // Bad Request
      throw EmailVerificationModelError.fromJson(response.data)
          .setType(EmailVerificationModelType.completeSignUp);
    }
  }

  Future<UserModel> login({
    required String id,
    required String password,
  }) async {
    final body = {
      'account': id,
      'password': password,
    };

    final response = await dio.post(
      '$baseUrl/login',
      data: body,
      options: Options(headers: {
        'Content-Type': 'application/json',
      }),
    );

    logger.d('login - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      // Bad Request
      throw UserModelError.fromJson(response.data);
    }
  }

  Future<ChangePWModel> changePW({
    required String userPw,
    required String newPw,
    required String confirmNewPw,
  }) async {
    final response = await dio.patch('$baseUrl/:accessToken/userpw',
        data: {
          'userPw': userPw,
          'newPw': newPw,
          'confirmNewPw': confirmNewPw,
        },
        options: Options(headers: {'accessToken': 'true', 'onPath': 'true'}));

    if (response.statusCode == 200) {
      return ChangePWModel.fromJson(response.data);
    } else {
      // Bad Request
      throw ChangePWModelError.fromJson(response.data);
    }
  }

  Future<ChangePWModel> resetPW({
    required String newPw,
    required String confirmNewPw,
  }) async {
    final response = await dio.patch(
      '$baseUrl/reset-password',
      data: {
        'password': newPw,
        'confirmPassword': confirmNewPw,
      },
    );

    if (response.statusCode == 200) {
      return ChangePWModel.fromJson(response.data);
    } else {
      // Bad Request
      throw ChangePWModelError.fromJson(response.data);
    }
  }

  Future<FindIdModel> findId({
    required String email,
  }) async {
    final response =
        await dio.get('$baseUrl/find-account/${email}' // TODO: URL 수정 필요
            );

    if (response.statusCode == 200) {
      return FindIdModel.fromJson(response.data);
    } else {
      throw FindIdModelError.fromJson(response.data);
    }
  }

  Future<FindPWModel> sendCode({
    required String account,
    required String email,
  }) async {
    final body = {
      "userAccount": account,
      "email": email,
    };
    final response = await dio.post(
      '$baseUrl/auth/send-code',
      data: body,
      options: Options(
        headers: {
          'accessToken': 'true',
        },
      ),
    );

    if (response.statusCode == 200) {
      return FindPWModel.fromJson(response.data)
          .setType(FindPWModelType.sendCode);
    } else {
      throw FindPWModelError.fromJson(response.data)
          .setType(FindPWModelType.sendCode);
    }
  }

  Future<FindPWModel> verifyCode({required String code}) async {
    final response = await dio.post('$baseUrl/auth/verify-token');

    if (response.statusCode == 200) {
      return FindPWModel.fromJson(response.data)
          .setType(FindPWModelType.verifyCode);
    } else {
      throw FindPWModelError.fromJson(response.data)
          .setType(FindPWModelType.verifyCode);
    }
  }
}
