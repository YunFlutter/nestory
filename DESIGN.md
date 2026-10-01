---
name: Nestory
version: "0.1"
status: proposal
category: Personal belongings and location management
surface: Korean Android and iPhone mobile app
colors:
  background: "#FFFFFF"
  surface: "#FFFFFF"
  surfaceSubtle: "#F5F5F5"
  textPrimary: "#292724"
  textSecondary: "#626262"
  primary: "#C84B31"
  onPrimary: "#FFFFFF"
  primaryPressed: "#A83D27"
  primaryContainer: "#F4F4F4"
  onPrimaryContainer: "#A83D27"
  accent: "#C84B31"
  onAccent: "#FFFFFF"
  outline: "#888888"
  divider: "#E9E9E9"
  focus: "#C84B31"
  disabledContainer: "#EEEEEE"
  onDisabled: "#777777"
  success: "#A83D27"
  successContainer: "#FFFFFF"
  warning: "#765414"
  warningContainer: "#FFFFFF"
  error: "#A23C34"
  errorContainer: "#FFFFFF"
  info: "#565D65"
  infoContainer: "#FFFFFF"
  tertiary: "#C84B31"
typography:
  display:
    fontFamily: Pretendard
    fontSize: "32px"
    lineHeight: "42px"
    fontWeight: 700
  h1:
    fontFamily: Pretendard
    fontSize: "24px"
    lineHeight: "34px"
    fontWeight: 700
  h2:
    fontFamily: Pretendard
    fontSize: "20px"
    lineHeight: "28px"
    fontWeight: 600
  body:
    fontFamily: Pretendard
    fontSize: "16px"
    lineHeight: "24px"
    fontWeight: 400
  label:
    fontFamily: Pretendard
    fontSize: "16px"
    lineHeight: "24px"
    fontWeight: 600
  bodySmall:
    fontFamily: Pretendard
    fontSize: "14px"
    lineHeight: "22px"
    fontWeight: 400
  caption:
    fontFamily: Pretendard
    fontSize: "12px"
    lineHeight: "18px"
    fontWeight: 500
spacing:
  xs: 4
  sm: 8
  md: 12
  lg: 16
  xl: 24
  xxl: 32
  xxxl: 40
  section: 48
rounded:
  status: 8
  input: 12
  button: 12
  card: 16
  photo: 16
  sheet: 24
motion:
  press: "120ms"
  state: "180ms"
  navigation: "260ms"
  photo: "260ms"
  sheet: "240ms"
---

# Nestory

*일상의 물건이 제자리를 찾도록*

> Category: Personal belongings and location management
> Surface: Korean Android and iPhone mobile app

Nestory는 집 안의 물건을 기록하고 현재 보관 위치를 찾는 한국어 모바일 앱이다. 공간 → 보관함 → 물건 구조로 등록·찾기·이동을 돕는다. 사진은 선택적인 단서이며 이름과 전체 위치 경로가 핵심 정보다. 이 파일은 OpenDesign 입력용 디자인 제안이며 앱에 구현되거나 최종 승인된 시스템을 의미하지 않는다.

## Visual Theme & Atmosphere

순백색 바탕, 밝은 무채색 회색 구분, 읽기 쉬운 진한 회색 한글, 코랄 오렌지 주요 버튼, 명확한 버튼 위계로 구성한다. 국내 생활 서비스의 일상적인 사용 흐름을 참고하되 특정 앱의 로고나 브랜드 색을 복제하지 않는다. 장식보다 물건 사진과 현재 위치가 먼저 보이게 한다. 기업 수준의 완성도는 정렬·간격·정보 위계·예외 상태의 일관성으로 표현한다.

페이지·카드·시트·팝업·상태 안내의 기본 바탕은 반드시 #FFFFFF다. 웜화이트·크림·베이지의 넓은 면을 만들지 않는다. 색은 화면마다 새로 고르지 말고 아래 토큰을 공유한다. 라이트 모드 제안이며 다크 모드, Material/Cupertino 기반과 새 패키지는 확정하지 않는다.

## Color Palette & Roles

