# USW Circle Link Server API 문서

## 개요

- **제목**: USW Circle Link Server API
- **버전**: v1
- **서버**:
  - 프로덕션: `https://api.donggurami.net`
  - 개발: `http://localhost:8080`

## 인증

모든 API 요청은 Bearer 토큰 인증을 사용합니다.

```
Authorization: Bearer {token}
```

---

## API 엔드포인트

### 인증 (Auth)

#### 로그인
- **POST** `/auth/login`
- **설명**: 사용자 로그인
- **요청 본문**: `UnifiedLoginRequest`
  - `account` (string, required): 계정 ID (5-20자, 영문/숫자)
  - `password` (string, required): 비밀번호 (8-20자, 영문/숫자/특수문자 포함)
  - `fcmToken` (string, optional): FCM 토큰
  - `clientId` (string, optional): 클라이언트 ID
- **응답**: `ApiResponseUnifiedLoginResponse`
  - `accessToken`, `refreshToken`, `role`, `clubuuid`, `isAgreedTerms`

#### 로그아웃
- **POST** `/auth/logout`
- **설명**: 사용자 로그아웃
- **응답**: `ApiResponseVoid`

#### 토큰 갱신
- **POST** `/auth/refresh`
- **설명**: 액세스 토큰 갱신
- **응답**: `ApiResponseTokenDto`
  - `accessToken`, `refreshToken`

#### 회원가입

##### 1. 이메일 인증 요청
- **POST** `/auth/signup/verification-mail`
- **설명**: 임시 사용자 등록 및 이메일 인증 코드 발송
- **요청 본문**: `EmailDTO`
  - `email` (string, required): 이메일 주소
- **응답**: `ApiResponseVerifyEmailResponse`
  - `emailToken_uuid`, `email`

##### 2. 이메일 인증 확인
- **POST** `/auth/signup/verify`
- **설명**: 이메일 인증 코드 확인
- **요청 본문**: `EmailDTO`
  - `email` (string, required): 이메일 주소
- **응답**: `ApiResponseSignUpuuidResponse`
  - `emailTokenUUID`, `signupUUID`

##### 3. 회원가입 완료
- **POST** `/auth/signup`
- **설명**: 회원가입 완료
- **헤더**:
  - `emailTokenUUID` (UUID, required)
  - `signupUUID` (UUID, required)
- **요청 본문**: `SignUpRequest`
  - `account` (string, required): 계정 ID (5-20자, 영문/숫자)
  - `password` (string, required): 비밀번호 (8-20자)
  - `confirmPassword` (string, required): 비밀번호 확인
  - `userName` (string, required): 이름 (2-30자, 영문/한글)
  - `telephone` (string, required): 전화번호 (11자, 01로 시작)
  - `studentNumber` (string, required): 학번 (8자, 숫자)
  - `major` (string, required): 전공 (1-20자, 한글/영문)
- **응답**: `ApiResponseVoid`

#### 비밀번호 찾기

##### 1. 인증 코드 발송
- **POST** `/auth/password/reset-code`
- **설명**: 비밀번호 재설정 인증 코드 발송
- **요청 본문**: `UserInfoDto`
  - `userAccount` (string, required): 사용자 계정
  - `email` (string, required): 이메일
- **응답**: `ApiResponseUUID`
  - `data`: UUID

##### 2. 인증 코드 확인
- **POST** `/auth/password/verify`
- **설명**: 인증 코드 확인
- **헤더**: `uuid` (UUID, required)
- **요청 본문**: `AuthCodeRequest`
  - `authCode` (string, required): 인증 코드
- **응답**: `ApiResponseString`

##### 3. 비밀번호 재설정
- **PATCH** `/auth/password/reset`
- **설명**: 비밀번호 재설정
- **헤더**: `uuid` (UUID, required)
- **요청 본문**: `PasswordRequest`
  - `password` (string, required): 새 비밀번호 (8-20자)
  - `confirmPassword` (string, required): 비밀번호 확인
- **응답**: `ApiResponseString`

#### 계정 찾기
- **POST** `/auth/find-id`
- **설명**: 계정 ID 찾기
- **요청 본문**: `EmailDTO`
  - `email` (string, required): 이메일 주소
- **응답**: `ApiResponseString`

#### 계정 중복 확인
- **GET** `/auth/check-Id`
- **설명**: 계정 ID 중복 확인
- **쿼리 파라미터**: `Id` (string, required)
- **응답**: `ApiResponseString`

