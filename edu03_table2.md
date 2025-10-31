# HTML 표(Table)의 핵심: tr, td, 그리고 셀 병합

HTML에서 표는 데이터를 행과 열의 그리드 형태로 표현하는 강력한 방법입니다. 표를 구성하는 가장 기본적인 요소는 `<tr>`과 `<td>`이며, 셀 병합을 통해 더 복잡하고 가독성 좋은 구조를 만들 수 있습니다.

## 1. `<tr>`과 `<td>`의 차이와 역할

간단히 비유하자면, `<table>`은 전체 표를, `<tr>`은 가로 한 줄을, `<td>`는 그 줄 안의 각 칸을 의미합니다.

### `<tr>` (Table Row)
- **의미**: 'Table Row'의 약자로, 표의 **가로 한 행**을 정의합니다.
- **역할**: `<td>`나 `<th>`(테이블 제목 셀) 태그들을 담는 컨테이너 역할을 합니다. `<tr>` 태그 하나가 곧 한 줄입니다.

### `<td>` (Table Data)
- **의미**: 'Table Data'의 약자로, 표의 **데이터가 들어가는 개별 셀(칸)**을 정의합니다.
- **역할**: 실제 내용(텍스트, 이미지, 링크 등)이 표시되는 부분입니다. 반드시 `<tr>` 태그 내부에 위치해야 합니다.

### 기본 구조 예시
```html
<!-- 전체 표를 감싸는 table 태그 -->
<table>
  <!-- 첫 번째 줄 시작 -->
  <tr> 
    <td>1행 1열</td>
    <td>1행 2열</td>
  </tr> <!-- 첫 번째 줄 끝 -->

  <!-- 두 번째 줄 시작 -->
  <tr> 
    <td>2행 1열</td>
    <td>2행 2열</td>
  </tr> <!-- 두 번째 줄 끝 -->
</table>
```
**핵심**: `<tr>`은 행(줄)을 만들고, 그 안에 `<td>`로 칸을 채워나가는 구조입니다.

---

## 2. 셀 병합: `colspan`과 `rowspan`

표를 만들다 보면 여러 칸을 하나로 합쳐야 할 때가 있습니다. 이때 `colspan`과 `rowspan` 속성을 사용합니다. 이 속성들은 `<td>`나 `<th>` 태그 안에서 사용됩니다.

### `colspan` (Column Span - 열 병합)
- **역할**: 셀을 **가로로** 병합합니다. 즉, 현재 셀이 지정된 숫자만큼의 열(column)을 차지하게 합니다.
- **사용법**: `<td colspan="병합할 칸의 개수">` 형태로 사용합니다.

#### `colspan` 예시
```html
<style>
    table, th, td { border: 1px solid black; border-collapse: collapse; padding: 5px; text-align: center; }
</style>
<table>
  <tr>
    <th colspan="2">이름과 나이</th> <!-- 2개의 열을 병합 -->
  </tr>
  <tr>
    <td>김제미</td>
    <td>30</td>
  </tr>
</table>
```
*위 예시에서 첫 번째 줄의 `<th>`는 `colspan="2"`를 통해 두 개의 열 너비를 차지합니다. 그래서 그 아래 줄에는 `<td>`가 2개 필요합니다.*

### `rowspan` (Row Span - 행 병합)
- **역할**: 셀을 **세로로** 병합합니다. 즉, 현재 셀이 지정된 숫자만큼의 행(row)을 차지하게 합니다.
- **사용법**: `<td rowspan="병합할 칸의 개수">` 형태로 사용합니다.

#### `rowspan` 예시
```html
<style>
    table, th, td { border: 1px solid black; border-collapse: collapse; padding: 5px; text-align: center; }
</style>
<table>
  <tr>
    <th rowspan="2">구분</th> <!-- 2개의 행을 병합 -->
    <td>항목 1</td>
  </tr>
  <tr>
    <!-- 
      '구분' 셀이 이미 첫 번째 칸을 차지하고 있으므로,
      두 번째 줄에는 하나의 <td>만 필요합니다. 
    -->
    <td>항목 2</td>
  </tr>
</table>
```
*위 예시에서 '구분' `<th>`는 `rowspan="2"`를 통해 두 개의 행 높이를 차지합니다.*

---

## 3. 종합 예제

`tr`, `td`, `colspan`, `rowspan`을 모두 사용한 시간표 예제입니다.

```html
<style>
    table, th, td { border: 1px solid black; border-collapse: collapse; padding: 5px; text-align: center; }
</style>
<h2>종합 시간표 예제</h2>
<table>
  <thead>
    <tr>
      <th>시간</th>
      <th>월요일</th>
      <th>화요일</th>
      <th>수요일</th>
      <th>목요일</th>
      <th>금요일</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1교시<br>(09:00-09:50)</th>
      <td>국어</td>
      <td rowspan="2">수학</td> <!-- 화요일 1, 2교시를 수학으로 병합 -->
      <td>영어</td>
      <td>과학</td>
      <td>사회</td>
    </tr>
    <tr>
      <th>2교시<br>(10:00-10:50)</th>
      <td>과학</td>
      <!-- 화요일 2교시 셀은 rowspan으로 인해 자리가 없으므로 생략 -->
      <td>사회</td>
      <td>국어</td>
      <td>영어</td>
    </tr>
    <tr>
      <th colspan="6">점심 시간 (12:00 - 13:00)</th> <!-- 6개 열을 모두 병합 -->
    </tr>
    <tr>
        <th>오후수업<br>(13:00-14:50)</th>
        <td colspan="2">프로그래밍 기초</td> <!-- 월, 화 오후수업 병합 -->
        <td colspan="3">프로젝트 실습</td> <!-- 수, 목, 금 오후수업 병합 -->
    </tr>
  </tbody>
</table>
```
