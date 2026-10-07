# Nestory Figma 디자인 시스템

기존 [Nestory 모바일 화면 디자인](https://www.figma.com/design/0TBem9Jmlvqyh9QOmEBAs6/Nestory?node-id=0-1)의 서체·크기를 Flutter와 디자인 시스템의 기준으로 사용한다. 사용자가 2026년 10월 7일 디자인을 확정하고 기존 Figma 기준을 선택했다. 흰색·무채색 회색·코랄 방향과 [MVP 정책](../PRODUCT_PLAN.md)은 유지한다. 작업은 [Issue 3](https://github.com/YunFlutter/nestory/issues/3), 앱 구현은 [Issue 5](https://github.com/YunFlutter/nestory/issues/5)와 연결한다.

## 기존 파일과 편집 위치

| 페이지 | 목적 |
| --- | --- |
| [01 · 화면 디자인](https://www.figma.com/design/0TBem9Jmlvqyh9QOmEBAs6/Nestory?node-id=0-1) | 화면과 탐색 흐름 |
| [02 · 상태와 다이얼로그](https://www.figma.com/design/0TBem9Jmlvqyh9QOmEBAs6/Nestory?node-id=4-2) | 진행·실패·충돌·확인 패턴 |
| [03 · 컴포넌트](https://www.figma.com/design/0TBem9Jmlvqyh9QOmEBAs6/Nestory?node-id=4-3) | 공통 컴포넌트와 디자인 시스템 안내 |

기존 페이지와 화면을 보존한다. 새 파일·중복 컬렉션을 만들기 전에 기존 자산을 확인한다. 구조 변경에는 기존 인스턴스·변수·텍스트 스타일 연결을 유지하며 변경한 값의 영향을 확인한다.

## 한글 텍스트 스타일

서체는 **Noto Sans KR**이다. 다음 이름·크기·굵기는 기존 Figma의 로컬 텍스트 스타일에서 확인했다. `Nestory Studio/`의 별도 전달용 스타일과 제품 UI 스타일을 섞지 않는다.

| Figma 스타일 | 문서 역할 | 크기 | 굵기 | 사용 |
| --- | --- | --- | --- | --- |
| `Nestory/Display` | display | 28 | 700 · Bold | 소개·큰 빈 상태 제목 |
| `Nestory/Title` | title | 22 | 700 · Bold | 화면 제목·물건 이름 |
| `Nestory/Section` | section | 18 | 700 · Bold | 보관함·물건 섹션 |
| `Nestory/Body` | body | 16 | 400 · Regular | 입력값·메모·본문 |
| `Nestory/Strong` | strong | 16 | 700 · Bold | 주요 행동·강조 행 이름 |
| `Nestory/Small` | bodySmall | 14 | 400 · Regular | 경로·필드 안내 |
| `Nestory/Caption` | caption | 12 | 400 · Regular | 부가 정보 |
| `Nestory/Label` | label | 14 | 700 · Bold | 짧은 레이블 |
| `Nestory/Micro` | micro | 11 | 500 · Medium | 제한적인 보조 표기 |

크기는 Flutter 논리 픽셀에 대응한다. Caption·Micro를 핵심 경로·오류·입력값·주요 행동에 사용하지 않는다. 긴 경로와 글자 확대에는 줄바꿈·필요한 높이를 제공한다. Figma의 줄 높이·자간은 추가 확인 항목이며 위 크기·굵기만으로 기존 값을 추정하지 않는다. 앱 번들에 넣을 폰트 파일·라이선스 고지와 실제 Android·iPhone 표시는 구현 Issue에서 검증한다.

## 변수 컬렉션과 색 역할

기존 파일에는 `Nestory / Primitives` 52개, `Nestory / Semantic` 58개, `Nestory Studio/Primitives` 15개, `Nestory Studio/Semantic` 7개 변수가 있다. 각각 Value·Light·Base·Light 모드를 사용한다. 제품 UI는 기존 `Nestory /` 컬렉션을 우선 재사용한다.

[디자인 시스템](../DESIGN_SYSTEM.md)의 25개 색 역할을 모두 보존한다. 같은 raw 색은 primitive로 관리하고 semantic 역할에서 alias로 연결한다. `tertiary`는 별도 브랜드색을 추가하지 않는 `accent` 별칭이다. Figma 이름은 slash 그룹을 사용하고 문서·Flutter 역할과의 대응을 변수 설명에 남긴다.

| 확인된 Figma 변수 | 값 | 대응과 처리 |
| --- | --- | --- |
| `color/bg` | #FFFFFF | background |
| `color/surface` | #F5F5F5 | surfaceSubtle에 대응. 문서의 흰색 surface와 구분 |
| `color/fg` | #292724 | textPrimary |
| `color/muted` | #626262 | textSecondary |
| `color/border` | #888888 | outline |
| `color/accent` | #C84B31 | primary·accent·focus |
| `color/white` | #FFFFFF | onPrimary·onAccent·흰색 surface |
| `color/pressed` | #AD412A | 확정 primaryPressed #A83D27과 차이 있음 |
| `color/divider` | #E6E3E1 | 확정 divider #E9E9E9와 차이 있음 |
| `color/accent-soft` | #FBEFEB | 확정 선택 바탕 #F4F4F4와 차이 있음 |
| `color/disabled` | #DEDBD9 | 확정 disabledContainer #EEEEEE와 차이 있음 |
| `color/success` | #326C51 | 기존 값은 그린. 확정 success는 #A83D27 |

확인된 차이를 현재 정책으로 승인한 것으로 해석하지 않는다. 변경 전에 사용처를 확인하고 필요한 역할을 정확히 구분한다. `color/surface`를 일괄 흰색으로 바꾸면 사진 없음·보조 입력 영역도 바뀔 수 있으므로 기존 ID의 의미를 보존하고 흰색 surface 역할을 별도로 연결한다. 위에 없는 색·간격·형태 변수는 미확인이다.

변수에는 적용 속성에 맞는 scope를 지정한다. 색은 배경·텍스트·경계 용도, 간격은 gap·padding, radius는 corner radius로 제한한다. primitive는 picker에 불필요하게 노출하지 않는다. 코드 문법은 실제 구현 이름에 맞춰 기록하며 아직 존재하지 않는 Flutter 클래스나 Code Connect 연결을 구현 완료로 표시하지 않는다.

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

이 표는 확정 문서의 기준이다. Figma의 기존 모든 수치와 대조 완료를 의미하지 않는다. 공통 컴포넌트는 Auto Layout과 gap·padding·radius 변수로 구성한다. 텍스트는 Hug, 가용 폭을 채우는 컨트롤은 Fill을 사용하고 입력·긴 경로는 높이 확장을 허용한다.

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

2026년 10월 7일 Figma 도구로 페이지 3개, 변수 총 132개, 텍스트 스타일 14개 및 제품용 `Nestory/` 스타일 9개를 읽었다. 첫 화면 페이지에서는 Component 6개, Component Set 0개를 확인했다. 다른 페이지의 전체 컴포넌트·줄 높이·자간·모든 변수와 바인딩은 추가 확인 대상이다. 이 읽기 결과만으로 시스템 구축 완료를 선언하지 않는다.