#### 회원 탈퇴 코드 발송
- **POST** `/auth/withdrawal/code`
- **설명**: 회원 탈퇴 인증 코드 발송
- **응답**: `ApiResponseString`

---

### 사용자 (User)

#### 내 프로필 조회
- **GET** `/users/me`
- **설명**: 현재 사용자 프로필 조회
- **응답**: `ApiResponseProfileResponse`
  - `userName`, `studentNumber`, `userHp`, `major`, `fcmToken`

#### 프로필 수정
- **PATCH** `/users/me`
- **설명**: 사용자 프로필 수정
- **요청 본문**: `ProfileRequest`
  - `userPw` (string, required): 현재 비밀번호
  - `userName` (string, required): 이름 (2-30자)
  - `studentNumber` (string, required): 학번 (8자)
  - `userHp` (string, required): 전화번호 (11자)
  - `major` (string, required): 전공 (1-20자)
- **응답**: `ApiResponseProfileResponse`

#### 비밀번호 변경
- **PATCH** `/users/me/password`
- **설명**: 사용자 비밀번호 변경
- **요청 본문**: `UpdatePwRequest`
  - `userPw` (string, required): 현재 비밀번호
  - `newPw` (string, required): 새 비밀번호 (8-20자)
  - `confirmNewPw` (string, required): 새 비밀번호 확인
- **응답**: `ApiResponseString`

#### 회원 탈퇴
- **DELETE** `/users/me`
- **설명**: 회원 탈퇴
- **요청 본문**: `AuthCodeRequest`
  - `authCode` (string, required): 인증 코드
- **응답**: `ApiResponseString`

#### 내 동아리 목록 조회
- **GET** `/users/me/clubs`
- **설명**: 사용자가 가입한 동아리 목록 조회
- **응답**: `ApiResponseListMyClubResponse`
  - `clubUUID`, `mainPhotoPath`, `clubName`, `leaderName`, `leaderHp`, `clubInsta`, `clubRoomNumber`

#### 내 지원 목록 조회
- **GET** `/users/me/applications`
- **설명**: 사용자가 지원한 동아리 목록 조회
- **응답**: `ApiResponseListMyAplictResponse`
  - `clubUUID`, `mainPhotoPath`, `clubName`, `leaderName`, `leaderHp`, `clubInsta`, `aplictStatus`, `clubRoomNumber`

---

### 프로필 (Profiles)

#### 프로필 중복 확인
- **POST** `/profiles/duplication-check`
- **설명**: 프로필 정보 중복 확인
- **요청 본문**: `ProfileDuplicationCheckRequest`
  - `userName` (string, required): 이름 (2-30자)
  - `studentNumber` (string, required): 학번 (8자)
  - `userHp` (string, required): 전화번호 (11자)
  - `clubUUID` (UUID, optional): 동아리 UUID
- **응답**: `ApiResponseProfileDuplicationCheckResponse`
  - `exists`, `classification`, `inTargetClub`, `clubuuids`, `targetClubuuid`, `profileId`

#### 내 프로필 조회
- **GET** `/profiles/me`
- **설명**: 현재 사용자 프로필 조회
- **응답**: `ApiResponseProfileResponse`

#### 프로필 변경
- **PATCH** `/profiles/change`
- **설명**: 프로필 정보 변경
- **요청 본문**: `ProfileRequest`
  - `userPw` (string, required): 현재 비밀번호
  - `userName` (string, required): 이름
  - `studentNumber` (string, required): 학번
  - `userHp` (string, required): 전화번호
  - `major` (string, required): 전공
- **응답**: `ApiResponseProfileResponse`

---

### 동아리 (Clubs)

#### 전체 동아리 목록 조회
- **GET** `/clubs`
- **설명**: 모든 동아리 목록 조회
- **응답**: `ApiResponseListClubListResponse`
  - `clubUUID`, `clubName`, `mainPhotoUrl`, `department`, `hashtags`

#### 모집 중인 동아리 목록 조회
- **GET** `/clubs/open`
- **설명**: 모집 중인 동아리 목록 조회
- **응답**: `ApiResponseListClubListResponse`

#### 카테고리별 동아리 목록 조회
- **GET** `/clubs/filter`
- **설명**: 카테고리별 동아리 목록 조회
- **쿼리 파라미터**: `clubCategoryUUIDs` (array[UUID], optional)
- **응답**: `ApiResponseListClubListByClubCategoryResponse`

