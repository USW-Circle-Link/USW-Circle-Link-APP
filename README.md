# 동구라미

모바일 서비스 프로젝트입니다.

![그래픽 이미지](https://drive.usercontent.google.com/download?id=1DCWixG_UA_LomZo2Xg5cDAJV9E0lzOHf&export=view&authuser=0)

## 📘 개요 

**동구라미**는 수원대학교 동아리 연합회의 공식 플랫폼으로, 모든 동아리 정보를 전산화하여 효율적인 관리와 홍보를 가능하게 합니다. 학생들은 손쉽게 동아리 정보를 확인할 수 있고, 동아리는 별도 홍보 없이도 신입 회원을 모집할 수 있습니다.

이 플랫폼은 Flutter로 개발되었으며, 웹과 모바일 환경에서 동작합니다. 사용자는 동아리를 탐색하고, 지원서를 작성 및 제출하며, 지원 현황을 실시간으로 확인할 수 있습니다. 또한, 알림 서비스를 통해 동아리 합격 여부 및 중요한 정보를 받을 수 있습니다.

> 📖 더 자세한 프로젝트 설명은 [프로젝트 개요 문서](./docs/PROJECT_OVERVIEW.md)를 참고하세요.

## 🎥 시연 동영상

- [동구라미 시연 영상 보기](https://linktr.ee/woochang4862)

## 🌐 서비스 링크

### 웹 서비스
- **사용자 서비스**: [donggurami.net](https://donggurami.net)
- **관리자 페이지**: [admin.donggurami.net](https://admin.donggurami.net)

### 모바일 앱 (레거시)
- [App Store에서 다운로드](https://apps.apple.com/kr/app/%EB%8F%99%EA%B5%AC%EB%9D%BC%EB%AF%B8/id6692607046)
- [Google Play에서 다운로드](https://play.google.com/store/apps/details?id=com.usw.flag.temp.usw_circle_link)

> ⚠️ 현재 서비스는 웹으로 통합되어 주로 웹을 통해 이용하실 수 있습니다.

## 📱 사용법 

앱을 실행한 후, 다음과 같은 기능을 사용할 수 있습니다:

- **동아리 탐색**: 다양한 동아리를 탐색하고, 각 동아리에 대한 상세 정보를 확인할 수 있습니다.
- **지원서 작성 및 제출**: 선택한 동아리에 지원서를 작성하고 제출할 수 있습니다.
- **지원 현황 확인**: 지원한 동아리의 상태를 실시간으로 확인할 수 있습니다.
- **알림 서비스**: 동아리 합격 여부 및 기타 중요한 알림을 실시간으로 받을 수 있습니다.
- **프로필 관리**: 자신의 프로필을 업데이트하고 관리할 수 있습니다.

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

### IDE
- ![VS Code](https://img.shields.io/badge/IDE-VS_Code-blue)

### 도구
- ![Git](https://img.shields.io/badge/Tools-Git-orange)
- ![Notion](https://img.shields.io/badge/Tools-Notion-orange)
- ![Miro](https://img.shields.io/badge/Tools-Miro-orange)
- ![Figma](https://img.shields.io/badge/Tools-Figma-orange)

## 🔧 설치 방법 

1. Flutter SDK를 설치합니다. [Flutter 설치 가이드](https://docs.flutter.dev/get-started/install)를 참고하세요.
2. 이 저장소를 클론합니다.
   ```bash
   git clone https://github.com/yourusername/usw_circle_link.git
   ```
3. 프로젝트 디렉토리로 이동합니다.
   ```bash
   cd usw_circle_link
   ```
4. 필요한 패키지를 설치합니다.
   ```bash
   flutter pub get
   ```
5. 애플리케이션을 실행합니다.
   ```bash
   flutter run
   ```
