# Nestory Figma 디자인 시스템

기존 [Nestory 모바일 화면 디자인](https://www.figma.com/design/0TBem9Jmlvqyh9QOmEBAs6/Nestory?node-id=0-1)의 서체·크기를 Flutter와 디자인 시스템의 기준으로 사용한다. 사용자가 2026년 10월 7일 디자인을 확정하고 기존 Figma 기준을 선택했다. 흰색·무채색 회색·코랄 방향과 [MVP 정책](../PRODUCT_PLAN.md)은 유지한다. 작업은 [Issue 3](https://github.com/YunFlutter/nestory/issues/3), 앱 구현은 [Issue 5](https://github.com/YunFlutter/nestory/issues/5)와 연결한다.

## 기존 파일과 편집 위치

| 페이지 | 목적 |
| --- | --- |
| [01 · 화면 디자인](https://www.figma.com/design/0TBem9Jmlvqyh9QOmEBAs6/Nestory?node-id=0-1) | 화면과 탐색 흐름 |
| [02 · 상태와 다이얼로그](https://www.figma.com/design/0TBem9Jmlvqyh9QOmEBAs6/Nestory?node-id=4-2) | 진행·실패·충돌·확인 패턴 |
| [03 · 컴포넌트](https://www.figma.com/design/0TBem9Jmlvqyh9QOmEBAs6/Nestory?node-id=4-3) | 공통 컴포넌트와 디자인 시스템 안내 |

기존 3개 페이지와 컴포넌트 ID를 유지했다. `03 · 컴포넌트`에 [00 · Nestory 디자인 시스템 안내](https://www.figma.com/design/0TBem9Jmlvqyh9QOmEBAs6/Nestory?node-id=51-608)를 추가했다. 새 파일이나 중복 컬렉션을 만들지 않고 기존 변수·텍스트 스타일을 재사용했다.

## 한글 텍스트 스타일

서체는 **Noto Sans KR**이다. 다음 이름·크기·굵기는 기존 Figma의 로컬 텍스트 스타일에서, 줄 높이는 브라우저의 스타일 패널에서 확인했다. `Nestory Studio/`의 별도 전달용 스타일과 제품 UI 스타일을 섞지 않는다.

| Figma 스타일 | 문서 역할 | 크기 / 줄 높이 | 굵기 | 사용 |
| --- | --- | --- | --- | --- |
| `Nestory/Display` | display | 28 / 38 | 700 · Bold | 소개·큰 빈 상태 제목 |
| `Nestory/Title` | title | 22 / 32 | 700 · Bold | 화면 제목·물건 이름 |
| `Nestory/Section` | section | 18 / 27 | 700 · Bold | 보관함·물건 섹션 |
| `Nestory/Body` | body | 16 / 25 | 400 · Regular | 입력값·메모·본문 |
| `Nestory/Strong` | strong | 16 / 25 | 700 · Bold | 주요 행동·강조 행 이름 |
| `Nestory/Small` | bodySmall | 14 / 22 | 400 · Regular | 경로·필드 안내 |
| `Nestory/Caption` | caption | 12 / 18 | 400 · Regular | 부가 정보 |
| `Nestory/Label` | label | 14 / 21 | 700 · Bold | 짧은 레이블 |
| `Nestory/Micro` | micro | 11 / 16 | 500 · Medium | 제한적인 보조 표기 |

크기는 Flutter 논리 픽셀에 대응한다. Caption·Micro를 핵심 경로·오류·입력값·주요 행동에 사용하지 않는다. 긴 경로와 글자 확대에는 줄바꿈·필요한 높이를 제공한다. 2026년 10월 7일 구현 작업에서 제품용 9개 스타일의 자간도 모두 0px으로 확인했다. [Flutter 타이포그래피](../../lib/core/design/nestory_typography.dart)는 크기·줄 높이·굵기·자간을 그대로 연결한다. [폰트 원본·라이선스·번들](../../assets/fonts/README.md)을 추가했으며 실기기 검증은 미수행이다. 사용자 요청으로 Issue 5 종료 조건에서 제외한다.

## 변수 컬렉션과 색 역할

최초 읽기 시 파일에는 변수가 총 132개 있었다. 브라우저에서 기존 컬렉션에 primitive 4개와 semantic alias 26개를 추가해 현재 총 162개다. 제품 UI는 기존 `Nestory /` 컬렉션을 사용한다.

| 컬렉션 | 모드 | 최초 / 반영 후 개수 |
| --- | --- | --- |
| `Nestory / Primitives` | Value | 52 / 56 |
| `Nestory / Semantic` | Light | 58 / 84 |
| `Nestory Studio/Primitives` | Base | 15 / 15 |
| `Nestory Studio/Semantic` | Light | 7 / 7 |

[디자인 시스템](../DESIGN_SYSTEM.md)의 25개 색 역할을 모두 보존한다. 같은 raw 색은 primitive로 관리하고 semantic 역할에서 alias로 연결한다. `tertiary`는 별도 브랜드색을 추가하지 않는 `accent` 별칭이다. Figma 이름은 slash 그룹을 사용하고 문서·Flutter 역할과의 대응을 변수 설명에 남긴다.

| Primitive | 현재 값 | 연결한 Semantic 역할 (`role/` 그룹) |
| --- | --- | --- |
| `color/bg` | #FFFFFF | background |
| `color/surface` | #F5F5F5 | surfaceSubtle |
| `color/fg` | #292724 | textPrimary |
| `color/muted` | #626262 | textSecondary |
| `color/border` | #888888 | outline |
| `color/accent` | #C84B31 | primary·accent·focus·tertiary |
| `color/white` | #FFFFFF | surface·onPrimary·onAccent·successContainer·warningContainer·errorContainer·infoContainer |
| `color/pressed` | #A83D27 | primaryPressed·onPrimaryContainer |
| `color/divider` | #E9E9E9 | divider |
| `color/accent-soft` | #F4F4F4 | primaryContainer |
| `color/disabled` | #EEEEEE | disabledContainer |
| `color/success` | #A83D27 | success |
| `color/on-disabled` | #777777 | onDisabled |
| `color/warning` | #765414 | warning |
| `color/error` | #A23C34 | error |
| `color/info` | #565D65 | info |

확정 정책과 달랐던 `color/pressed` #AD412A, `color/divider` #E6E3E1, `color/accent-soft` #FBEFEB, `color/disabled` #DEDBD9, `color/success` #326C51을 위 현재 값으로 수정했다. 기존 변수 ID와 legacy alias는 유지했으므로 해당 변수를 사용하는 기존 화면·컴포넌트에도 새 값이 적용된다. `color/surface`는 보조 회색의 의미를 유지하고 흰색 `role/surface`를 별도로 연결했다. 기존 수치 변수와 Studio 컬렉션은 수정하지 않았다.

추가한 primitive 4개는 게시 숨김과 빈 scope를 적용했다. `role/`의 26개 alias에는 배경의 Frame·Shape, 본문의 Text·Shape, 경계의 Stroke 등 용도별 scope와 설명을 설정했다. 각 alias의 primitive 참조와 최종 hex를 브라우저에서 대조했다.

26개 alias의 Web code syntax는 `var(--nestory-역할의-kebab-case)`, Android·iOS는 Flutter 대응 이름 `NestoryColors.역할명`이다. 예를 들어 `role/textPrimary`는 `var(--nestory-text-primary)`와 `NestoryColors.textPrimary`다. 새 primitive의 Web syntax는 `var(--nestory-primitive-이름)`, Android·iOS는 `const Color(0xFFHEX)`다. 세 플랫폼 필드의 저장을 확인했고, 후속 구현에서 [NestoryColors](../../lib/core/design/nestory_colors.dart)에 같은 26개 역할을 추가했다. Code Connect 연결은 구현하지 않았다.

## 간격과 형태 기준

| 항목 | 값 |
| --- | --- |
| 공통 간격 | 4, 8, 12, 16, 24, 32, 40, 48 |
| 화면 좌우 여백 | 기본 20, 좁은 화면 16 |
| Radius | 상태 8, 입력·버튼 12, 카드·사진 16, 시트 상단 24 |
| 최소 터치 영역 | 48 × 48 |
| 아이콘 | 기본 24, 보조 20 |
| 목록 썸네일 | 56 × 56 |
| 공간 사진 | 4:3 |
| 상세 사진 | 원본 비율 유지 |

이 표는 확정 문서의 기준이다. 구현 작업에서 Semantic의 typography·space·radius·size·border/width 그룹을 대조했다. 기존 `size/button` 52와 `size/input` 56은 최소 높이, `size/icon` 24와 `border/width/default` 1은 크기 토큰에 반영했다. 기존 `size/touch-target` 44는 확정 기준 48과 달라 코드에서는 48을 사용한다. 기존 변수와 컴포넌트는 이번 읽기 작업에서 수정하지 않았다. 확인한 그룹이 모든 화면의 Auto Layout·고정 높이·터치 영역 검증 완료를 의미하지 않는다.

공통 컴포넌트는 Auto Layout과 gap·padding·radius 변수로 구성한다. 텍스트는 Hug, 가용 폭을 채우는 컨트롤은 Fill을 사용하고 입력·긴 경로는 높이 확장을 허용한다.

## 공통 컴포넌트 계약

아래는 기존 컴포넌트를 확인·보완할 때의 이름과 속성 계약이다. 이미 있는 컴포넌트는 이름·ID·인스턴스 연결을 우선 보존한다. 각 행의 모든 Variant가 현재 파일에 존재한다고 주장하지 않는다.

| 컴포넌트 | Variant 축 | 편집 가능한 Property·필수 표현 |
| --- | --- | --- |
| 주요 버튼 | State: Default·Pressed·Focused·Loading·Disabled | Label, 선택 Icon, Show icon; 진행 문구·중복 활성화 방지 |
| 보조 버튼 | 주요 버튼과 같은 State | Label, 선택 Icon; 흰 바탕·코랄 문구·outline 경계 |
| 삭제 버튼 | State: Default·Focused·Loading·Disabled | Label; 삭제·탈퇴를 명시하고 별도 확인과 연결 |
| 검색창 | State: Empty·Filled·Loading·Results·No results·Error·Cached | Label, Query, Show clear; 지우기 레이블·캐시 안내 |
| 이름·메모 입력 | Kind: Name·Memo / State: Default·Focused·Error·Disabled | Label, Value, Helper, Required; 오류와 글자 수 안내 |
| 공간 카드 | State: Default·No photo·Loading·Error·Focused | Name, Photo, Show photo; 사진 없는 유형 레이블 |
| 보관함·물건 행 | Kind: Container·Item / State: Default·No photo·Loading·Error·Focused | Name, Path, Photo; 긴 경로·동명 항목 구분 |
| 위치 경로 | 현재 위치와 상위 위치 구분 | Path; 전체 값 접근·상위 위치의 터치 영역 |
| 사진 입력 | State: Empty·Selected·Permission·Uploading·Failed | Photo, Message, Action; 선택 취소는 이전 상태 유지 |
| 상태 안내 | Kind: Success·Waiting·Info·Error·Conflict | Message, Action, Show action; 의미 아이콘·해결 행동 |
| 위치 선택 | State: Current·Available·Selected·Invalid | Name, Path, Reason; 깊이·순환·소유권 오류 |
| 확인 창 | Kind: Item delete·Location delete·Account delete | Target, Message, Cancel label, Confirm label; 복구 불가 안내 |
| 빈 상태 | Kind: Home·Location·Search | Title, Message, Action; 공간 추가·내용물 추가·검색어 수정 |

텍스트는 TEXT Property, 표시 여부는 BOOLEAN, 아이콘 교체는 INSTANCE_SWAP으로 노출한다. icon별 Variant를 만들지 않는다. 한 세트가 30개 조합을 넘으면 관련 가족을 나누고 불필요한 상태 조합을 생성하지 않는다. 주요 상태의 배경·텍스트·경계와 간격·radius를 변수에 연결한다.

마스터 컴포넌트와 검토 예시를 구분한다. 상태별 검토 보드에는 연결된 인스턴스를 사용하고, 분리한 복제본으로 상태를 표현하지 않는다. 같은 텍스트 역할에는 같은 Text Style을 적용한다. hover·새 탭·새 메뉴·새 정책을 모바일 디자인 시스템 정리만으로 추가하지 않는다.

## 제품 상태와 검증

저장·사진 전송·기기 임시 보존·서버 동기화·충돌·삭제 문구는 [원본 상태 표](../DESIGN_SYSTEM.md#상태와-한국어-문구)를 따른다. 특히 사진 실패 후 이름·위치 유지, 3회 자동 재시도 후 수동 상태 유지, 계정당 임시 저장 하나, 캐시 조회 범위 표시, 복구 없는 삭제를 보존한다.

- 변수의 raw 값·alias·scope, 25개 색 역할과 9개 텍스트 스타일을 확인한다.
- 각 컴포넌트의 Variant·Property·변수 바인딩·텍스트 스타일 연결을 확인한다.
- 검토 인스턴스를 정상 배율로 보고 텍스트 잘림·낮은 대비·빈 내용·Variant 겹침을 수정한다.
- 360·390·430 너비, 글자 확대, 긴 경로·이름, 사진 없음, 진행·오류·재시도를 확인한다.
- 실제 앱의 TalkBack·VoiceOver·플랫폼 권한·성능 검증은 구현 후 수행한다.

## 확인 범위

2026년 10월 7일 Figma 도구로 초기 구조를 읽고, 로그인된 Chrome의 브라우저 조작으로 위 변경을 저장했다. 컴포넌트 페이지의 기존 Button 세트와 아이콘·입력·행·상태 안내를 확인했고 제품용 9개 스타일의 줄 높이도 확인했다.

- 추가한 primitive 4개와 semantic alias 26개의 값·참조·scope·설명·세 플랫폼 code syntax를 확인했다. 최종 컬렉션 개수는 56·84·15·7이다.
- 안내 프레임 `51:608`은 세로 Auto Layout, 폭 960, 높이 Hug 1867, gap 24, padding 40이다. 안내용 배치 수치는 고정값이며 제품의 수치 변수 바인딩 완료를 의미하지 않는다.
- 안내 제목과 본문은 기존 `Nestory/Display`·`Nestory/Body` 스타일과 `role/textPrimary`, 바탕은 `role/surface`에 연결했다. 본문은 자동 높이이며 전체 안내가 잘림·겹침 없이 표시되는지 캡처로 확인했다.
- 13종의 역할·상태·속성을 문서와 안내 프레임에 기록했다. 기존 모든 컴포넌트의 Variant·자간·바인딩 및 360·390·430 화면 적용 검증은 완료 범위에 포함하지 않는다.

문서의 토큰·YAML·내부 링크·대비 계산·diff를 검증했다. 후속 [공통 기반 PR 7](https://github.com/YunFlutter/nestory/pull/7)에서 Flutter 토큰·폰트·테마를 구현한다. 공통 Widget·제품 화면·실기기 접근성은 [Issue 5](https://github.com/YunFlutter/nestory/issues/5)의 후속 범위다.