| Role | Name | Hex | Usage |
| --- | --- | --- | --- |
| primary | 주요 동작 | #C84B31 | 저장·추가·이동 확정, 흰 글자 |
| accent | 브랜드 표식 | #C84B31 | 같은 코랄 브랜드색의 작은 표식·평면 그래픽 |
| background | 기본 바탕 | #FFFFFF | 순백색 페이지 바탕 |
| surfaceSubtle | 보조 영역 | #F5F5F5 | 사진 없음·입력의 밝은 회색 |
| textSecondary | 설명 | #626262 | 경로·안내·고정 레이블 |
| primaryPressed | 누름 | #A83D27 | 주요 버튼을 누른 상태 |
| primaryContainer | 선택 | #F4F4F4 | 선택한 위치의 밝은 회색 바탕 |
| outline | 입력 경계 | #888888 | 입력 외곽선·선택 전 컨트롤 |
| divider | 구분 | #E9E9E9 | 장식적 행 구분만, 상태 경계용 금지 |
| warning | 대기 | #765414 | 기기 보존·전송 대기 아이콘과 문구 |
| error | 오류 | #A23C34 | 실패·삭제 위험 아이콘과 문구 |
| info | 정보 | #565D65 | 캐시 범위·추가 안내 아이콘과 문구 |
| surface | surface | #FFFFFF | 원본 디자인 시스템의 같은 역할 |
| textPrimary | textPrimary | #292724 | 원본 디자인 시스템의 같은 역할 |
| onPrimary | onPrimary | #FFFFFF | 원본 디자인 시스템의 같은 역할 |
| onPrimaryContainer | onPrimaryContainer | #A83D27 | 원본 디자인 시스템의 같은 역할 |
| onAccent | onAccent | #FFFFFF | 원본 디자인 시스템의 같은 역할 |
| focus | focus | #C84B31 | 원본 디자인 시스템의 같은 역할 |
| disabledContainer | disabledContainer | #EEEEEE | 원본 디자인 시스템의 같은 역할 |
| onDisabled | onDisabled | #777777 | 원본 디자인 시스템의 같은 역할 |
| success | success | #A83D27 | 원본 디자인 시스템의 같은 역할 |
| successContainer | successContainer | #FFFFFF | 원본 디자인 시스템의 같은 역할 |
| warningContainer | warningContainer | #FFFFFF | 원본 디자인 시스템의 같은 역할 |
| errorContainer | errorContainer | #FFFFFF | 원본 디자인 시스템의 같은 역할 |
| infoContainer | infoContainer | #FFFFFF | 원본 디자인 시스템의 같은 역할 |

`tertiary`는 `accent`의 입력용 별칭이며 새 색상이 아니다. 성공은 진한 코랄 체크와 완료 문구, 대기는 앰버 아이콘과 안내, 실패는 붉은 아이콘과 해결 행동으로 구분한다. 모든 상태 안내의 바탕은 흰색이며 컬러 패널로 만들지 않는다. 비활성 텍스트는 inactive 컨트롤 전용이다. 본문 대비 14.89:1, 버튼 대비 4.66:1, 보조 본문/흰색 6.10:1, 입력 경계/흰색 3.54:1이다. 임의 투명도·사진 위 합성에는 이 값을 재사용하지 않는다.

## Typography

- **Display font:** Pretendard — weights: 600, 700; fallbacks: system-ui, sans-serif
- **Body font:** Pretendard — weights: 400, 500, 600; fallbacks: system-ui, sans-serif

| Role | Size / line height | Weight | Use |
| --- | --- | --- | --- |
| display | 32 / 42 | 700 | 소개·큰 빈 상태에 제한 |
| h1 | 24 / 34 | 700 | 화면 제목·물건 이름 |
| h2 | 20 / 28 | 600 | 보관함·물건 섹션 |
| body | 16 / 24 | 400 | 입력값·메모·본문 |
| label | 16 / 24 | 600 | 버튼·주요 행 이름 |
| bodySmall | 14 / 22 | 400 | 경로·필드 안내 |
| caption | 12 / 18 | 500 | 부가 정보만, 핵심 경로·오류에 금지 |

모바일 논리 픽셀 기준의 출발값이며 미리보기에서는 같은 수치를 CSS px로 표현할 수 있다. 자간 기본 0. 한글을 임의 대문자처럼 꾸미거나 장식용 영문 서체·세리프를 섞지 않는다. 필수 텍스트에 고정 높이나 축소 글자를 적용하지 않는다. Pretendard는 서체 후보이며 실제 폰트 파일·라이선스·플랫폼 표시는 도입 때 확인한다.

## Layout Principles

- **Radius:** 입력·버튼 12px, 카드·사진 16px, 시트 상단 24px, 작은 상태 레이블 8px.
- **Border weight:** 입력 1px outline, 장식적 구분선 1px divider, 포커스 2px 및 바깥 간격 2px.
- **Spacing:** 4, 8, 12, 16, 24, 32, 40, 48px.

### Posture rules

- 좌우 여백은 기본 20, 좁은 화면 16. 항목 내부 8·12, 그룹 16, 섹션 24·32.
- 터치 영역 최소 48×48. 이는 모서리 반경이 아니다. 아이콘은 24, 보조 아이콘은 20.
- 한 화면의 주요 행동을 분명히 하고 검색·추가·저장 버튼이 장식에 묻히지 않게 한다.
- 현재 위치 경로를 이름과 가까이 배치하고 보관함·물건을 별도 섹션으로 구분한다.
- 안전 영역·키보드·뒤로 가기 영역과 하단 저장 버튼의 스크롤 여백을 확보한다.

