const Map<String, Map<String, String>> servers = {
  'prod': {'protocol': 'https', 'host': 'api.donggurami.net'},
  'dev': {'protocol': 'http', 'host': '15.164.246.244', 'port': '8080'},
};

// 앱의 현재 빌드 환경에 따라 서버를 선택합니다.
// main_development.dart 에서는 'dev'를, main.dart(production) 에서는 'prod'를 사용하도록 설정할 수 있습니다.
const String currentServer = String.fromEnvironment(
  'SERVER_MODE',
  defaultValue: 'prod',
);

final String serverProtocol = servers[currentServer]!['protocol']!;
final String serverHost = servers[currentServer]!['host']!;
final String? serverPort = servers[currentServer]!['port'];

final String baseUrl = serverPort?.isNotEmpty ?? false
    ? '$serverProtocol://$serverHost:$serverPort'
    : '$serverProtocol://$serverHost';

// Secure Storage Keys
const String accessTokenKey = 'ACCESS_TOKEN';
const String refreshTokenKey = 'REFRESH_TOKEN';