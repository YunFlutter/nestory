# Noto Sans KR

Nestory의 Figma 서체를 오프라인에서도 같은 파일로 표시하기 위한 앱 자산이다. 추가 폰트 패키지나 실행 중 다운로드를 사용하지 않는다.

| 항목 | 값 |
| --- | --- |
| 배포 원본 | [Google Fonts / Noto Sans KR](https://github.com/google/fonts/tree/b38c5c93af322c45f633e17ac440ec1e6c94d489/ofl/notosanskr) |
| 고정 커밋 | `b38c5c93af322c45f633e17ac440ec1e6c94d489` |
| 원본 파일 | `NotoSansKR[wght].ttf` |
| 앱 파일 | [NotoSansKR-Variable.ttf](NotoSansKR-Variable.ttf), 이름만 바꾸고 바이너리 수정 없음 |
| 버전 | `2.004-H2` |
| 크기 | 10,414,588 bytes (약 9.93 MiB, 압축 전) |
| 폰트 SHA-256 | `194018e6b2b293a7964f037b25c0249ce1418bc9ab3c971060a03aa57861e252` |
| 번들 OFL SHA-256 | `babcfe66c8a098b2fa279bc724a3a342f8124f77ce18941fbcc1bbb39823cded` |
| 가변 축 | `wght` 100–900, 앱 사용 굵기는 400·500·700 |
| 한글 | Unicode cmap에서 현대 한글 완성형 U+AC00–U+D7A3, 11,172자 매핑 확인 |
| 라이선스 | [SIL Open Font License 1.1 전체 원문](OFL.txt); Copyright 2014–2021 Adobe, Reserved Font Name `Source` |

같은 가변 폰트를 `pubspec.yaml`의 400·500·700 항목에 연결하며 파일을 세 벌 만들지 않는다. [Flutter 3.41부터 FontWeight가 가변 폰트의 wght 축에도 적용된다](https://docs.flutter.dev/release/breaking-changes/font-weight-variation). 이 저장소의 검증 환경은 Flutter 3.47.5다. [Flutter 폰트 등록 방식](https://docs.flutter.dev/cookbook/design/fonts)을 따른다.

`OFL.txt`도 앱 자산에 포함하고 앱 시작 시 `LicenseRegistry`에 `Noto Sans KR` 이름으로 등록한다. 향후 라이선스 화면에서 Flutter의 `showLicensePage` 등을 사용하면 고지를 읽을 수 있다. 이번 작업에서 계정 화면이나 라이선스 메뉴를 만들지는 않는다.

라이선스 고지는 원문의 줄 끝 공백 한 개만 정리했다. 원본 OFL의 SHA-256은 `1c05c68c34f9708415aada51f17e1b0092d2cea709bf4a94cd38114f9e73d7d9`이며 저작권·조건·본문은 모두 유지한다. 폰트 바이너리는 수정하지 않는다.

원본 재취득 명령은 저장소 루트에서 실행한다. 업데이트 시 버전·출처·해시·glyph/굵기·라이선스와 앱 크기 영향을 다시 검토한다.

```sh
curl --fail --location 'https://raw.githubusercontent.com/google/fonts/b38c5c93af322c45f633e17ac440ec1e6c94d489/ofl/notosanskr/NotoSansKR%5Bwght%5D.ttf' --output assets/fonts/NotoSansKR-Variable.ttf
curl --fail --location 'https://raw.githubusercontent.com/google/fonts/b38c5c93af322c45f633e17ac440ec1e6c94d489/ofl/notosanskr/OFL.txt' --output assets/fonts/OFL.txt
python3 - <<'PY'
from pathlib import Path
p = Path('assets/fonts/OFL.txt')
p.write_text('\n'.join(line.rstrip(' \t') for line in p.read_text().split('\n')))
PY
shasum -a 256 assets/fonts/NotoSansKR-Variable.ttf assets/fonts/OFL.txt
```
