# nestory

Nestory Flutter 프로젝트입니다. Flutter 기본 카운터 앱을 시작점으로 사용합니다.

## 개발 환경

- Flutter 3.47.5 (stable)
- Dart 3.13.4
- 앱 ID: `com.yunflutter.nestory`
- 플랫폼: Android, iOS, Web, macOS, Windows, Linux

## 실행

```sh
flutter pub get
flutter run
```

웹으로 실행하려면 `flutter run -d chrome`을 사용합니다. 각 플랫폼을 빌드하려면 해당 플랫폼의 SDK와 개발 도구가 필요합니다.

## 검증

```sh
flutter analyze
flutter test
```

앱 시작점은 `lib/main.dart`입니다.

## 앱 구조

앱 조립·공통 디자인·기능별 계층의 책임과 구현 순서는 [앱 구조](docs/APP_ARCHITECTURE.md)를 따릅니다. [구현 Issue 5](https://github.com/YunFlutter/nestory/issues/5)에서 단계별로 진행하며 현재 제품 기능과 공통 디자인 위젯은 구현 전입니다.