#### 모집 중인 동아리 카테고리 필터 조회
- **GET** `/clubs/open/filter`
- **설명**: 모집 중인 동아리를 카테고리별로 조회
- **쿼리 파라미터**: `clubCategoryUUIDs` (array[UUID], optional)
- **응답**: `ApiResponseListClubListByClubCategoryResponse`

#### 동아리 정보 조회
- **GET** `/clubs/{clubUUID}/info`
- **설명**: 동아리 기본 정보 조회
- **경로 파라미터**: `clubUUID` (UUID, required)
- **응답**: `ApiResponseClubInfoResponse`
  - `mainPhotoUrl`, `clubName`, `leaderName`, `leaderHp`, `clubInsta`, `clubRoomNumber`, `clubHashtag`, `clubCategoryName`, `department`

#### 동아리 소개 조회
- **GET** `/clubs/{clubUUID}`
- **설명**: 동아리 소개 정보 조회 (관리자용)
- **경로 파라미터**: `clubUUID` (UUID, required)
- **응답**: `ApiResponseAdminClubIntroResponse`
  - `clubUUID`, `mainPhoto`, `introPhotos`, `clubName`, `leaderName`, `leaderHp`, `clubInsta`, `clubIntro`, `recruitmentStatus`, `googleFormUrl`, `clubHashtags`, `clubCategoryNames`, `clubRoomNumber`, `clubRecruitment`

#### 동아리 정보 수정
- **PUT** `/clubs/{clubUUID}`
- **설명**: 동아리 정보 수정
- **경로 파라미터**: `clubUUID` (UUID, required)
- **요청 본문** (multipart/form-data):
  - `mainPhoto` (binary, optional): 대표 사진
  - `clubInfoRequest` (JSON, optional): `ClubInfoRequest`
    - `leaderName` (string, required): 회장 이름 (2-30자)
    - `leaderHp` (string, required): 회장 전화번호 (11자)
    - `clubInsta` (string, optional): 인스타그램 URL
    - `clubRoomNumber` (string, required): 동아리방 호수
    - `clubHashtag` (array[string], optional): 해시태그 목록
    - `clubCategoryName` (array[string], optional): 카테고리 이름 목록
  - `leaderUpdatePwRequest` (JSON, optional): `LeaderUpdatePwRequest`
    - `leaderPw` (string, required): 현재 비밀번호
    - `newPw` (string, required): 새 비밀번호 (8-20자)
    - `confirmNewPw` (string, required): 새 비밀번호 확인
- **응답**: `ApiResponseObject`

#### 동아리 삭제
- **DELETE** `/clubs/{clubUUID}`
- **설명**: 동아리 삭제
- **경로 파라미터**: `clubUUID` (UUID, required)
- **요청 본문**: `AdminPwRequest`
  - `adminPw` (string, required): 관리자 비밀번호
- **응답**: `ApiResponseLong`

#### 동아리 생성
- **POST** `/clubs`
- **설명**: 동아리 생성
- **요청 본문**: `AdminClubCreationRequest`
  - `leaderAccount` (string, required): 회장 계정 (5-20자, 영문/숫자)
  - `leaderPw` (string, required): 회장 비밀번호 (8-20자)
  - `leaderPwConfirm` (string, required): 비밀번호 확인
  - `clubName` (string, required): 동아리 이름 (1-10자)
  - `department` (enum, required): 분과 ("학술", "종교", "예술", "체육", "공연", "봉사")
  - `adminPw` (string, required): 관리자 비밀번호
  - `clubRoomNumber` (string, required): 동아리방 호수
- **응답**: `ApiResponseString`

#### 모집 상태 조회
- **GET** `/clubs/{clubUUID}/recruit-status`
- **설명**: 동아리 모집 상태 조회
- **경로 파라미터**: `clubUUID` (UUID, required)
- **응답**: `ApiResponseObject`

#### 모집 상태 변경
- **PATCH** `/clubs/{clubUUID}/recruit-status`
- **설명**: 동아리 모집 상태 토글
- **경로 파라미터**: `clubUUID` (UUID, required)
- **응답**: `ApiResponseObject`

#### 동아리원 목록 조회
- **GET** `/clubs/{clubUUID}/members`
- **설명**: 동아리원 목록 조회
- **경로 파라미터**: `clubUUID` (UUID, required)
- **쿼리 파라미터**: `sort` (string, optional, default: "default")
- **응답**: `ApiResponseObject`

