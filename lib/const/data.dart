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

const accessTokenKey = 'access_token';
const refreshTokenKey = 'refresh_token';
const subKey = 'sub';
const roleKey = 'role';
const clubIdsKey = 'club_ids';
const iatKey = 'iat';
const expKey = 'exp';
const feedback = "https://forms.gle/auVHQJtz9xTRmXEA8";
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
const content_of_terms_of_service = '동구라미 서비스 이용약관\n\n'
    '제 1 조 (목적)\n\n'
    '본 약관은 [동구라미] (이하 "동구라미"라 함)의 이용에 관한 조건 및 절차, '
    '이용자와 서비스 제공자 간의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.\n\n'
    '제 2 조 (회원가입 및 개인정보 동의)\n\n'
    '회원가입\n\n'
    '서비스 이용을 원하는 이용자는 회원가입 절차를 거쳐야 하며,'
    '회원가입 시 제공한 정보는 정확하고 최신의 정보여야 합니다.'
    '이용자는 회원가입 시 본 약관에 동의하는 것으로 간주됩니다.\n\n'
    '개인정보 동의\n\n'
    '이용자는 서비스 이용을 위해 개인정보 수집 및 이용에 대한 동의를 해야 합니다.'
    '수집되는 개인정보의 항목은 이름, 학과, 학번, 전화번호 등이며, '
    '이는 서비스 제공 및 운영을 위해 사용됩니다.'
    '이용자는 언제든지 자신의 개인정보를 열람, 수정, 삭제할 수 있으며, '
    '이를 위해 서비스 내의 관련 기능을 이용해야 합니다.\n\n'
    '제 3 조 (서비스 이용 약관)\n\n'
    '서비스 이용\n\n'
    '이용자는 본 약관에 동의함으로써 서비스를 자유롭게 이용할 수 있습니다'
    ' 서비스는 이용자에게 다음과 같은 기능을 제공합니다.  \n\n'
    '1. 수원대학교 중앙 동아리 소속 동아리 조회\n'
    '2. 수원대학교 중앙 동아리 모집 조회\n'
    '3. 동아리 지원 현황 확인\n'
    '4. 수원대학교 동아리 연합회 공지사항 조회\n'
    '5. 수원대학교 동구라미 개발팀 공지사항 조회\n'
    '6. 수원대학교 동아리 소개 페이지 조회\n'
    '7. 동아리 합/불 조회 및 알림 서비스\n'
    '8. 동아리 지원서 페이지 이동\n'
    '9. 사용자 회원 가입, 로그인, 정보수정\n'
    '\n'
    '이용자의 의무\n\n'
    '이용자는 서비스 이용 시 아래의 행위를 하여서는 안 됩니다.\n'
    '타인의 개인정보를 도용하거나 허위 정보를 입력하는 행위\n'
    '서비스의 정상적인 운영을 방해하는 행위\n'
    '타인을 비방하거나 명예를 훼손하는 행위\n'
    '불법적인 목적으로 서비스를 이용하는 행위\n\n'
    '서비스 제공자의 의무\n\n'
    '서비스 제공자는 이용자가 안정적으로 서비스를 이용할 수 있도록 최선을 다합니다.'
    ' 서비스 제공자는 이용자의 개인정보를 보호하며, 관련 법률 및 규정을 준수합니다.\n\n'
    '서비스의 변경 및 중단\n\n'
    '서비스 제공자는 필요한 경우 사전 통지 없이 서비스를 변경하거나 중단할 수 있습니다.'
    '서비스 중단으로 인한 손해에 대해 서비스 제공자는 책임을 지지 않습니다.\n\n'
    '약관의 변경\n\n'
    '서비스 제공자는 본 약관을 변경할 수 있으며, 변경된 약관은 서비스 내 공지 또는 약관 페이지에 명시 합니다.'
    '이용자는 변경된 약관에 동의하지 않을 경우 서비스 이용을 중단할 수 있습니다.\n\n'
    '제 4 조 (면책조항)\n\n'
    '서비스 제공자는 이용자의 귀책 사유로 인한 서비스 이용의 중단 및 손해에 대해 책임을 지지 않습니다. '
    '또한, 천재지변, 전쟁 등의 불가항력적 사유로 인한 서비스 제공의 중단에 대해서도 책임을 지지 않습니다.\n\n';

// 테스트 데이터
const testId = "user1";
const testPassword = "1234";
const testUserName = "user";
const testTelephone = "010-1234-5678";
const testStudentNumber = "00000000";
const testMajor = "major1";
var testCircleData = <CircleListData>[
  CircleListData(
    clubId: 1,
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ACADEMIC",
  ),
  CircleListData(
    clubId: 1,
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ACADEMIC",
  ),
  CircleListData(
    clubId: 1,
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ACADEMIC",
  ),
  CircleListData(
    clubId: 1,
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ART",
  ),
  CircleListData(
    clubId: 1,
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ART",
  ),
  CircleListData(
    clubId: 1,
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ART",
  ),
  CircleListData(
    clubId: 1,
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "SHOW",
  ),
  CircleListData(
    clubId: 1,
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "SHOW",
  ),
  CircleListData(
    clubId: 1,
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "SHOW",
  ),
  CircleListData(
    clubId: 1,
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "RELIGION",
  ),
  CircleListData(
    clubId: 1,
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "RELIGION",
  ),
  CircleListData(
    clubId: 1,
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "RELIGION",
  ),
];
const testFormUrl = "https://forms.gle/aVU2MkLqsGRhvnQq5";
var testNotices = <NoticeData>[
  NoticeData(
      noticeId: 1,
      noticeTitle: 'test1',
      adminName: 'admin1',
      noticeCreatedAt: '2024-10-11'),
  NoticeData(
      noticeId: 2,
      noticeTitle: 'test2',
      adminName: 'admin2',
      noticeCreatedAt: '2024-10-12'),
  NoticeData(
      noticeId: 3,
      noticeTitle: 'test3',
      adminName: 'admin3',
      noticeCreatedAt: '2024-10-13'),
  NoticeData(
      noticeId: 4,
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeId: 4,
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeId: 4,
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeId: 4,
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeId: 4,
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeId: 4,
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeId: 4,
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeId: 4,
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeId: 4,
      noticeTitle: 'test4',
      adminName: 'admin4',
      noticeCreatedAt: '2024-10-14'),
  NoticeData(
      noticeId: 4,
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