## Component Stylings

| Component | Appearance | Required states |
| --- | --- | --- |
| Primary button | 코랄 오렌지 바탕·흰 레이블, radius 12, 높이 최소 48 | 기본·누름·포커스·진행·비활성; 진행 중 입력값과 레이블 유지 |
| Secondary button | 흰 바탕·진한 코랄 레이블·outline 경계 | 주요 버튼과 같은 입력 상태 |
| Destructive button | error 레이블 또는 error 바탕과 흰 레이블 | 대상·복구 불가 설명과 별도 확인, 기본 선택 금지 |
| Search input | 고정 의미 레이블·검색 아이콘·입력·지우기 | 초기·입력·검색 중·결과·없음·오류·캐시 범위 |
| Name / memo input | 필수·선택이 표시된 고정 레이블·도움말 | 포커스·오류·비활성; 오류를 필드에 연결 |
| Space card | 사진 또는 유형 아이콘·공간 이름, radius 16 | 사진 없음·로딩·오류·포커스 |
| Container / item row | 썸네일·유형·이름·전체 경로 | 긴 이름·동명 항목·사진 없음; 유형을 색만으로 구분 금지 |
| Location path | 눌러 이동하는 상위 위치·현재 위치 | 전체 경로 접근·자연스러운 포커스 순서 |
| Photo input | 사진·선택·촬영·변경 | 취소·권한 거부·전송 중·실패; 텍스트 저장과 별도 상태 |
| Selected location | primaryContainer 바탕·진한 코랄 아이콘/레이블·목적지 | 깊이·순환·소유권 오류의 이유 및 확정 전 목적지 확인 |
| Status notice | 흰 바탕·아이콘·문구·필요한 행동 | 성공·대기·정보·오류, 중요한 상태는 화면에 유지 |
| Confirmation / empty state | 짧은 맥락 안내·명확한 행동 | 삭제 확인은 복구 불가, 빈 상태는 추가·검색어 수정 등 해결 행동 |

## Depth & Elevation

기본 카드에는 그림자를 넣지 않는다. 여백·행 구분·얇은 외곽선으로 구조를 만든다. 시트와 팝업만 필요한 깊이를 사용하며 실제 바탕에서 scrim·대비를 확인한다. 사진 위에 중요 텍스트나 컨트롤을 직접 겹치지 않는다. 코랄 버튼에는 흰 내부 포커스선과 외부 코랄 선을 함께 사용한다.

## Voice & Tone

- **Adjectives:** 명료한, 차분한, 친근한, 실용적인
- **Tone:** 설명은 짧은 해요체. 버튼은 명확한 행동. 다음 행동과 실제 저장 상태를 정확히 전달한다.
- **Use:** 공간, 보관함, 물건, 저장, 계속 작성, 이 위치로 이동, 재시도
- **Avoid:** inventory, container, draft, AI 자동 정리, 혁신적인 경험, 한국인이라면 모두 좋아할 색

### Messaging pillars

- 물건을 기록하고 현재 위치를 쉽게 확인한다.
- 사진 없이도 이름과 위치로 사용할 수 있다.
- 실패했을 때 유지된 내용과 해결 행동을 알려준다.

## Imagery

- **Style:** 사용자 사진 중심, 일관된 선형 아이콘, 작은 평면 브랜드 그래픽.
- **Subjects:** 실제 물건, 공간, 보관함, 파우치, 위치 경로.
- **Treatment:** 사진 없는 항목은 유형 아이콘과 레이블. 목록 사진 56×56, 공간 사진 4:3, 상세 사진은 원본 비율을 보존한다. 브랜드 그림은 중립색 선과 작은 코랄 표식만 사용한다.
- **Avoid:** 가짜 사용자 사진, 마스코트 추가, 광택 3D 소품, 그라데이션, 네온, 과한 그림자, 파스텔 색 면, 공간별 무지개색.

## Motion

누름 120ms, 상태 180ms, 탐색·사진 연결 260ms, 시트 240ms는 검증할 시작값이다. 내용과 터치 경계를 불필요하게 이동시키지 않는다. 진입과 뒤로 가기의 방향을 유지하고 서버 저장 성공 전 완료 연출을 하지 않는다. OS 애니메이션 축소 요청에는 이동·확대를 줄이거나 제거하고 의미·포커스·결과를 유지한다. 큰 탄성·자동 반복·패럴랙스·전체 화면 블러는 사용하지 않는다.