#### 동아리원 삭제
- **DELETE** `/clubs/{clubUUID}/members`
- **설명**: 동아리원 삭제
- **경로 파라미터**: `clubUUID` (UUID, required)
- **요청 본문**: `ClubMembersDeleteRequest[]`
  - `clubMemberUUID` (UUID, required): 삭제할 동아리원 UUID
- **응답**: `ApiResponseObject`

#### 지원자 목록 조회
- **GET** `/clubs/{clubUUID}/applicants`
- **설명**: 동아리 지원자 목록 조회
- **경로 파라미터**: `clubUUID` (UUID, required)
- **쿼리 파라미터**: `status` (enum, optional): "WAIT", "PASS", "FAIL"
- **응답**: `ApiResponseObject`

#### 지원 결과 알림 발송
- **POST** `/clubs/{clubUUID}/applicants/notifications`
- **설명**: 지원자 결과 알림 발송
- **경로 파라미터**: `clubUUID` (UUID, required)
- **요청 본문**: `ApplicantResultsRequest[]`
  - `aplictUUID` (UUID, required): 지원서 UUID
- **응답**: `ApiResponseObject`

#### 동아리 중복 확인
- **GET** `/clubs/check-duplication`
- **설명**: 동아리 정보 중복 확인
- **쿼리 파라미터**:
  - `type` (string, required): 확인할 타입
  - `val` (string, required): 확인할 값
- **응답**: `ApiResponseString`

#### 약관 동의
- **PATCH** `/clubs/terms/agreement`
- **설명**: 약관 동의 처리
- **응답**: `ApiResponseString`

#### FCM 토큰 업데이트
- **PATCH** `/clubs/fcmtoken`
- **설명**: FCM 토큰 업데이트
- **요청 본문**: `FcmTokenRequest`
  - `fcmToken` (string, required): FCM 토큰
- **응답**: `ApiResponseObject`

---

### 동아리 지원 (Club Application)

#### 지원서 제출
- **POST** `/clubs/{clubUUID}/applications`
- **설명**: 동아리 지원서 제출
- **경로 파라미터**: `clubUUID` (UUID, required)
- **요청 본문**: `SubmitRequest`
  - `answers` (array, required): `AnswerRequest[]`
    - `questionId` (int64, required): 질문 ID
    - `optionId` (int64, optional): 선택지 ID (객관식인 경우)
    - `answerText` (string, optional): 답변 텍스트 (주관식인 경우)
- **응답**: `ApiResponseVoid`

#### 지원서 상세 조회
- **GET** `/clubs/{clubUUID}/applications/{aplictUUID}`
- **설명**: 지원서 상세 정보 조회
- **경로 파라미터**:
  - `clubUUID` (UUID, required)
  - `aplictUUID` (UUID, required)
- **응답**: `ApiResponseDetailResponse`
  - `aplictUUID`, `applicantName`, `studentNumber`, `department`, `submittedAt`, `status`, `qnaList`

#### 지원 자격 확인
- **GET** `/clubs/{clubUUID}/applications/eligibility`
- **설명**: 동아리 지원 자격 확인
- **경로 파라미터**: `clubUUID` (UUID, required)
- **응답**: `ApiResponseBoolean`

---

### 동아리 회장 (Club Leader)

#### 동아리 소개 조회
- **GET** `/club-leader/{clubUUID}/intro`
- **설명**: 동아리 소개 정보 조회 (회장용)
- **경로 파라미터**: `clubUUID` (UUID, required)
- **응답**: `ApiResponseLeaderClubIntroResponse`
  - `clubuuid`, `clubIntro`, `clubRecruitment`, `recruitmentStatus`, `googleFormUrl`, `introPhotos`

#### 동아리 소개 수정
- **PUT** `/club-leader/{clubUUID}/intro`
- **설명**: 동아리 소개 정보 수정
- **경로 파라미터**: `clubUUID` (UUID, required)
- **요청 본문** (multipart/form-data):
  - `clubIntroRequest` (JSON, optional): `ClubIntroRequest`
    - `clubIntro` (string, optional): 동아리 소개 (0-3000자)
    - `recruitmentStatus` (enum, required): "OPEN", "CLOSE"
    - `clubRecruitment` (string, optional): 모집 공고 (0-3000자)
    - `googleFormUrl` (string, optional): 구글 폼 URL
    - `orders` (array[int32], optional): 사진 순서
    - `deletedOrders` (array[int32], optional): 삭제할 사진 순서
  - `introPhotos` (array[binary], optional): 소개 사진들
