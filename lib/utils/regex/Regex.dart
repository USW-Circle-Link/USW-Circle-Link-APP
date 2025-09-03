import 'package:usw_circle_link/utils/logger/Logger.dart';

final RegExp idRegExp = RegExp(r'^[A-Z|a-z|0-9]{5,20}$');
final RegExp wordRegExp = RegExp(r'[a-zA-Z]');
final RegExp numberRegExp = RegExp(r'[\d]');
final RegExp nonWordRegExp =
    RegExp(r'''[`~!@#$%^&*()\-_=+\[\]{};:'",<.>/?\|]''');
final RegExp invalidWordRegExp =
    RegExp(r'''[^a-zA-Z\d`~!@#$%^&*()\-_=+\[\]{};:'",<.>/?\|]''');
final RegExp emailVerificationUrlRegExp = RegExp(r'^[^\s]{1,30}$');
final RegExp nameRegExp = RegExp(r'^[A-Za-z가-힣]{2,30}$');
final RegExp telephoneRegExp = RegExp(r'^[0-9]{11}$');
final RegExp studentNumberRegExp = RegExp(r'^[0-9]{8}$');

extension PasswordValidation on String {
  bool validate() {
    logger.d(this);
    logger.d(nonWordRegExp);
    return wordRegExp.hasMatch(this) &&
        numberRegExp.hasMatch(this) &&
        nonWordRegExp.hasMatch(this) &&
        !invalidWordRegExp.hasMatch(this) &&
        length >= 8 &&
        length <= 20;
  }
}
