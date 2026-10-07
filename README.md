# nestory

Nestory Flutter 프로젝트입니다. Figma 공통 디자인과 Noto Sans KR을 연결한 임시 카운터 화면을 시작점으로 사용합니다.

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

앱 시작점은 [lib/main.dart](lib/main.dart)입니다. [NestoryBootstrap](lib/app/nestory_bootstrap.dart)이 폰트 라이선스를 등록하고, 루트 [NestoryApp](lib/app/nestory_app.dart)이 앱을 조립해 임시 [CounterPage](lib/app/demo/counter_page.dart)를 표시합니다. 카운터 증가 동작을 유지하며 한글 안내와 글자 확대를 확인할 수 있습니다.

## 공통 디자인과 폰트

[Figma 원본](https://www.figma.com/design/0TBem9Jmlvqyh9QOmEBAs6/Nestory?node-id=51-608)과 [승인 디자인](docs/DESIGN_SYSTEM.md)을 `lib/core/design/`에 반영했습니다.

- [NestoryColors](lib/core/design/nestory_colors.dart): 색 역할 25개와 tertiary 별칭
- [NestoryTypography](lib/core/design/nestory_typography.dart): Noto Sans KR 텍스트 역할 9개
- [NestorySpacing](lib/core/design/nestory_spacing.dart), [NestorySizes](lib/core/design/nestory_sizes.dart), [NestoryRadii](lib/core/design/nestory_radii.dart): 간격·크기·모서리 반경
- [NestoryTheme](lib/core/design/nestory_theme.dart): 기존 Material 앱에 흰색·코랄 라이트 테마 연결

폰트는 앱에 포함해 네트워크 없이 사용합니다. 400·500·700 굵기는 동일한 원본 가변 폰트를 사용합니다. [파일 출처·라이선스·크기·해시](assets/fonts/README.md)를 함께 관리합니다. 기존 Figma의 44px 터치 변수보다 확정 문서의 최소 48px을 우선합니다. 52px 버튼·56px 입력 크기는 최소값이며 공통 컴포넌트가 글자에 따라 확장합니다.

폰트/번들 변경 시 다음도 확인합니다.

```sh
dart format --output=none --set-exit-if-changed lib test
flutter build apk --debug
flutter build ios --simulator
git diff --check
```

테스트는 승인 DESIGN.md와 색·서체·간격·형태를 대조하고 폰트 manifest·현대 한글 glyph·가변 굵기·라이선스 등록을 확인합니다. 실제 폰트를 로드한 임시 화면을 360·390·430 너비와 1.0·3.2 글자 배율에서 검사합니다. 이 테스트와 빌드는 실기기 TalkBack·VoiceOver 검증을 대신하지 않습니다.

2026년 10월 7일 공통 기반 작업에서 포맷·분석·테스트 18개·Android debug APK·iOS simulator 빌드를 통과했습니다. 양쪽 산출물의 폰트·라이선스 해시가 원본 자산과 일치하고 폰트가 한 벌씩 포함되는 것을 확인했습니다. iPhone 18 Pro / iOS 27.0 시뮬레이터에서 한글 표시와 카운터 증가도 확인했습니다. Android 실행, iPhone 실기기와 TalkBack·VoiceOver 검증은 남아 있습니다.

## 앱 구조

앱 조립·공통 디자인·기능별 계층의 책임과 구현 순서는 [앱 구조](docs/APP_ARCHITECTURE.md)를 따릅니다. [구현 Issue 5](https://github.com/YunFlutter/nestory/issues/5)에서 단계별로 진행하며 공통 토큰·폰트·테마와 버튼·레이블 입력·상태 안내·사진 자리표시를 구현했습니다. 제품 기능과 화면은 후속 단계입니다. Material 테마 연결이 최종 제품의 Material/Cupertino 선택이나 다크 모드 지원 확정을 뜻하지 않습니다.

## 공통 컴포넌트

`lib/core/widgets/`에 주요·보조·위험 버튼, 외부 controller로 제어하는 레이블 입력, 완료·대기·안내·오류·충돌·진행 상태 안내와 공간·보관함·물건 사진 자리표시를 제공합니다. [사용 계약과 접근성 검증](docs/COMMON_COMPONENTS.md)을 참고하세요. 진행·비활성 상태는 액션과 편집을 차단하고 입력값을 유지합니다. 저장 성공·입력 제한·재시도 정책은 기능 계층에서 전달해야 합니다.

```sh
flutter test test/core/widgets
```

실제 번들 폰트를 사용해 360·390·430 너비, 1.0·3.2배 글자 확대, 긴 문구·오류·진행·비활성, 최소 48×48 터치 영역, Android/iOS 기준 키보드 포커스 순서·semantics·대비·애니메이션 축소·안전 영역과 키보드가 있는 스크롤 호스트를 자동 검증합니다. 실기기·TalkBack·VoiceOver 실행은 미수행이며 사용자 요청으로 Issue 5 종료 조건에서 제외합니다. 임시 카운터는 유지하며 새 패키지·플랫폼·Firebase 설정은 추가하지 않았습니다.

2026년 10월 7일 공통 컴포넌트 작업에서 전체 테스트 58개(기존 18개·신규 40개), 포맷·정적 분석·diff·문서 내부 링크 55개, Android debug APK와 iOS simulator 빌드를 통과했습니다. 컴포넌트 검증은 위젯 테스트에서 수행했으며 이번 빌드의 시작 화면은 임시 카운터입니다.
