# NoticeList

공지사항 목록 컴포넌트

## 파일 위치

- 컴포넌트: [lib/widgets/notice_list/notice_list.dart](../../../lib/widgets/notice_list/notice_list.dart)
- 스타일: [lib/widgets/notice_list/notice_list_styles.dart](../../../lib/widgets/notice_list/notice_list_styles.dart)

## Import

```dart
import 'package:usw_circle_link/widgets/notice_list/notice_list.dart';
```

## 사용법

### 기본 사용
```dart
NoticeList(
  notices: noticeDataList,
  onItemTap: (notice) => _showNoticeDetail(notice),
)
```

### 로딩 상태와 함께
```dart
NoticeList(
  notices: notices,
  isLoading: isLoading,
  onItemTap: (notice) => _showNoticeDetail(notice),
  onRefresh: () => _refreshNotices(),
)
```

## 기능

- 공지사항 목록 표시
- 당겨서 새로고침
- 로딩 상태 표시
- 빈 상태 메시지

## 표시 정보

- 공지사항 제목
- 작성 날짜
- 중요 공지 뱃지

## Props

| 속성 | 타입 | 필수 | 설명 |
|------|------|------|------|
| notices | List<NoticeData> | O | 공지사항 목록 |
| onItemTap | Function(NoticeData) | O | 아이템 탭 콜백 |
| isLoading | bool | X | 로딩 상태 |
| onRefresh | Future<void> Function()? | X | 새로고침 콜백 |

## 관련 화면

- 공지사항 화면 (`/notices`)
