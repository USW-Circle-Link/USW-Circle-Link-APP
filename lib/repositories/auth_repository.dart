import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/dio.dart';
import 'package:usw_circle_link/models/change_pw_model.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/models/email_verification_model.dart';
import 'package:usw_circle_link/models/FindIdModel.dart';
import 'package:usw_circle_link/models/find_pw_model.dart';
import 'package:usw_circle_link/models/sign_up_model.dart';
import 'package:usw_circle_link/models/user_model.dart';
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

  /////////// 회원가입 관련 API ///////////
  Future<SignUpModel> verifyId({
    required String id,
  }) async {
    final response = await dio.get(
      '$baseUrl/verify-duplicate/$id',
    );

    logger.d(response.data);

    logger
        .d('verifyId - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return SignUpModel.fromJson(response.data)
          .setType(SignUpModelType.verify);
    } else {
      // Bad Request
      throw SignUpModelError.fromJson(response.data)
          .setType(SignUpModelType.verify);
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
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
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

    logger.d(response.data);

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

  Future<EmailVerificationModelResend> resendMail({
    required String emailTokenId,
  }) async {
    final response = await dio.post(
      '$baseUrl/email/resend-confirmation',
      options: Options(
        headers: {
          "emailToken_uuid": emailTokenId,
        },
      ),
    );

    logger.d(response.data);

    logger.d(
        'resendMail - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return EmailVerificationModelResend.fromJson(response.data)
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
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    logger.d(response.data);

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
  ////////////////////////////////////

  /////////// 로그인 관련 API ///////////
  Future<UserModel> login({
    required String id,
    required String password,
    required String fcmToken,
  }) async {
    final body = {
      'account': id,
      'password': password,
      'fcmToken': fcmToken,
    };

    final response = await dio.post(
      '$baseUrl/login',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    logger.d(response.data);

    logger.d('login - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      // Bad Request
      throw UserModelError.fromJson(response.data);
    }
  }

  Future<void> logout({
    required String accessToken,
    required String refreshToken,
  }) async {
    final response = await dio.post(
      'http://$host:$port/integration/logout',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Cookie': 'refreshToken=$refreshToken',
        },
      ),
    );

    logger.d(response.data);

    logger.d('logout - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return;
    } else {
      // Bad Request
      throw UserModelError.fromJson(response.data);
    }
  }
  ////////////////////////////////////

  /////////// 프로필 수정 관련 API ///////////
  Future<ChangePwModel> changePW({
    required String userPw,
    required String newPw,
    required String confirmNewPw,
  }) async {
    final response = await dio.patch(
      '$baseUrl/userpw',
      data: {
        'userPw': userPw,
        'newPw': newPw,
        'confirmNewPw': confirmNewPw,
      },
      options: Options(
        headers: {
          'accessToken': 'true',
          'Content-Type': 'application/json',
        },
      ),
    );

    logger.d(response.data);

    logger
        .d('changePW - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ChangePwModel.fromJson(response.data)
          .setType(ChangePwModelType.changePW);
    } else {
      // Bad Request
      throw ChangePwModelError.fromJson(response.data)
          .setType(ChangePwModelType.changePW);
    }
  }
  ///////////////////////////////////////

  /////////// 계정복구 관련 API ///////////
  Future<FindIdModel> findId({
    required String email,
  }) async {
    final response = await dio.get('$baseUrl/find-account/$email');

    logger.d(response.data);

    logger.d('findId - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return FindIdModel.fromJson(response.data);
    } else {
      throw FindIdModelError.fromJson(response.data);
    }
  }

  Future<FindPwModel> sendCode({
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
          'Content-Type': 'application/json',
        },
      ),
    );

    logger.d(response.data);

    logger
        .d('sendCode - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return FindPwModel.fromJson(response.data)
          .setType(FindPwModelType.sendCode);
    } else {
      throw FindPwModelError.fromJson(response.data)
          .setType(FindPwModelType.sendCode);
    }
  }

  Future<FindPwModel> verifyCode({
    required String code,
    required String uuid,
  }) async {
    final body = {
      "authCode": code,
    };
    final response = await dio.post(
      '$baseUrl/auth/verify-token',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'uuid': uuid,
        },
      ),
    );

    logger.d(response.data);

    logger.d(
        'verifyCode - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return FindPwModel.fromJson(response.data)
          .setType(FindPwModelType.verifyCode);
    } else {
      throw FindPwModelError.fromJson(response.data)
          .setType(FindPwModelType.verifyCode);
    }
  }

  Future<ChangePwModel> resetPW({
    required String password,
    required String confirmPassword,
    required String uuid,
  }) async {
    final response = await dio.patch(
      '$baseUrl/reset-password',
      data: {
        'password': password,
        'confirmPassword': confirmPassword,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'uuid': uuid,
        },
      ),
    );

    logger.d(response.data);

    logger.d('resetPW - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return ChangePwModel.fromJson(response.data)
          .setType(ChangePwModelType.resetPW);
    } else {
      // Bad Request
      throw ChangePwModelError.fromJson(response.data)
          .setType(ChangePwModelType.resetPW);
    }
  }
  ////////////////////////////////////
}
