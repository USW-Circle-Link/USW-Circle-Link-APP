import 'package:provider/provider.dart';

enum Flavor {
  development,
  staging,
  production,
}

class FlavorConfig {
  final String apiBaseUrl;

  FlavorConfig({required this.apiBaseUrl});
}

// 앱 시작 시 초기화될 Flavor 설정을 담는 변수입니다.
// 앱의 생명주기 동안 변경되지 않아야 합니다.
late final FlavorConfig _flavorConfig;

// 초기화된 Flavor 설정을 다른 Provider들이 읽을 수 있도록 제공하는 Provider입니다.
final flavorConfigProvider = Provider(create: (context) => _flavorConfig);

// 앱 시작점(main)에서 호출하여 Flavor를 설정하는 함수입니다.
void initializeFlavor(Flavor flavor) {
  switch (flavor) {
    case Flavor.development:
      _flavorConfig = FlavorConfig(
        apiBaseUrl: 'http://15.164.246.244:8080', // 테스트 서버
      );
      break;
    case Flavor.staging:
    case Flavor.production:
      _flavorConfig = FlavorConfig(
        apiBaseUrl: 'https://api.donggurami.net', // 배포 서버
      );
      break;
  }
}