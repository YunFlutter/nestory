# 공통 표시·입력 컴포넌트

[Issue 5](https://github.com/YunFlutter/nestory/issues/5)의 공통 컴포넌트 구현이다. [승인 디자인](DESIGN_SYSTEM.md)의 색·Noto Sans KR·간격·크기·radius를 재사용하며, 실제 제품 화면은 후속 기능 Issue에서 연결한다. 앱의 시작 화면은 임시 카운터를 유지한다.

## 컴포넌트와 외부 제어

| 컴포넌트 | 표시·입력 계약 |
| --- | --- |
| [NestoryButton](../lib/core/widgets/nestory_button.dart) | `primary`·`secondary`·`destructive`, `label`·선택 아이콘·`onPressed`. `enabled: false`, null 콜백 또는 `isLoading: true`이면 터치·키보드·semantics 액션을 차단한다. 진행 문구는 `loadingLabel`로 전달한다. |
| [NestoryTextInput](../lib/core/widgets/nestory_text_input.dart) | 호출자가 소유·dispose하는 `TextEditingController`로 값을 전달하고 변경·제출 콜백으로 입력을 받는다. 고정 레이블과 필수/선택 표시, 외부 도움말·오류·글자 수 안내를 제공한다. 진행·비활성은 편집을 막고 값을 유지하며 읽기 전용은 선택·복사를 허용한다. |
| [NestoryStatusNotice](../lib/core/widgets/nestory_status_notice.dart) | 완료·대기·안내·오류·충돌·진행 중의 표시 역할, 외부 `message`·행동 레이블·콜백을 받는다. 행동 버튼의 진행·비활성도 외부에서 전달한다. 유형 이름·문구·아이콘을 함께 제공하며 기본 live region은 호출자가 끌 수 있다. |
| [NestoryPhotoPlaceholder](../lib/core/widgets/nestory_photo_placeholder.dart) | 공간·보관함·물건 유형에 따라 `사진 없음` 문구·아이콘과 하나의 이미지 semantics를 제공한다. 상호작용이나 사진 선택·업로드 기능은 없다. |

버튼 종류·상태 안내 종류·사진 유형은 각각 별도 enum 파일에서 관리한다. 저장소·Firebase·비동기 작업·입력 길이 제한·공백 정리·재시도 횟수·저장 성공 판단은 위젯 내부에 없다. 입력 중 오류나 진행 상태가 바뀌어도 controller 값을 초기화하지 않는다. 기능 계층이 실제 상태를 판단하고 필요한 문구와 제어 값을 전달해야 한다.

버튼은 `onPressed`에서 외부 진행 상태를 갱신한 뒤 다음 빌드에 `isLoading`을 전달하는 방식으로 사용한다. 여러 클라이언트나 네트워크 요청의 중복 방지·동일 작업 식별은 기능 계층과 서버의 책임이다. 상태 안내의 `success`는 호출자가 전달한 표시 역할이며 자체적으로 서버 저장 완료를 증명하지 않는다. 이름·메모의 길이와 글자 수 안내 역시 호출자가 계산한다.

## 레이아웃·포커스·의미 정보

- 버튼 최소 높이는 52px, 입력은 56px이며 필요한 글자 높이만큼 늘어난다. 버튼 터치 영역은 최소 48×48px이다. 긴 버튼 문구·레이블·오류·안내는 줄바꿈하며 글자 크기를 축소하거나 ellipsis로 자르지 않는다. 단일 줄 입력값은 Flutter의 가로 스크롤을 따른다. 메모는 `minLines`·`maxLines`로 제어한다.
- 사진 자리표시는 최소 높이 56px과 자연 높이를 사용한다. 56×56 고정 썸네일에 확대된 설명을 가두지 않는다. 기능 화면에서는 사진과 유형 설명을 위한 가용 공간을 확보해야 한다.
- 포커스 외곽선은 2px·간격 2px이며 자리를 항상 확보해 포커스 전환 시 내용이 움직이지 않는다. 채워진 버튼에는 흰 내부선도 제공한다. 입력 오류 경계는 오류색을 유지하면서 외부 포커스 선을 함께 표시한다.
- 입력 레이블·필수/선택과 도움말·오류·글자 수·진행 안내를 입력의 semantics에 연결한다. 오류에는 invalid 의미와 화면의 `오류:` 문구를 제공하며 상태 변경을 live region으로 알린다. 버튼·사진 아이콘의 중복 낭독은 제외한다.
- 보조 버튼을 누르면 선택 바탕과 `onPrimaryContainer` 글자를 함께 사용해 승인 본문 대비 4.5 이상을 유지한다. 비활성 글자색은 승인된 비활성 전용 토큰을 사용한다.
- 애니메이션 축소 요청 시 진행 버튼의 회전 표시를 정적인 아이콘으로 바꾸고 진행 문구를 유지한다.

화면의 SafeArea·키보드 회피·스크롤·뒤로 가기는 화면 호스트가 담당한다. 공통 컴포넌트 내부에 중첩 SafeArea나 기능 화면 이동을 넣지 않는다. 자동 검증에서는 SafeArea와 스크롤을 가진 호스트에서 하단 키보드 영역을 제외하고 확대된 버튼까지 도달하는지 확인한다.

## 자동 검증과 제한

[test/core/widgets](../test/core/widgets)의 테스트는 활성 액션 전달, 진행·비활성 액션 차단, 외부 입력값 변경·오류 해제·입력 보존·다시 편집, 읽기 전용·메모·제출, 상태 유형·행동·사진 레이블을 확인한다. 별도 접근성 테스트는 실제 번들 Noto Sans KR을 로드한다.

- 360·390·430 너비 × 1.0·3.2 글자 배율에서 기본·진행·비활성·오류 상태, 긴 문구·여러 줄 메모·사진 유형의 overflow·잘림과 최소 크기를 확인한다.
- Android·iOS TargetPlatform의 Tab 순서·비활성/진행 건너뛰기·Space 실행·포커스 표시·내용 위치 유지를 확인한다.
- Flutter의 Android/iOS 터치 영역·액션 레이블·텍스트 대비 guideline과, 누른 보조 버튼의 실제 글자/바탕 색 대비 4.5 이상을 확인한다.
- 입력·사진·상태 문구·버튼의 semantics, 애니메이션 축소·키보드·안전 영역 호스트를 확인한다.

```sh
flutter test test/core/widgets
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test
git diff --check
```

이 테스트는 Flutter의 렌더링·포커스·semantics 계약에 대한 자동 검증이다. Android/iPhone 실기기 한글·플랫폼 뒤로 가기·TalkBack·VoiceOver 실행은 수행하지 않았으며 사용자의 요청으로 Issue 5 종료 조건에서 제외한다. 실기기 검증 완료나 앱 전체 접근성 인증으로 표시하지 않는다. 플랫폼 최소 버전·권한·Firebase·제품 기능 구현도 이번 범위에 포함하지 않는다.

2026년 10월 7일 전체 테스트 58개(공통 컴포넌트 40개·기존 18개), 포맷·정적 분석·diff 검사, 문서 내부 링크 55개, Android debug APK·iOS simulator 빌드가 통과했다. 이번 빌드의 앱 시작 화면은 임시 카운터이며 컴포넌트의 상태·레이아웃·접근성은 위젯 테스트로 검증했다. 새 의존성·lockfile·플랫폼 설정 변경은 없다.
