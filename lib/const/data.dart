const host = "43.200.140.186";
const port = "8080";

const accessTokenKey = 'access_token';
const refreshTokenKey = 'refresh_token';
const subKey = 'sub';
const roleKey = 'role';
const clubIdsKey = 'club_ids';
const iatKey = 'iat';
const expKey = 'exp';

const testFormUrl = "https://forms.gle/aVU2MkLqsGRhvnQq5";

const testId = "user1";
const testPassword = "1234";
const testUserName = "user";
const testTelephone = "010-1234-5678";
const testStudentNumber = "00000000";
const testMajor = "major1";

const colleges = <String>[
  '인문사회융합대학',
  '경영공학대학',
  '혁신공과대학',
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
    '행정학과',
    '소방행정학과',
  ],
  '경영공학대학': <String>[
    '경영학부',
    '경영과',
    '글로벌비즈니스과',
    '회계과',
    '경제학부',
    '경제금융과',
    '국제개발협력과',
    '호텔관광학부',
    '호텔경영과',
    '외식경영과',
    '관광경영과',
  ],
  '혁신공과대학': <String>[
    '바이오화학산업학부',
    '바이오공학및마케팅과',
    '융합화학산업과',
    '건성환경에너지공학부',
    '건설환경공학과',
    '환경에너지공항과',
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
};