- **응답**: `ApiResponseObject`

#### 동아리 정보 조회
- **GET** `/club-leader/{clubUUID}/info`
- **설명**: 동아리 기본 정보 조회 (회장용)
- **경로 파라미터**: `clubUUID` (UUID, required)
- **응답**: `ApiResponseObject`

#### 동아리 정보 수정
- **PUT** `/club-leader/{clubUUID}/info`
- **설명**: 동아리 기본 정보 수정 (회장용)
- **경로 파라미터**: `clubUUID` (UUID, required)
- **요청 본문** (multipart/form-data):
  - `mainPhoto` (binary, optional): 대표 사진
  - `clubInfoRequest` (JSON, optional): `ClubInfoRequest`
  - `leaderUpdatePwRequest` (JSON, optional): `LeaderUpdatePwRequest`
- **응답**: `ApiResponseObject`

#### 동아리 요약 조회
- **GET** `/club-leader/{clubUUID}/summary`
- **설명**: 동아리 요약 정보 조회
- **경로 파라미터**: `clubUUID` (UUID, required)
- **응답**: `ApiResponseClubSummaryResponse`
  - `clubuuid`, `clubName`, `leaderName`, `leaderHp`, `clubInsta`, `clubRoomNumber`, `clubHashtag`, `clubCategories`, `clubIntro`, `clubRecruitment`, `recruitmentStatus`, `googleFormUrl`, `mainPhoto`, `introPhotos`

#### 동아리원 목록 조회
- **GET** `/club-leader/{clubUUID}/members`
- **설명**: 동아리원 목록 조회 (회장용)
- **경로 파라미터**: `clubUUID` (UUID, required)
- **쿼리 파라미터**: `sort` (string, optional, default: "default")
- **응답**: `ApiResponseObject`

#### 동아리원 삭제
- **DELETE** `/club-leader/{clubUUID}/members`
- **설명**: 동아리원 삭제 (회장용)
- **경로 파라미터**: `clubUUID` (UUID, required)
- **요청 본문**: `ClubMembersDeleteRequest[]`
- **응답**: `ApiResponseObject`

#### 지원서 상세 조회
- **GET** `/club-leader/{clubUUID}/applications/{applicationUUID}`
- **설명**: 지원서 상세 정보 조회 (회장용)
- **경로 파라미터**:
  - `clubUUID` (UUID, required)
  - `applicationUUID` (UUID, required)
- **응답**: `ApiResponseDetailResponse`

#### 지원자 목록 조회
- **GET** `/club-leader/{clubUUID}/applicants`
- **설명**: 지원자 목록 조회 (회장용)
- **경로 파라미터**: `clubUUID` (UUID, required)
- **쿼리 파라미터**: `status` (enum, optional): "WAIT", "PASS", "FAIL"
- **응답**: `ApiResponseObject`

#### 지원 상태 변경
- **PATCH** `/club-leader/{clubUUID}/applications/{applicationUUID}/status`
- **설명**: 지원서 상태 변경
- **경로 파라미터**:
  - `clubUUID` (UUID, required)
  - `applicationUUID` (UUID, required)
- **요청 본문**: `UpdateStatusRequest`
  - `status` (enum, required): "WAIT", "PASS", "FAIL"
- **응답**: `ApiResponseVoid`

#### 지원 결과 알림 발송
- **POST** `/club-leader/{clubUUID}/applicants/notifications`
- **설명**: 지원자 결과 알림 발송 (회장용)
- **경로 파라미터**: `clubUUID` (UUID, required)
- **요청 본문**: `ApplicantResultsRequest[]`
- **응답**: `ApiResponseObject`

#### 모집 상태 변경
- **PATCH** `/club-leader/{clubUUID}/recruitment`
- **설명**: 동아리 모집 상태 토글 (회장용)
- **경로 파라미터**: `clubUUID` (UUID, required)
- **응답**: `ApiResponseObject`

#### 카테고리 목록 조회
- **GET** `/club-leader/category`
- **설명**: 모든 카테고리 목록 조회
- **응답**: `ApiResponseListClubCategoryDto`
  - `clubCategoryUUID`, `clubCategoryName`

#### 약관 동의
- **PATCH** `/club-leader/terms/agreement`
- **설명**: 약관 동의 처리 (회장용)
- **응답**: `ApiResponseString`

