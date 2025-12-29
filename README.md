# 동구라미 (Donggurami)

수원대학교 동아리 연합회 공식 플랫폼

![그래픽 이미지](https://drive.usercontent.google.com/download?id=1DCWixG_UA_LomZo2Xg5cDAJV9E0lzOHf&export=view&authuser=0)

## 📘 개요

**동구라미**는 수원대학교 동아리 연합회의 공식 플랫폼으로, 모든 동아리 정보를 전산화하여 효율적인 관리와 홍보를 가능하게 합니다. 학생들은 손쉽게 동아리 정보를 확인할 수 있고, 동아리는 별도 홍보 없이도 신입 회원을 모집할 수 있습니다.

이 플랫폼은 **Flutter**로 개발된 크로스 플랫폼 애플리케이션으로, **웹**, **iOS**, **Android** 환경에서 동작합니다. 사용자는 동아리를 탐색하고, 지원서를 작성 및 제출하며, 지원 현황을 실시간으로 확인할 수 있습니다. 또한, 알림 서비스를 통해 동아리 합격 여부 및 중요한 정보를 받을 수 있습니다.

> 📖 더 자세한 프로젝트 설명은 [프로젝트 개요 문서](./docs/PROJECT_OVERVIEW.md)를 참고하세요.

## 🎥 시연 동영상

- [동구라미 시연 영상 보기](https://linktr.ee/woochang4862)

## 🌐 서비스 링크

### 웹 버전 (권장)
| 서비스 | 링크 | 설명 |
|--------|------|------|
| 사용자 서비스 | [donggurami.net](https://donggurami.net) | 동아리 탐색, 지원서 작성/제출 |
| 관리자 페이지 | [admin.donggurami.net](https://admin.donggurami.net) | 동아리 관리자용 대시보드 |

### 모바일 앱
| 플랫폼 | 다운로드 | 상태 |
|--------|----------|------|
| iOS | [App Store](https://apps.apple.com/kr/app/%EB%8F%99%EA%B5%AC%EB%9D%BC%EB%AF%B8/id6692607046) | 운영 중 |
| Android | [Google Play](https://play.google.com/store/apps/details?id=com.usw.flag.temp.usw_circle_link) | 운영 중 |

> 💡 웹과 앱 모두 동일한 기능을 제공합니다. 웹은 설치 없이 바로 사용 가능하며, 앱은 푸시 알림 등 네이티브 기능을 활용할 수 있습니다.

## 📱 주요 기능

| 기능 | 설명 | 웹 | iOS | Android |
|------|------|:--:|:---:|:-------:|
| 동아리 탐색 | 다양한 동아리를 탐색하고 상세 정보 확인 | O | O | O |
| 지원서 작성/제출 | 선택한 동아리에 지원서 작성 및 제출 | O | O | O |
| 지원 현황 확인 | 지원한 동아리의 상태를 실시간 확인 | O | O | O |
| 푸시 알림 | 합격 여부 및 중요 알림 수신 | - | O | O |
| 프로필 관리 | 프로필 업데이트 및 관리 | O | O | O |

### 플랫폼별 특징

**웹 버전**
- 설치 없이 브라우저에서 바로 사용 가능
- 모바일/데스크탑 반응형 지원
- 최신 기능 가장 빠르게 반영

**모바일 앱**
- 네이티브 푸시 알림 지원
- 오프라인 캐시 지원
- 앱 아이콘으로 빠른 접근

## 🛠️ 기술 스택 & Tools

### 공통
- ![Dart](https://img.shields.io/badge/Dart-3.5.1-blue)
- ![Flutter](https://img.shields.io/badge/Flutter-3.24.1-blue)
- ![MVVM](https://img.shields.io/badge/Architecture-MVVM-green)

### 라이브러리 & API
- ![Riverpod](https://img.shields.io/badge/Library-Riverpod-yellow)
- ![Firebase Cloud Messaging](https://img.shields.io/badge/API-Firebase_Cloud_Messaging-yellow)
- ![Firebase Analytics](https://img.shields.io/badge/Analytics-Firebase_Analytics-orange)
- ![Sentry](https://img.shields.io/badge/Monitoring-Sentry-red)

### 배포 & CI/CD
- ![GitHub Pages](https://img.shields.io/badge/Hosting-GitHub_Pages-blue)
- ![GitHub Actions](https://img.shields.io/badge/CI/CD-GitHub_Actions-2088FF)
- ![Fastlane](https://img.shields.io/badge/CD-Fastlane-00F200)
- ![TestFlight](https://img.shields.io/badge/iOS-TestFlight-0D96F6)
- ![Google Play](https://img.shields.io/badge/Android-Google_Play-414141)

### IDE
- ![VS Code](https://img.shields.io/badge/IDE-VS_Code-blue)

### 도구
- ![Git](https://img.shields.io/badge/Tools-Git-orange)
- ![Notion](https://img.shields.io/badge/Tools-Notion-orange)
- ![Miro](https://img.shields.io/badge/Tools-Miro-orange)
- ![Figma](https://img.shields.io/badge/Tools-Figma-orange)

## 🔧 개발 환경 설정

### 사전 요구사항

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.24.1 이상)
- [Dart SDK](https://dart.dev/get-dart) (3.5.1 이상)
- IDE: VS Code 또는 Android Studio

### 환경 설정 파일

프로젝트를 실행하기 전에 아래 파일들을 설정해야 합니다.

#### 필수 설정 파일

| 파일 경로 | 설명 | 획득 방법 |
|-----------|------|-----------|
| `android/app/key.properties` | Android 서명 키 설정 | `key.example.properties` 복사 후 수정 |
| `android/app/google-services.json` | Firebase Android 설정 | Firebase Console에서 다운로드 |
| `ios/Runner/GoogleService-Info.plist` | Firebase iOS 설정 | Firebase Console에서 다운로드 |

#### Fastlane 설정 파일 (배포 시 필요)

| 파일 경로 | 설명 | 획득 방법 |
|-----------|------|-----------|
| `ios/fastlane/Appfile` | iOS 앱 정보 | 팀 관리자에게 요청 |
| `ios/fastlane/Fastfile` | iOS 배포 레인 | 팀 관리자에게 요청 |
| `ios/fastlane/Matchfile` | Match 인증서 설정 | 저장소에 포함됨 |
| `android/fastlane/Appfile` | Android 앱 정보 | 팀 관리자에게 요청 |
| `android/fastlane/Fastfile` | Android 배포 레인 | 팀 관리자에게 요청 |
| `android/app/service-account.json` | Play Store 서비스 계정 | Google Cloud Console에서 생성 |

#### Android 서명 키 설정

```bash
# 1. 예제 파일 복사
cp android/app/key.example.properties android/app/key.properties

# 2. key.properties 파일 편집
# storePassword, keyPassword, keyAlias, storeFile 값을 입력
```

**key.properties 형식:**
```properties
storePassword=your_store_password
keyPassword=your_key_password
keyAlias=your_key_alias
storeFile=/absolute/path/to/keystore.jks
```

#### Firebase 설정

1. [Firebase Console](https://console.firebase.google.com/)에서 프로젝트 선택
2. 프로젝트 설정 → 앱 추가에서 각 플랫폼 설정 파일 다운로드
3. 해당 경로에 파일 배치:
   - Android: `android/app/google-services.json`
   - iOS: `ios/Runner/GoogleService-Info.plist`

### 설치 및 실행

```bash
# 1. 저장소 클론
git clone https://github.com/USW-Circle-Link/USW-Circle-Link-APP.git
cd USW-Circle-Link-APP

# 2. 의존성 설치
flutter pub get

# 3. 코드 생성 (Freezed, Retrofit 등)
flutter pub run build_runner build
```

### 플랫폼별 실행 방법

#### 웹 버전
```bash
# 개발 서버 실행
flutter run -d chrome

# 프로덕션 빌드
flutter build web --release
```

#### iOS 앱
```bash
# iOS 시뮬레이터에서 실행
flutter run -d ios

# 프로덕션 빌드 (Xcode 필요)
flutter build ios --release
```

#### Android 앱
```bash
# Android 에뮬레이터/디바이스에서 실행
flutter run -d android

# APK 빌드
flutter build apk --release

# App Bundle 빌드 (Play Store 배포용)
flutter build appbundle --release
```

### 테스트 및 분석

```bash
# 테스트 실행
flutter test

# 코드 분석
flutter analyze
```

## 🚀 배포 (CD)

Fastlane을 이용하여 iOS와 Android 앱을 자동으로 배포합니다.

### 배포 파이프라인 구조

```
┌─────────────────────────────────────────────────────────────────┐
│                        배포 플랫폼                               │
├─────────────────┬─────────────────┬─────────────────────────────┤
│       웹        │       iOS       │          Android            │
├─────────────────┼─────────────────┼─────────────────────────────┤
│  GitHub Pages   │   TestFlight    │   Play Store Internal       │
│  (GitHub Actions)│   (Fastlane)   │        (Fastlane)           │
└─────────────────┴─────────────────┴─────────────────────────────┘
```

### GitHub Actions Runner 요구사항

iOS/Android 앱 배포(`deploy_prod`)를 위해서는 **Self-hosted macOS Runner**가 필요합니다.

| 워크플로우 | Runner | 설명 |
|------------|--------|------|
| 웹 배포 | `ubuntu-latest` | GitHub 제공 Runner 사용 |
| iOS/Android 배포 | `self-hosted, macOS` | Self-hosted Runner 필요 |

#### Self-hosted Runner 설정 방법

1. GitHub 저장소 → Settings → Actions → Runners
2. "New self-hosted runner" 클릭
3. macOS 선택 후 안내에 따라 설치
4. Runner에 다음 환경 구성:
   - Xcode (최신 버전)
   - Flutter SDK
   - Ruby & Bundler (Fastlane용)
   - CocoaPods

```yaml
# 워크플로우 예시
jobs:
  deploy_prod:
    runs-on: [self-hosted, macOS]
    steps:
      - uses: actions/checkout@v4
      # ...
```

### iOS 배포 (TestFlight)

Fastlane Match를 사용하여 인증서와 프로비저닝 프로파일을 관리합니다.

```bash
cd ios

# TestFlight 배포
fastlane release
```

**배포 프로세스:**
1. Match로 App Store 인증서 가져오기
2. CocoaPods 의존성 설치
3. Flutter iOS 빌드 (`flutter build ios --release`)
4. Xcode 코드 서명 설정
5. IPA 빌드
6. TestFlight 업로드

### Android 배포 (Play Store)

```bash
cd android

# Play Store Internal Track 배포
fastlane deploy
```

**배포 프로세스:**
1. Flutter App Bundle 빌드 (`flutter build appbundle --release`)
2. Play Store Internal Track 업로드

### 웹 배포 (GitHub Pages)

`main` 브랜치에 푸시하면 GitHub Actions가 자동으로 배포합니다.

```bash
# 수동 빌드
flutter build web --release --source-maps

# 배포는 GitHub Actions에서 자동 수행
git push origin main
```

**배포 프로세스:**
1. Flutter 웹 빌드
2. Sentry 소스맵 업로드
3. GitHub Pages 배포

### 환경 변수 설정

#### iOS (GitHub Secrets 또는 로컬 환경)
| 변수명 | 설명 |
|--------|------|
| `MATCH_PASSWORD` | Match 인증서 암호화 비밀번호 |
| `FASTLANE_TEAM_ID` | Apple Developer Team ID |
| `FASTLANE_USER` | Apple ID |
| `FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD` | 앱 전용 비밀번호 |

#### Android (GitHub Secrets 또는 로컬 환경)
| 변수명 | 설명 |
|--------|------|
| `PLAY_STORE_JSON_KEY` | Google Play Console 서비스 계정 JSON |
| `ANDROID_KEYSTORE_BASE64` | 서명 키스토어 (Base64 인코딩) |
| `ANDROID_KEY_ALIAS` | 키 별칭 |
| `ANDROID_KEY_PASSWORD` | 키 비밀번호 |
| `ANDROID_STORE_PASSWORD` | 키스토어 비밀번호 |
