import 'package:usw_circle_link/models/circle_list_model.dart';
import 'package:usw_circle_link/models/notice_model.dart';

const host = "15.164.246.244";
const port = "8080";

const accessTokenKey = 'access_token';
const refreshTokenKey = 'refresh_token';
const subKey = 'sub';
const roleKey = 'role';
const clubIdsKey = 'club_ids';
const iatKey = 'iat';
const expKey = 'exp';

const testFormUrl = "https://forms.gle/aVU2MkLqsGRhvnQq5";

var testNotices = <NoticeData>[
  NoticeData(noticeId: 1, noticeTitle: 'test1', adminName: 'admin1', noticeCreatedAt: '2024-10-11'),
  NoticeData(noticeId: 2, noticeTitle: 'test2', adminName: 'admin2', noticeCreatedAt: '2024-10-12'),
  NoticeData(noticeId: 3, noticeTitle: 'test3', adminName: 'admin3', noticeCreatedAt: '2024-10-13'),
  NoticeData(noticeId: 4, noticeTitle: 'test4', adminName: 'admin4', noticeCreatedAt: '2024-10-14'),
  NoticeData(noticeId: 4, noticeTitle: 'test4', adminName: 'admin4', noticeCreatedAt: '2024-10-14'),
  NoticeData(noticeId: 4, noticeTitle: 'test4', adminName: 'admin4', noticeCreatedAt: '2024-10-14'),
  NoticeData(noticeId: 4, noticeTitle: 'test4', adminName: 'admin4', noticeCreatedAt: '2024-10-14'),
  NoticeData(noticeId: 4, noticeTitle: 'test4', adminName: 'admin4', noticeCreatedAt: '2024-10-14'),
  NoticeData(noticeId: 4, noticeTitle: 'test4', adminName: 'admin4', noticeCreatedAt: '2024-10-14'),
  NoticeData(noticeId: 4, noticeTitle: 'test4', adminName: 'admin4', noticeCreatedAt: '2024-10-14'),
  NoticeData(noticeId: 4, noticeTitle: 'test4', adminName: 'admin4', noticeCreatedAt: '2024-10-14'),
  NoticeData(noticeId: 4, noticeTitle: 'test4', adminName: 'admin4', noticeCreatedAt: '2024-10-14'),
  NoticeData(noticeId: 4, noticeTitle: 'test4', adminName: 'admin4', noticeCreatedAt: '2024-10-14'),
];

const testId = "user1";
const testPassword = "1234";
const testUserName = "user";
const testTelephone = "010-1234-5678";
const testStudentNumber = "00000000";
const testMajor = "major1";
var testCircleData = <CircleListData>[
  CircleListData(
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ACADEMIC",
  ),
  CircleListData(
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ACADEMIC",
  ),
  CircleListData(
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ACADEMIC",
  ),
  CircleListData(
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "ACADEMIC",
  ),
  CircleListData(
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "B",
  ),
  CircleListData(
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "B",
  ),
  CircleListData(
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "C",
  ),
  CircleListData(
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "C",
  ),
  CircleListData(
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "C",
  ),
  CircleListData(
    clubName: "FLAG",
    mainPhoto:
        "https://i.namu.wiki/i/Yjlkn1UU25TOdAKXwjN5yhKIl3TgXFAQt8dWkkehbYW12fq5OMYyWQMoPwU1GZ9X7-oQl3JV677HIIMjTAXL4A.webp",
    departmentName: "C",
  ),
];

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
