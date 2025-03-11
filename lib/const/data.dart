import 'dart:ui';

import 'package:usw_circle_link/models/circle_detail_list_model.dart';
import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/models/notice_model.dart';

const servers = {
  'prod_server': {
    'protocol': 'https',
    'host': 'api.donggurami.net',
    'port': '',
  },
  'test_server': {
    'protocol': 'http',
    'host': '15.164.246.244',
    'port': '8080',
  },
};
const SERVER = 'prod_server';
final protocol = servers[SERVER]!['protocol'];
final host = servers[SERVER]!['host'];
final port = servers[SERVER]!['port'];

// Storage Key
const accessTokenKey = 'access_token';
const refreshTokenKey = 'refresh_token';
const subKey = 'sub';
const roleKey = 'role';
const clubUUIDsKey = 'club_uuids';
const iatKey = 'iat';
const expKey = 'exp';
// URL
const feedback = "https://forms.gle/Xhang1SZiZiVyabe6";
// Color
const accentColor = Color(0xffffB052);
// Data
const departments = <String, String>{
  'ACADEMIC': '학술',
  'RELIGION': '종교',
  'ART': '예술',
  'SPORT': '체육',
  'SHOW': '공연',
  'VOLUNTEER': '봉사',
};
const colleges = <String>[
  '인문사회융합대학',
  '경영공학대학',
  '혁신공과대학',
  '지능형SW융합대학',
  '라이프케어사이언스대학',
  '디자인앤아트대학',
  '음악테크놀로지대학',
  '문화예술융합대학',
  '글로벌인재대학',
];
const majors = {
  '인문사회융합대학': <String>[
    '인문사회융합대학',
    '인문학부',
    '국어국문학과',
    '사학과',
    '외국어학부',
    '영어영문학과',
    '프랑스어문학과',
    '러시아어문학과',
    '일어일문학과',
    '중어중문학과',
    '법행정학부',
    '법학과',
    '행정학과',
    '미디어커뮤니케이션학과',
    '소방행정학과',
  ],
  '경영공학대학': <String>[
    '경영학부',
    '경영학과',
    '글로벌비즈니스학과',
    '회계학과',
    '경제학부',
    '경제금융학과',
    '국제개발협력학과',
    '호텔관광학부',
    '호텔경영학과',
    '외식경영학과',
    '관광경영학과',
  ],
  '혁신공과대학': <String>[
    '바이오화학산업학부',
    '바이오공학및마케팅학과',
    '융합화학산업학과',
    '건성환경에너지공학부',
    '건설환경공학과',
    '환경에너지공학과',
    '건축도시부동산학부',
    '건축학과',
    '도시부동산학과',
    '산업및기계공학부',
    '산업공학과',
    '기계공학과',
    '반도체공학과',
    '전기전자공학부',
    '전기공학과',
    '전자공학과',
    '화학공학신소재공학부',
    '신소재공학과',
    '화학공학과',
  ],
  '지능형SW융합대학': <String>[
    '컴퓨터학부',
    '컴퓨터SW학과',
    '미디어SW학과',
    '정보통신학부',
    '정보통신학과',
    '정보보호학과',
    '데이터과학부',
  ],
  '라이프케어사이언스대학': <String>[
    '간호학과',
    '아동가족복지학과',
    '의류학과',
    '식품영양학과',
    '스포츠과학부',
    '체육학과',
    '레저스포츠학과',
    '운동건강관리학과',
  ],
  '디자인앤아트대학': <String>[
    '조형예술학부',
    '회화과',
    '조소과',
    '디자인학부',
    '커뮤니케이션디자인과',
    '패션디자인과',
    '공예디자인과',
  ],
  '음악테크놀로지대학': <String>[
    '아트앤테크놀로지작곡과',
    '성악과',
    '피아노과',
    '관현악과',
    '국악과',
  ],
  '문화예술융합대학': <String>[
    '아트앤엔터테인먼트학부',
    '영화술과',
    '연기예술과',
    '디지털콘텐츠과',
  ],
  '글로벌인재대학': <String>[
    '자유전공학부',
  ],
};

