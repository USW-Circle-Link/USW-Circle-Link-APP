import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usw_circle_link/dio/Dio.dart';
import 'package:usw_circle_link/models/change_pw_model.dart';
import 'package:usw_circle_link/models/email_verification_model.dart';
import 'package:usw_circle_link/models/find_id_model.dart';
import 'package:usw_circle_link/models/find_pw_model.dart';
import 'package:usw_circle_link/models/request/sign_up_request.dart';
import 'package:usw_circle_link/models/response/email_verification_response.dart';
import 'package:usw_circle_link/models/response/send_mail_response.dart';
import 'package:usw_circle_link/models/sign_up_model.dart';
import 'package:usw_circle_link/models/login_data.dart';
import 'package:usw_circle_link/utils/logger/logger.dart';

import '../models/response/global_exception.dart';
import '../utils/result.dart';

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
  Future<Result<SendMailResponse>> sendMail({
    required String email,
  }) async {
    try {
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

      logger.d(
          'sendMail - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(SendMailResponse.fromJson(response.data));
      } else {
        // Bad Request
        return Result.error(
            EmailVerificationModelError.fromJson(response.data) as Exception);
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException());
    }
  }

  Future<Result<EmailVerificationResponse>> verifyEmailVerification({
    required String email,
  }) async {
    try {
      final response = await dio.post(
        '$basePath/email/verification',
        data: {
          'email': email,
        },
      );

      logger.d(response.data);

      logger.d(
          'verifyEmailVerification - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(EmailVerificationResponse.fromJson(response.data));
      } else {
        return Result.error(
            EmailVerificationModelError.fromJson(response.data) as Exception);
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException());
    }
  }

  Future<Result<bool>> verifyId({
    required String id,
  }) async {
    try {
      final response = await dio.get(
        '$basePath/verify-duplicate/$id',
      );

      logger.d(response.data);

      logger.d(
          'verifyId - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(true);
      } else {
        // Bad Request
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException());
    }
  }

  Future<Result<bool>> verifyEmail({required String email}) async {
    try {
      final response = await dio.post(
        '$basePath/check/email/duplicate',
        data: {
          'email': email,
        },
      );

      logger.d(response.data);

      logger.d(
          'verifyEmail - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(true);
      } else {
        // Bad Request
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException());
    }
  }

  Future<Result<bool>> signUpNewMember({required SignUpRequest request}) async {
    try {
      final body = request.toJson();
      final emailTokenUUID = request.emailTokenUUID;
      final signupUUID = request.signupUUID;

      final headers = {
        'signupUUID': signupUUID,
        'emailTokenUUID': emailTokenUUID,
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

      logger.d(response.data);

      logger.d(
          'signUpNewMember - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(true);
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException());
    }
  }

  Future<Result<bool>> signUpExistingMember({
    required SignUpRequest request,
  }) async {
    try {
      final body = request.toJson();
      final response =
          await dio.post('$basePath/existing/register', data: body);

      logger.d(body);

      logger.d(response.data);

      logger.d(
          'signUpExistingMember - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(true);
      } else {
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException());
    }
  }
  ////////////////////////////////////

  /////////// 로그인 관련 API ///////////
  Future<Result<LoginData>> login({
    required String id,
    required String password,
    required String fcmToken,
  }) async {
    try {
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
        return Result.ok(LoginData.fromJson(response.data['data']));
      } else {
        // Bad Request
        final error = GlobalException.fromJson(response.data);

        if (error.message == null) {
          return Result.error(error.copyWith(
            code: 'USR-F211',
            message: '필드값 에러',
          ));
        }
        return Result.error(error);
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException());
    }
  }

  Future<Result<bool>> logout({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      final response = await dio.post(
        '/integration/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            if (!kIsWeb) 'Cookie': 'refreshToken=$refreshToken',
          },
        ),
      );

      logger.d(response.data);

      logger
          .d('logout - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(true);
      } else {
        // Bad Request
        return Result.error(GlobalException.fromJson(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException());
    }
  }
  ////////////////////////////////////

  /////////// 프로필 수정 관련 API ///////////
  Future<Result<ChangePwModel>> changePW({
    required String userPw,
    required String newPw,
    required String confirmNewPw,
  }) async {
    try {
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

      logger.d(
          'changePW - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(ChangePwModel.fromJson(response.data)
            .setType(ChangePwModelType.changePW));
      } else {
        // Bad Request
        return Result.error(ChangePwModelError.fromJson(response.data)
            .setType(ChangePwModelType.changePW));
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException());
    }
  }
  ///////////////////////////////////////

  /////////// 계정복구 관련 API ///////////
  Future<Result<FindIdModel>> findId({
    required String email,
  }) async {
    try {
      final response = await dio.get(
        '$basePath/find-account/$email',
      );

      logger.d(response.data);

      logger
          .d('findId - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(FindIdModel.fromJson(response.data));
      } else {
        return Result.error(
            FindIdModelError.fromJson(response.data) as Exception);
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException());
    }
  }

  Future<Result<FindPwModel>> sendCode({
    required String account,
    required String email,
  }) async {
    try {
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

      logger.d(
          'sendCode - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(FindPwModel.fromJson(response.data)
            .setType(FindPwModelType.sendCode));
      } else {
        return Result.error(FindPwModelError.fromJson(response.data)
            .setType(FindPwModelType.sendCode) as Exception);
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException());
    }
  }

  Future<Result<FindPwModel>> verifyCode({
    required String code,
    required String uuid,
  }) async {
    try {
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
        return Result.ok(FindPwModel.fromJson(response.data)
            .setType(FindPwModelType.verifyCode));
      } else {
        return Result.error(FindPwModelError.fromJson(response.data)
            .setType(FindPwModelType.verifyCode) as Exception);
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException());
    }
  }

  Future<Result<ChangePwModel>> resetPW({
    required String password,
    required String confirmPassword,
    required String uuid,
  }) async {
    try {
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

      logger
          .d('resetPW - ${response.realUri} 로 요청 성공! (${response.statusCode})');

      if (response.statusCode == 200) {
        return Result.ok(ChangePwModel.fromJson(response.data)
            .setType(ChangePwModelType.resetPW));
      } else {
        // Bad Request
        return Result.error(ChangePwModelError.fromJson(response.data)
            .setType(ChangePwModelType.resetPW));
      }
    } on Exception catch (e) {
      return Result.error(e.toGlobalException());
    }
  }
  ////////////////////////////////////
}