#### FCM 토큰 업데이트
- **PATCH** `/club-leader/fcmtoken`
- **설명**: FCM 토큰 업데이트 (회장용)
- **요청 본문**: `FcmTokenRequest`
- **응답**: `ApiResponseObject`

---

### 공지사항 (Notices)

#### 공지사항 목록 조회
- **GET** `/notices`
- **설명**: 공지사항 목록 조회 (페이지네이션)
- **쿼리 파라미터**:
  - `page` (int32, optional, default: 0): 페이지 번호
  - `size` (int32, optional, default: 10): 페이지 크기
- **응답**: `ApiResponseNoticePageResponse`
  - `content`: `NoticeListResponse[]`
    - `noticeUUID`, `noticeTitle`, `authorName`, `noticeCreatedAt`
  - `totalPages`, `totalElements`, `currentPage`

#### 공지사항 생성
- **POST** `/notices`
- **설명**: 공지사항 생성
- **요청 본문** (multipart/form-data):
  - `request` (JSON, required): `NoticeRequest`
    - `noticeTitle` (string, required): 제목 (1-200자)
    - `noticeContent` (string, required): 내용 (1-3000자)
    - `photoOrders` (array[int32], optional): 사진 순서
  - `photos` (array[binary], optional): 첨부 사진들
- **응답**: `ApiResponseListString`

#### 공지사항 상세 조회
- **GET** `/notices/{noticeUUID}`
- **설명**: 공지사항 상세 정보 조회
- **경로 파라미터**: `noticeUUID` (UUID, required)
- **응답**: `ApiResponseNoticeDetailResponse`
  - `noticeUUID`, `noticeTitle`, `noticeContent`, `noticePhotos`, `noticeCreatedAt`, `authorName`

#### 공지사항 수정
- **PUT** `/notices/{noticeUUID}`
- **설명**: 공지사항 수정
- **경로 파라미터**: `noticeUUID` (UUID, required)
- **요청 본문** (multipart/form-data):
  - `request` (JSON, required): `NoticeUpdateRequest`
    - `noticeTitle` (string, required): 제목
    - `noticeContent` (string, required): 내용
    - `photoOrders` (array[int32], optional): 사진 순서
  - `photos` (array[binary], optional): 첨부 사진들
- **응답**: `ApiResponseListString`

#### 공지사항 삭제
- **DELETE** `/notices/{noticeUUID}`
- **설명**: 공지사항 삭제
- **경로 파라미터**: `noticeUUID` (UUID, required)
- **응답**: `ApiResponseUUID`

---

### 이벤트 인증 (Event Verification)

#### 이벤트 인증
- **POST** `/users/event/verify`
- **설명**: 이벤트 인증 코드 확인
- **요청 본문**: `EventVerifyRequest`
  - `code` (string, required): 인증 코드
- **응답**: `ApiResponseEventVerifyResponse`
  - `clubUUID`, `isFirstVerify`, `verified_at`

#### 이벤트 인증 상태 조회
- **GET** `/users/event/status`
- **설명**: 이벤트 인증 상태 조회
- **응답**: `ApiResponseEventStatusResponse`
  - `verified` (boolean)

---

### 기타

#### 내 공지사항 목록 조회
- **GET** `/my-notices`
- **설명**: 내가 작성한 공지사항 목록 조회
- **응답**: `ApiResponseListMyNoticeResponse`
  - `noticeUUID`, `noticeTitle`, `adminName`, `noticeCreatedAt`

#### 내 공지사항 상세 조회
- **GET** `/my-notices/{noticeUUID}/details`
- **설명**: 내가 작성한 공지사항 상세 조회
- **경로 파라미터**: `noticeUUID` (UUID, required)
- **응답**: `ApiResponseNoticeDetailResponse`

#### 마이페이지 - 내 동아리 목록
- **GET** `/mypages/my-clubs`
- **설명**: 마이페이지에서 내 동아리 목록 조회
- **응답**: `ApiResponseListMyClubResponse`

#### 마이페이지 - 지원한 동아리 목록
- **GET** `/mypages/aplict-clubs`
- **설명**: 마이페이지에서 지원한 동아리 목록 조회
- **응답**: `ApiResponseListMyAplictResponse`