// 테스트 데이터
const testId = "user1";
const testPassword = "1234";
const testUserName = "user";
const testTelephone = "010-1234-5678";
const testStudentNumber = "00000000";
const testMajor = "major1";
// 가상의 데이터를 생성
final fakeData = CircleDetailListModel(
  message: "Success",
  data: [
    Circle(
      clubUUID: "1",
      clubName: "FLAG",
      leaderName: "정우창",
      leaderHp: "010-0000-0000",
      clubInsta: "FLAG",
      mainPhotoPath: "",
      aplictStatus: "WAIT",
      clubRoomNumber: "218",
    ),
    Circle(
      clubUUID: "2",
      clubName: "Coding Club",
      leaderName: "김코딩",
      leaderHp: "010-1111-2222",
      clubInsta: "coding_club",
      mainPhotoPath: "",
      aplictStatus: "PASS",
      clubRoomNumber: "218",
    ),
    // status가 없는 동아리
    Circle(
      clubUUID: "3",
      clubName: "Art Club",
      leaderName: "이예술",
      leaderHp: "010-2222-3333",
      clubInsta: "art_club",
      mainPhotoPath: "",
      clubRoomNumber: "218",
    ),
  ],
);
var testCircleData = <CircleListData>[
  CircleListData(
    clubUUID: "1",
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ACADEMIC",
    clubHashtags: ["#학술", "#예술"],
  ),
  CircleListData(
    clubUUID: "1",
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ACADEMIC",
    clubHashtags: ["#학술", "#예술"],
  ),
  CircleListData(
    clubUUID: "1",
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ACADEMIC",
    clubHashtags: ["#학술", "#예술"],
  ),
  CircleListData(
    clubUUID: "1",
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ART",
    clubHashtags: ["#학술", "#예술"],
  ),
  CircleListData(
    clubUUID: "1",
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ART",
    clubHashtags: ["#학술", "#예술"],
  ),
  CircleListData(
    clubUUID: "1",
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ART",
    clubHashtags: ["#학술", "#예술"],
  ),
  CircleListData(
    clubUUID: "1",
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "SHOW",
    clubHashtags: ["#학술", "#예술"],
  ),
  CircleListData(
    clubUUID: "1",
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "SHOW",
    clubHashtags: ["#학술", "#예술"],
  ),
  CircleListData(
    clubUUID: "1",
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "SHOW",
    clubHashtags: ["#학술", "#예술"],
  ),
  CircleListData(
    clubUUID: "1",
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "RELIGION",
    clubHashtags: ["#학술", "#예술"],
  ),
  CircleListData(
    clubUUID: "1",
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "RELIGION",
    clubHashtags: ["#학술", "#예술"],
  ),
  CircleListData(
    clubUUID: "1",
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "RELIGION",
    clubHashtags: ["#학술", "#예술"],
  ),
];
const testFormUrl = "https://forms.gle/aVU2MkLqsGRhvnQq5";
var testNotices = <NoticeData>[
  NoticeData(
      noticeUUID: "1",
      noticeTitle: 'test1',
      adminName: 'admin1',
      noticeCreatedAt: '2024-10-11'),
  NoticeData(
      noticeUUID: "2",
      noticeTitle: 'test2',
      adminName: 'admin2',
      noticeCreatedAt: '2024-10-12'),
  NoticeData(
      noticeUUID: "3",
      noticeTitle: 'test3',
      adminName: 'admin3',
      noticeCreatedAt: '2024-10-13'),
  NoticeData(
      noticeUUID: "4",
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeUUID: "4",
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeUUID: "4",
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeUUID: "4",
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeUUID: "4",
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeUUID: "4",
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeUUID: "4",
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeUUID: "4",
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeUUID: "4",
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeUUID: "4",
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
];
const testContent = """
정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 나는 헌법을 준수하고 국가를 보위하며 조국의 평화적 통일과 국민의 자유와 복리의 증진 및 민족문화의 창달에 노력하여 대통령으로서의 직책을 성실히 수행할 것을 국민 앞에 엄숙히 선서합니다. 모든 국민은 종교의 자유를 가진다.

한 회계연도를 넘어 계속하여 지출할 필요가 있을 때에는 정부는 연한을 정하여 계속비로서 국회의 의결을 얻어야 한다. 국회의원의 수는 법률로 정하되, 200인 이상으로 한다. 국회는 상호원조 또는 안전보장에 관한 조약, 중요한 국제조직에 관한 조약, 우호통상항해조약, 주권의 제약에 관한 조약, 강화조약, 국가나 국민에게 중대한 재정적 부담을 지우는 조약 또는 입법사항에 관한 조약의 체결·비준에 대한 동의권을 가진다.

정당은 법률이 정하는 바에 의하여 국가의 보호를 받으며, 국가는 법률이 정하는 바에 의하여 정당운영에 필요한 자금을 보조할 수 있다. 공무원의 신분과 정치적 중립성은 법률이 정하는 바에 의하여 보장된다. 국가는 농지에 관하여 경자유전의 원칙이 달성될 수 있도록 노력하여야 하며, 농지의 소작제도는 금지된다.

정당의 설립은 자유이며, 복수정당제는 보장된다. 대통령은 헌법과 법률이 정하는 바에 의하여 국군을 통수한다. 법률이 헌법에 위반되는 여부가 재판의 전제가 된 경우에는 법원은 헌법재판소에 제청하여 그 심판에 의하여 재판한다. 대한민국의 국민이 되는 요건은 법률로 정한다. 국회의원은 국회에서 직무상 행한 발언과 표결에 관하여 국회외에서 책임을 지지 아니한다.
""";
const testContentPhotos = [
  "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fd1e6IL%2Fbtr41J8GWEF%2FYyPzwHfiDY5jOyAZWr6G7K%2Fimg.jpg",
  "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FFfC0H%2Fbtr5aGiI5dt%2FbdN3vFjyxbPlNCsMKGak71%2Fimg.jpg",
  "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fby4EjE%2Fbtr42y0bmOd%2FhG8E4Outweg3U9gHOqmoo1%2Fimg.jpg",
  "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F6JBSA%2Fbtr42z5Q3u8%2FyFdqxX921yki2FFKQTDAt0%2Fimg.jpg",
];

final dummyCircles = <Circle>[
  Circle(
    clubUUID: "1",
    clubName: "FLAG",
    mainPhotoPath:
        "https://i.namu.wiki/i/xbE8Kj42coaLvovOcQ9d2-6Q1CZQV4HGJ8BEpgWX-_-tH6MfuBnhO9lRyl5IbAxm3NlEmduLgSHi1gJltSQNSNKQGxmyoXTMeAMyF6hb6xOawmXQoN6kV--NJ8DcKS1MQGgcXH5_ZRT867NqyZLN1g.svg",
    leaderName: "김철수",
    leaderHp: "010-1234-5678",
    clubInsta: "@flag_club",
    clubRoomNumber: "학생회관 301호",
    aplictStatus: "모집중",
  ),
  Circle(
    clubUUID: "2",
    clubName: "MUSE",
    mainPhotoPath:
        "https://i.namu.wiki/i/xbE8Kj42coaLvovOcQ9d2-6Q1CZQV4HGJ8BEpgWX-_-tH6MfuBnhO9lRyl5IbAxm3NlEmduLgSHi1gJltSQNSNKQGxmyoXTMeAMyF6hb6xOawmXQoN6kV--NJ8DcKS1MQGgcXH5_ZRT867NqyZLN1g.svg",
    leaderName: "이영희",
    leaderHp: "010-2345-6789",
    clubInsta: "@muse_official",
    clubRoomNumber: "학생회관 302호",
    aplictStatus: "모집마감",
  ),
  Circle(
    clubUUID: "3",
    clubName: "FLOW",
    mainPhotoPath:
        "https://i.namu.wiki/i/xbE8Kj42coaLvovOcQ9d2-6Q1CZQV4HGJ8BEpgWX-_-tH6MfuBnhO9lRyl5IbAxm3NlEmduLgSHi1gJltSQNSNKQGxmyoXTMeAMyF6hb6xOawmXQoN6kV--NJ8DcKS1MQGgcXH5_ZRT867NqyZLN1g.svg",
    leaderName: "박민수",
    leaderHp: "010-3456-7890",
    clubInsta: "@flow_circle",
    clubRoomNumber: "체육관 102호",
    aplictStatus: "모집중",
  ),
  Circle(
    clubUUID: "4",
    clubName: "IMPACT",
    mainPhotoPath:
        "https://i.namu.wiki/i/xbE8Kj42coaLvovOcQ9d2-6Q1CZQV4HGJ8BEpgWX-_-tH6MfuBnhO9lRyl5IbAxm3NlEmduLgSHi1gJltSQNSNKQGxmyoXTMeAMyF6hb6xOawmXQoN6kV--NJ8DcKS1MQGgcXH5_ZRT867NqyZLN1g.svg",
    leaderName: "정지원",
    leaderHp: "010-4567-8901",
    clubInsta: "@impact_usw",
    clubRoomNumber: "예술관 201호",
    aplictStatus: "모집중",
  ),
  Circle(
    clubUUID: "5",
    clubName: "VISION",
    mainPhotoPath:
        "https://i.namu.wiki/i/xbE8Kj42coaLvovOcQ9d2-6Q1CZQV4HGJ8BEpgWX-_-tH6MfuBnhO9lRyl5IbAxm3NlEmduLgSHi1gJltSQNSNKQGxmyoXTMeAMyF6hb6xOawmXQoN6kV--NJ8DcKS1MQGgcXH5_ZRT867NqyZLN1g.svg",
    leaderName: "한소희",
    leaderHp: "010-5678-9012",
    clubInsta: "@vision_club",
    clubRoomNumber: "학생회관 401호",
    aplictStatus: "모집마감",
  ),
  Circle(
    clubUUID: "6",
    clubName: "CORE",
    mainPhotoPath:
        "https://i.namu.wiki/i/xbE8Kj42coaLvovOcQ9d2-6Q1CZQV4HGJ8BEpgWX-_-tH6MfuBnhO9lRyl5IbAxm3NlEmduLgSHi1gJltSQNSNKQGxmyoXTMeAMyF6hb6xOawmXQoN6kV--NJ8DcKS1MQGgcXH5_ZRT867NqyZLN1g.svg",
    leaderName: "송민재",
    leaderHp: "010-6789-0123",
    clubInsta: "@core_official",
    clubRoomNumber: "공학관 501호",
    aplictStatus: "모집중",
  ),
  Circle(
    clubUUID: "7",
    clubName: "PULSE",
    mainPhotoPath:
        "https://i.namu.wiki/i/xbE8Kj42coaLvovOcQ9d2-6Q1CZQV4HGJ8BEpgWX-_-tH6MfuBnhO9lRyl5IbAxm3NlEmduLgSHi1gJltSQNSNKQGxmyoXTMeAMyF6hb6xOawmXQoN6kV--NJ8DcKS1MQGgcXH5_ZRT867NqyZLN1g.svg",
    leaderName: "임서연",
    leaderHp: "010-7890-1234",
    clubInsta: "@pulse_dance",
    clubRoomNumber: "체육관 201호",
    aplictStatus: "모집중",
  ),
  Circle(
    clubUUID: "8",
    clubName: "ECHO",
    mainPhotoPath:
        "https://i.namu.wiki/i/xbE8Kj42coaLvovOcQ9d2-6Q1CZQV4HGJ8BEpgWX-_-tH6MfuBnhO9lRyl5IbAxm3NlEmduLgSHi1gJltSQNSNKQGxmyoXTMeAMyF6hb6xOawmXQoN6kV--NJ8DcKS1MQGgcXH5_ZRT867NqyZLN1g.svg",
    leaderName: "강동훈",
    leaderHp: "010-8901-2345",
    clubInsta: "@echo_music",
    clubRoomNumber: "음악관 301호",
    aplictStatus: "모집마감",
  ),
  Circle(
    clubUUID: "9",
    clubName: "SPARK",
    mainPhotoPath:
        "https://i.namu.wiki/i/xbE8Kj42coaLvovOcQ9d2-6Q1CZQV4HGJ8BEpgWX-_-tH6MfuBnhO9lRyl5IbAxm3NlEmduLgSHi1gJltSQNSNKQGxmyoXTMeAMyF6hb6xOawmXQoN6kV--NJ8DcKS1MQGgcXH5_ZRT867NqyZLN1g.svg",
    leaderName: "윤하은",
    leaderHp: "010-9012-3456",
    clubInsta: "@spark_art",
    clubRoomNumber: "예술관 401호",
    aplictStatus: "모집중",
  ),
  Circle(
    clubUUID: "10",
    clubName: "UNITY",
    mainPhotoPath:
        "https://i.namu.wiki/i/xbE8Kj42coaLvovOcQ9d2-6Q1CZQV4HGJ8BEpgWX-_-tH6MfuBnhO9lRyl5IbAxm3NlEmduLgSHi1gJltSQNSNKQGxmyoXTMeAMyF6hb6xOawmXQoN6kV--NJ8DcKS1MQGgcXH5_ZRT867NqyZLN1g.svg",
    leaderName: "조현우",
    leaderHp: "010-0123-4567",
    clubInsta: "@unity_volunteer",
    clubRoomNumber: "학생회관 501호",
    aplictStatus: "모집중",
  ),
];
