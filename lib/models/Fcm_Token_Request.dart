class FcmTokenRequest {
  final String userAccount;
  final String fcmToken;

  FcmTokenRequest({required this.userAccount, required this.fcmToken});

  // FcmTokenRequest 객체를 JSON 맵으로 변환
  Map<String, dynamic> toJson() {
    return {
      'userAccount': userAccount,
      'fcmToken': fcmToken,
    };
  }
}
