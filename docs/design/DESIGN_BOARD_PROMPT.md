# Nestory 디자인 시스템 이미지 프롬프트

[Issue 3](https://github.com/YunFlutter/nestory/issues/3)의 사용자 검토용 보드다. 원본 사양은 [디자인 시스템](../DESIGN_SYSTEM.md)이다. 사용자가 검정 주요 버튼 대신 코랄 오렌지 계열을 선택했다. 흰색 바탕·무채색 회색 영역을 유지하고 버튼·선택 표시·브랜드 표식을 같은 코랄 계열로 교체한다.

## 최종 수정 프롬프트

입력은 앞서 생성한 흰 바탕·차콜 버튼의 4:3 디자인 시스템 보드다. 본문 색·레이아웃·제품 정책은 유지하고 브랜드 색과 대비 표기만 수정한다. 이전 색 제안과 수정 이력은 Git 이력에 남아 있으며 최종 파일에는 현재 입력을 보관한다.

```text
Edit the attached Nestory design-system board to apply the user's explicitly selected CORAL ORANGE brand color. Preserve the 4:3 landscape canvas, editorial grid, all section positions, readable Korean typography, component content, generous spacing and flat outline pouch. Keep the page and card surfaces PURE WHITE, not ivory, cream or beige. Keep supporting surfaces and spacing/motion specimens achromatic light grey. This is a brand-color update, not a redesign.

PRIMARY / BRAND: #C84B31, a clear saturated coral orange. This is the PRIMARY BUTTON fill, primary-action swatch, brand-mark swatch, focus indication and tiny pouch zipper accent. The solid "저장" button must be CORAL ORANGE, not black, brown, grey, blue or green. Its text stays white #FFFFFF. Both swatches labeled "주요 동작" and "브랜드 표식" must visually be #C84B31, and their printed hex labels must both read exactly #C84B31. Use a single brand family; no old muted brick #985343 or black brand swatch.

PRESSED / SELECTED / SUCCESS: #A83D27, a deeper shade of coral. The secondary "이 위치로 이동" button has WHITE fill with #A83D27 text and a neutral input outline. The selected-location row stays light grey #F4F4F4 with deeper-coral box icon, name and chevron; the supporting path stays #626262. Selected row name "여행용 파우치" and path "침실 › 옷장" remain. The success swatch label "성공" must use #A83D27 with printed hex #A83D27. The successful-save notice has WHITE background, a deeper-coral check icon and deeper-coral text "이름과 위치를 저장했어요". Never a black or green success check.

PRESERVE NEUTRALS: page and surfaces #FFFFFF; subtle surface #F5F5F5; main BODY TEXT #292724; secondary text #626262; selected surface #F4F4F4; input outline #888888; decorative dividers #E9E9E9; disabled background #EEEEEE and text #777777. The body-text swatch "본문" remains #292724. Do not recolor body text orange. The third top-row background swatch has labels "기본 바탕" and "순백색" — keep this Korean label and do not add a hex string under this one tile.

PRESERVE FUNCTIONAL COLORS: warning #765414, error #A23C34, information #565D65. Warning and error notice backgrounds stay WHITE with thin neutral borders. Keep the waiting icon and "이 기기에 보관했어요". Keep the error icon and "사진을 보내지 못했어요" with "재시도". Orange brand color does not replace destructive/error meaning. State meaning uses icons and wording, not just color.

PRESERVE CONTENT: "Nestory", "디자인 시스템 제안", "한국어 모바일 · v0.1", "사용자 검토용". Keep all type specimens, field labels, button names, spacing numbers and shape labels. Typography sample "물건의 위치를 쉽게 찾아요"; name field "물건 이름" with "충전기"; search "이름이나 위치 검색". Keep "형태와 터치 영역 (px)", "입력·버튼 12", "카드 16", "터치 영역 48". Keep motion labels "누름 120ms", "상태 180ms", "탐색 260ms" and "애니메이션 축소 지원".

UPDATE FOOTER EXACTLY: "버튼 대비 4.66:1 · 본문 대비 14.89:1". Keep "정확한 토큰과 상태 규칙은 문서 기준". These are source-token calculations, not generated-pixel accessibility certification.

All fills must be solid and flat. No gradients, glossy 3D, shadows on color tiles, green hues, blue/purple tech palette, multi-color pastel cards, beige background, extra features, device frames or badges. The result should look like a clean, practical Korean everyday-app design system with clearly colored coral-orange action buttons and readable dark neutral body text.
```

## 검토 기준

주요 버튼·브랜드 표식이 코랄이고 본문이 진한 회색인지 확인한다. 흰색 페이지·카드·상태 바탕과 무채색 선택 영역을 유지한다. 주요 동작·브랜드·성공 hex 라벨과 4.66:1 버튼 대비 표기를 문서와 비교한다. 기본 바탕은 이미지에서 `순백색`, 문서에서 #FFFFFF다. 정확한 픽셀색·서체는 생성 이미지로 보장하지 않으며 앱 구현과 OpenDesign 입력은 원본 토큰을 따른다.
