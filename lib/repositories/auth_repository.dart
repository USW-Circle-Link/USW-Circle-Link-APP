import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/dio.dart';
import 'package:usw_circle_link/models/change_pw_model.dart';
import 'package:usw_circle_link/models/email_verification_model.dart';
import 'package:usw_circle_link/models/find_id_model.dart';
import 'package:usw_circle_link/models/find_pw_model.dart';
import 'package:usw_circle_link/models/request/sign_up_request.dart';
import 'package:usw_circle_link/models/response/email_verification_response.dart';
import 'package:usw_circle_link/models/sign_up_model.dart';
import 'package:usw_circle_link/models/user_model.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return AuthRepository(
    basePath: '/users',
    dio: dio,
  );
});

class AuthRepository {
  final String basePath;
  final Dio dio;

  AuthRepository({
    required this.basePath,
    required this.dio,
  });

  /////////// 회원가입 관련 API ///////////
  Future<EmailVerificationResponse> sendMail({
    required String email,
  }) async {
    final body = {
      "email": email,
    };

    logger.d('sendMail - body {$body}');

    final response = await dio.post(
      '$basePath/temporary/register',
      data: body,
      options: Options(headers: {
        'Content-Type': 'application/json',
      }),
    );

    logger.d(response.data);

    logger
        .d('sendMail - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return EmailVerificationResponse.fromJson(response.data);
    } else {
      // Bad Request
      throw EmailVerificationModelError.fromJson(response.data);
    }
  }

  Future<bool> verifyEmailVerification({
    required String email,
  }) async {
    final response = await dio.get(
      '$basePath/email/verification',
      data: {
        'email': email,
      },
    );

    logger.d(response.data);

    logger.d(
        'verifyEmailVerification - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200 && response.data != null) {
      return response.data!;
    } else {
      throw EmailVerificationModelError.fromJson(response.data);
    }
  }

  Future<bool> verifyId({
    required String id,
  }) async {
    final response = await dio.get(
      '$basePath/verify-duplicate/$id',
    );

    logger.d(response.data);

    logger
        .d('verifyId - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return true;
    } else {
      // Bad Request
      throw SignUpModelError.fromJson(response.data)
          .setType(SignUpModelType.verify);
    }
  }

  Future<bool> signUpNewMember({required SignUpRequest request}) async {
    final body = request.toJson();
    final email = request.email;
    final uuid = request.uuid;

    final headers = {
      'user_email': email,
      'emailToken_uuid': uuid,
    };
    logger.d(body);
    logger.d(headers);
    final response = await dio.post(
      '$basePath/signup',
      data: body,
      options: Options(
        headers: headers,
      ),
    );

    logger.d(
        'signUpNewMember - ${response.data} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw SignUpModelError.fromJson(response.data);
    }
  }

  Future<bool> signUpExistingMember({
    required SignUpRequest request,
  }) async {
    final body = request.toJson();
    final response = await dio.post('$basePath/existing/register', data: body);

    logger.d(body);

    logger.d(response.data);

    logger.d(
        'signUpExistingMember - ${response.realUri} 로 요청 성공! (${response.statusCode})');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw SignUpModelError.fromJson(response.data)
          .setType(SignUpModelType.signUpExistingMember);
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
      '$basePath/login',
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
      var error = UserModelError.fromJson(response.data);
      if (error.message == null) {
        error = error.setCode(
          '필드값 에러',
          'USR-F211',
          error.exception,
          error.error,
          error.status,
        );
      }
      throw error;
    }
  }

  Future<void> logout({
    required String accessToken,
    required String refreshToken,
  }) async {
    final response = await dio.post(
      '/integration/logout',
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
      '$basePath/userpw',
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
    final response = await dio.get('$basePath/find-account/$email');

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
      '$basePath/auth/send-code',
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
      '$basePath/auth/verify-token',
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
      '$basePath/reset-password',
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