## Product Flow & States

홈은 검색창·공간 카드·공간 추가를 중심으로 한다. 위치 상세는 전체 경로, 내부 보관함, 바로 속한 물건 순으로 구성한다. 물건 상세에서는 사진과 이름 다음에 현재 위치를 강조한다. 등록은 이름과 위치를 우선하며 사진은 선택 단서다. 검색 결과는 이름·사진·전체 위치 경로를 함께 보여준다. 이동은 현재 경로와 선택 목적지, 명시적 확정 버튼을 제공한다. 로그인·계정·임시 저장·삭제·오류에도 같은 토큰을 적용한다.

- 보관함은 공간 아래 최대 2단계. 이름 최대 50자, 메모 최대 1,000자. 사진 1장은 선택이다.
- 서버 텍스트 저장: `이름과 위치를 저장했어요`. 사진 전송 상태는 별도로 표시한다.
- 사진 선택 취소는 오류가 아니다. 권한 거부에는 허용 방법을 안내하고 사진 없이 입력을 계속할 수 있게 한다.
- 사진 자동 재시도 3회 실패: `사진을 보내지 못했어요. 다시 시도해 주세요`와 `재시도`. 이름·위치 유지, 재실행 후에도 수동 재시도 상태 유지.
- 계정당 임시 저장 하나. 서버 완료는 `임시 저장했어요`. 서버 실패·기기 보존은 `이 기기에 보관했어요. 연결되면 동기화해요`로 구분한다.
- 캐시 결과: `이 기기에 저장된 내용만 보여요`. 완전한 검색·서버 동기화 완료로 표현하지 않는다.
- 동시 수정 충돌: `다른 기기에서 내용이 바뀌었어요`, 행동 `최신 내용 확인`. 조용히 덮어쓰지 않는다.
- 비어 있지 않은 위치는 삭제 불가. 물건 삭제는 대상·복구 불가 설명과 `취소`·`삭제`를 제공한다. 실행 취소·휴지통을 만들지 않는다.
- 탈퇴는 비밀번호 재확인 후 삭제 시작. 서버 정리 완료 전 전체 성공으로 숨기지 않는다.
- 진행·빈 상태·실패와 재시도를 각 흐름에 포함하고 진행 전에 성공을 표시하지 않는다. 아직 미결정인 취소·중복 요청 상세 동작은 생성기가 임의 확정하지 않는다.

## Responsive Behavior & Accessibility

Android·iPhone 모바일 화면용이며 데스크톱 웹·iPad 화면을 생성하지 않는다. 360·390·430 너비를 검토 기준으로 삼되 내용을 고정 크기로 확대·축소하지 않는다. 글자 확대 때 공간 카드는 1열, 행·필드·버튼은 필요한 높이로 늘린다. 긴 경로는 여러 줄 및 전체 값 접근을 제공한다. 일반 텍스트 대비 4.5 이상, 의미 있는 경계·아이콘 3 이상, 색 외 의미 레이블, 키보드·VoiceOver·TalkBack의 포커스 순서를 검증한다. 정적 미리보기는 실기기 접근성·성능 검증을 대신하지 않는다.

## Agent Prompt Guide

이 파일의 색·서체·간격·컴포넌트를 사용해 Nestory의 한국어 모바일 UI kit를 구성한다. 순백색 바탕과 무채색 회색 영역 구분을 유지한다. 주요 행동과 선택 표시는 코랄 오렌지, 본문은 진한 회색, 작은 브랜드 표식도 같은 코랄 계열로 통일한다. 검정 주요 버튼이나 다른 보조 브랜드색을 추가하지 않는다. 사진·이름·현재 위치의 정보 위계를 우선한다. 필요한 화면과 예외 상태만 생성하고 실제 앱 문구는 한국어로 작성한다.

그린 계열, 블루·보라의 테크 브랜드 조합, 크림·베이지 배경, 파스텔 카드, 그라데이션, 광택 3D 소품, 모든 요소의 pill화, 장식용 영문 제목을 추가하지 않는다. 가족 공유·AI 인식·QR·가격·수량·대시보드·알림·복구·소셜 로그인 등 MVP 밖 기능을 추가하지 않는다. 화면은 제품 설계 검토용이며 실제 데이터·업로드·로그인 구현을 주장하지 않는다.

정책 원본은 [MVP 기획](docs/PRODUCT_PLAN.md), 색·수치 및 출처 원본은 [디자인 시스템](docs/DESIGN_SYSTEM.md), 연구는 [화면별 디자인 연구](docs/DESIGN_RESEARCH.md)다. 작업은 [Issue 3](https://github.com/YunFlutter/nestory/issues/3)과 연결한다. 이미지보다 문서의 토큰을 우선한다.
