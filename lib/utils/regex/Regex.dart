final RegExp idRegExp = RegExp(r'^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|A-Z|a-z|0-9]{5,20}$');
final RegExp passwordRegExp =
      RegExp(r'^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{5,20}$');
final RegExp emailVerificationUrlRegExp = RegExp(r'');
final RegExp telephoneRegExp = RegExp(r'^[0-9]{11}$');
final RegExp studentNumberRegExp = RegExp(r'^[0-9]{8}$');