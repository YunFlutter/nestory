# Nestory 디자인 시스템 이미지 프롬프트

[Issue 3](https://github.com/YunFlutter/nestory/issues/3)의 사용자 검토용 보드다. 원본 사양은 [디자인 시스템](../DESIGN_SYSTEM.md)이다. 사용자가 그린 계열과 AI스럽게 느껴지는 색 조합을 원하지 않아 블루·살구 제안을 웜화이트·차콜·소량의 브릭으로 수정했다.

## 최종 수정에 사용한 프롬프트

입력은 앞서 생성한 4:3 디자인 시스템 보드다. 아래 지시로 편집하며 레이아웃은 유지하고 색·그래픽을 교체한다. 이전 제안 이미지는 최종 결과에 포함하지 않는다. 재생성 시에는 아래 보드 내용과 문서의 토큰을 함께 사용한다.

```text
Edit the attached Nestory design-system board. Preserve its 4:3 landscape proportions, editorial grid, section positions, generous spacing, readable Korean labels, component content, and alignment. Replace the complete visual style with a quiet, mature editorial system: warm off-white, neutral charcoal, warm grey, with a single restrained muted brick accent. It is a Korean personal belongings and location app, not an AI product or tech startup landing page. Do not add features or device frames.

CRITICAL STYLE: every color surface must be SOLID and FLAT. No gradients at all, no glossy materials, no 3D render, no luminous edges, no shadows on swatches, no pastel candy palette, no blue or purple brand colors, no teal, mint, green, sage or olive. No texture that distorts token colors. Light warm paper-colored background, thin neutral rules, strong but restrained typography. Let the Korean text and functional component hierarchy provide the character. Brick is a tiny brand accent, not a colored primary button or a large decorative panel.

Replace ALL visual fills and printed hex labels with these exact roles:
Main page background #FAF9F6; surface #FFFFFF; subtle surface #F2EFE9; primary action and primary text #292724; secondary text #66615B; selected surface #EFECE6 and selected text/icon #292724; small brand accent #985343; input outline #878178; divider #E5E1DA; disabled background #ECE9E3 with disabled text #7B756D; success text/icon #292724 on #EFECE6; warning text/icon #765414 on #F6F0E3; error text/icon #A23C34 on #FAEEEB; information text/icon #565D65 on #F0F1F2. Primary button text is white #FFFFFF. If pressed-state needed use #151412. The brick accent is muted brownish red, never pastel pink or peach. It must not appear in the success, selected-location, spacing, or motion specimens.

HEADER: "Nestory" and "디자인 시스템 제안", metadata "한국어 모바일 · v0.1" and "사용자 검토용". Keep the short sentence "일상의 물건이 제자리를 찾도록" if it fits. Remove the glossy peach 3D pouch and blue location pin. Replace with a small simple FLAT charcoal outline drawing of a pouch, with a tiny brick zipper tab. No shading, no realistic material, no 3D, no location pin floating above it. Keep illustration small and secondary to the content.

SECTION 1 "컬러": top-row swatches with labels and printed hex outside: "주요 동작" #292724; "브랜드 표식" #985343; "기본 바탕" #FAF9F6; "보조 바탕" #F2EFE9; "본문" #292724; "설명" #66615B. Second row: "선택" #EFECE6; "입력 경계" #878178; "성공" #292724; "대기" #765414; "오류" #A23C34; "정보" #565D65. All swatches are flat, single colors. Printed hex must exactly match its label and stay clear/readable.

SECTION 2 "한글 타이포그래피": keep typeface label "Pretendard" and sample "물건의 위치를 쉽게 찾아요". Sample body "일상의 물건을 기록하고, 필요한 순간에 쉽게 찾아보세요." Labels "제목 24 / 34 · 700", "본문 16 / 24 · 400", "경로 14 / 22 · 400". Path "침실 › 옷장 › 여행용 파우치". This is an illustrative font rendering, not font installation. Charcoal main text, warm grey secondary text.

SECTION 3 "공통 컴포넌트": primary button "저장", charcoal fill and white label; secondary button "이 위치로 이동", white fill charcoal label and neutral outline; disabled "저장", warm neutral fill and muted dark label. Captions "주요 버튼", "보조 버튼", "비활성 버튼". Search field "이름이나 위치 검색" with magnifier and caption "검색 입력". Persistent field label "물건 이름", value "충전기", caption "텍스트 입력 (레이블 포함)". Selected row on #EFECE6 with charcoal line box icon and chevron, label "여행용 파우치", path "침실 › 옷장", caption "위치 선택 행". Buttons radius 12, cards 16, consistent thin line icons, sufficient tap spacing. No green or blue accent in selected state.

SECTION 4 "상태 안내": three rows, icons plus text, not just colors. Success: charcoal check and "이름과 위치를 저장했어요" on #EFECE6. Device-only preservation: muted amber waiting icon and "이 기기에 보관했어요" on #F6F0E3. Photo failure: red error icon and "사진을 보내지 못했어요", with separate "재시도" action, on #FAEEEB. No green success icon, no fake success for photo failure or device-only save.

SECTION 5 "간격과 형태": small neutral flat spacing specimens labeled "4 · 8 · 12 · 16 · 24 · 32 · 40 · 48", caption "간격 (px)". Under "형태와 터치 영역 (px)" show three simple neutral shape specimens labeled "입력·버튼 12", "카드 16", "터치 영역 48". Touch target is not a corner radius. No extra chart metrics. Keep all specimen fills warm neutral, not colored decoration.

SECTION 6 "모션 기준": three simple neutral flat sequence circles and thin neutral separators. Labels "누름 120ms", "상태 180ms", "탐색 260ms". Footer "애니메이션 축소 지원". No gradient circles, no glowing effects, no purple/blue/green tints.

BOTTOM FOOTER, exact: "버튼 대비 14.89:1 · 본문 대비 14.15:1" and "정확한 토큰과 상태 규칙은 문서 기준". These ratios describe source document token pairs, not generated-image pixel certification.

The result should read as a carefully typeset, practical design system review sheet. Maintain the layout, eliminate decorative color and synthetic glossy style, prioritize legible Korean. Do not add awards, certification badges, slogans, new metrics or product features.
```

## 검토 기준

모든 색 면이 단색인지, 그린·블루·보라 브랜드색과 광택 소품이 사라졌는지, 브릭이 작은 표식에만 쓰이는지 확인한다. 역할별 색 라벨·한국어 문구·버튼 상태·사진 실패 재시도·터치 영역의 의미를 원본 문서와 비교한다. 정확한 서체·hex·픽셀 대비는 이미지 생성 결과로 보장하지 않으며 구현은 원본 문서의 토큰을 따른다.