#### 층별 동아리방 사진 조회
- **GET** `/mypages/clubs/{floor}/photo`
- **설명**: 특정 층의 동아리방 사진 조회
- **경로 파라미터**: `floor` (string, required): "B1", "F1", "F2"
- **응답**: `ApiResponseClubFloorPhotoResponse`
  - `roomFloor`, `floorPhotoPath`

#### 동아리 폼 조회
- **GET** `/clubs/forms/{clubUUID}`
- **설명**: 동아리의 활성화된 지원서 폼 조회
- **경로 파라미터**: `clubUUID` (UUID, required)
- **응답**: `ApiResponseClubFormResponse`
  - `formId`, `questions`: `QuestionResponse[]`
    - `questionId`, `content`, `type`, `sequence`, `required`, `options`: `OptionResponse[]`
      - `optionId`, `content`

#### 동아리 폼 생성
- **POST** `/api/clubs/{clubUUID}/forms`
- **설명**: 동아리 지원서 폼 생성
- **경로 파라미터**: `clubUUID` (UUID, required)
- **요청 본문**: `CreateRequest`
  - `description` (string, optional): 폼 설명 (0-500자)
  - `questions` (array, required): `QuestionRequest[]`
    - `sequence` (int32, required): 질문 순서
    - `type` (enum, required): "LONG_TEXT", "SHORT_TEXT", "RADIO", "DROPDOWN", "CHECKBOX"
    - `content` (string, required): 질문 내용 (0-200자)
    - `required` (boolean, required): 필수 여부
    - `options` (array, optional): `OptionRequest[]` (객관식인 경우)
      - `sequence` (int32, required): 선택지 순서
      - `content` (string, required): 선택지 내용 (0-50자)
      - `value` (string, optional): 선택지 값
- **응답**: 200 OK

#### 카테고리 목록 조회
- **GET** `/categories`
- **설명**: 모든 카테고리 목록 조회
- **응답**: `ApiResponseListClubCategoryDto`

#### 카테고리 추가
- **POST** `/categories`
- **설명**: 카테고리 추가
- **요청 본문**: `CategoryRequest`
  - `clubCategoryName` (string, required): 카테고리 이름 (1-20자)
- **응답**: `ApiResponseClubCategoryDto`

#### 카테고리 삭제
- **DELETE** `/categories/{clubCategoryUUID}`
- **설명**: 카테고리 삭제
- **경로 파라미터**: `clubCategoryUUID` (UUID, required)
- **응답**: `ApiResponseClubCategoryDto`

#### 층별 지도 조회
- **GET** `/floor-maps`
- **설명**: 층별 지도 조회
- **쿼리 파라미터**: `floor` (enum, optional): "B1", "F1", "F2"
- **응답**: `ApiResponseObject`

#### 층별 지도 업로드
- **PUT** `/floor-maps`
- **설명**: 층별 지도 업로드
- **요청 본문** (multipart/form-data):
  - `B1` (binary, optional): 지하 1층 지도
  - `F1` (binary, optional): 1층 지도
  - `F2` (binary, optional): 2층 지도
- **응답**: `ApiResponseObject`

#### 층별 지도 삭제
- **DELETE** `/floor-maps/{floorEnum}`
- **설명**: 특정 층의 지도 삭제
- **경로 파라미터**: `floorEnum` (enum, required): "B1", "F1", "F2"
- **응답**: `ApiResponseString`

#### 헬스 체크
- **GET** `/health-check`
- **설명**: 서버 헬스 체크
- **응답**: string

---

### 관리자 (Admin)

#### 관리자 - 동아리 목록 조회
- **GET** `/admin/clubs`
- **설명**: 관리자용 동아리 목록 조회 (페이지네이션)
- **쿼리 파라미터**:
  - `page` (int32, optional, default: 0)
  - `size` (int32, optional, default: 10)
- **응답**: `ApiResponseAdminClubPageListResponse`
  - `content`: `AdminClubListResponse[]`
    - `clubUUID`, `department`, `clubName`, `leaderName`, `numberOfClubMembers`
  - `totalPages`, `totalElements`, `currentPage`

#### 관리자 - 동아리 생성
- **POST** `/admin/clubs`
- **설명**: 관리자용 동아리 생성
- **요청 본문**: `AdminClubCreationRequest`
- **응답**: `ApiResponseString`

#### 관리자 - 동아리 조회
- **GET** `/admin/clubs/{clubUUID}`
- **설명**: 관리자용 동아리 상세 조회
- **경로 파라미터**: `clubUUID` (UUID, required)
- **응답**: `ApiResponseAdminClubIntroResponse`

#### 관리자 - 동아리 삭제
- **DELETE** `/admin/clubs/{clubUUID}`
- **설명**: 관리자용 동아리 삭제
- **경로 파라미터**: `clubUUID` (UUID, required)
- **요청 본문**: `AdminPwRequest`
- **응답**: `ApiResponseLong`

#### 관리자 - 동아리 이름 중복 확인
- **GET** `/admin/clubs/name/check`
- **설명**: 동아리 이름 중복 확인
- **쿼리 파라미터**: `clubName` (string, required)
- **응답**: `ApiResponseString`

#### 관리자 - 회장 계정 중복 확인
- **GET** `/admin/clubs/leader/check`
- **설명**: 회장 계정 중복 확인
- **쿼리 파라미터**: `leaderAccount` (string, required)
- **응답**: `ApiResponseString`

---

## 주요 데이터 모델

### 공통 응답 형식

모든 API 응답은 다음 형식을 따릅니다:

```json
{
  "message": "string",
  "data": { ... }
}
```

### 주요 Enum 타입

#### 모집 상태 (RecruitmentStatus)
- `OPEN`: 모집 중
- `CLOSE`: 모집 마감

#### 지원 상태 (ApplicationStatus)
- `WAIT`: 대기 중
- `PASS`: 합격
- `FAIL`: 불합격

#### 역할 (Role)
- `USER`: 일반 사용자
- `ADMIN`: 관리자
- `LEADER`: 동아리 회장

#### 분과 (Department)
- `학술`: 학술 분과
- `종교`: 종교 분과
- `예술`: 예술 분과
- `체육`: 체육 분과
- `공연`: 공연 분과
- `봉사`: 봉사 분과

#### 질문 타입 (QuestionType)
- `LONG_TEXT`: 장문 텍스트
- `SHORT_TEXT`: 단문 텍스트
- `RADIO`: 라디오 버튼 (단일 선택)
- `DROPDOWN`: 드롭다운 (단일 선택)
- `CHECKBOX`: 체크박스 (다중 선택)

#### 층 (Floor)
- `B1`: 지하 1층
- `F1`: 1층
- `F2`: 2층

---

## 유효성 검사 규칙

### 계정 ID
- 길이: 5-20자
- 패턴: 영문, 숫자만 허용 (`^[a-zA-Z0-9]+$`)

### 비밀번호
- 길이: 8-20자
- 패턴: 영문, 숫자, 특수문자 각각 1개 이상 포함, 공백 불가
- 패턴: `^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>/?])(?!.*\s).*$`

### 이름
- 길이: 2-30자
- 패턴: 영문, 한글만 허용 (`^[a-zA-Z가-힣]+$`)

### 전화번호
- 길이: 11자
- 패턴: 01로 시작하는 숫자 (`^01[0-9]{9}$`)

### 학번
- 길이: 8자
- 패턴: 숫자만 허용 (`^[0-9]{8}$`)

### 전공
- 길이: 1-20자
- 패턴: 한글, 영문만 허용 (`^[가-힣a-zA-Z]+$`)

### 동아리 이름
- 길이: 1-10자
- 패턴: 한글, 영문, 숫자 허용 (`^[가-힣a-zA-Z0-9]+$`)

### 인스타그램 URL
- 패턴: `^(https?://)?(www\.)?instagram\.com/.+$|^$` (빈 문자열도 허용)

### 구글 폼 URL
- 패턴: `^(https://[a-zA-Z0-9._-]+(?:\.[a-zA-Z]{2,})+.*)?$` (빈 문자열도 허용)

---

## 에러 처리

API는 표준 HTTP 상태 코드를 사용합니다:
- `200 OK`: 요청 성공
- `400 Bad Request`: 잘못된 요청
- `401 Unauthorized`: 인증 실패
- `403 Forbidden`: 권한 없음
- `404 Not Found`: 리소스를 찾을 수 없음
- `500 Internal Server Error`: 서버 오류

---

## 참고사항

1. 모든 UUID는 표준 UUID 형식을 따릅니다.
2. 날짜/시간은 ISO 8601 형식 (`date-time`)을 사용합니다.
3. 파일 업로드가 필요한 엔드포인트는 `multipart/form-data` 형식을 사용합니다.
4. 페이지네이션은 0부터 시작합니다.
5. 모든 문자열 길이 제한은 바이트가 아닌 문자 수를 기준으로 합니다.
