import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/views/widgets/RoundedDropdown.dart';

class CollegeMajorDropdown extends StatefulWidget {
  final String? selectedCollege;
  final String? selectedMajor;
  final ValueChanged<String?> onCollegeChanged;
  final ValueChanged<String?> onMajorChanged;

  const CollegeMajorDropdown({
    Key? key,
    this.selectedCollege,
    this.selectedMajor,
    required this.onCollegeChanged,
    required this.onMajorChanged,
  }) : super(key: key);

  @override
  _CollegeMajorDropdownState createState() => _CollegeMajorDropdownState();
}

class _CollegeMajorDropdownState extends State<CollegeMajorDropdown> {
  final Map<String, List<String>> collegeMajorMap = {
    '인문사회융합대학': [
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
    '경영공학대학': [
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
    '혁신공과대학': [
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
    '지능형SW융합대학': [
      '컴퓨터학부',
      '컴퓨터SW학과',
      '미디어SW학과',
      '정보통신학부',
      '정보통신학과',
      '정보보호학과',
      '데이터과학부',
    ],
    '라이프케어사이언스대학': [
      '간호학과',
      '아동가족복지학과',
      '의류학과',
      '식품영양학과',
      '스포츠과학부',
      '체육학과',
      '레저스포츠학과',
      '운동건강관리학과',
    ],
    '디자인앤아트대학': [
      '조형예술학부',
      '회화과',
      '조소과',
      '디자인학부',
      '커뮤니케이션디자인과',
      '패션디자인과',
      '공예디자인과',
    ],
    '음악테크놀로지대학': [
      '아트앤테크놀로지작곡과',
      '성악과',
      '피아노과',
      '관현악과',
      '국악과',
    ],
    '문화예술융합대학': [
      '아트앤엔터테인먼트학부',
      '영화술과',
      '연기예술과',
      '디지털콘텐츠과',
    ],
    '글로벌인재대학': [
      '자유전공학부',
    ],
  };

  String? selectedCollege;
  String? selectedMajor;

  @override
  void initState() {
    super.initState();
    selectedCollege = widget.selectedCollege;
    selectedMajor = widget.selectedMajor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RoundedDropdown(
          initValue: selectedCollege,
          onChanged: (String? newValue) {
            setState(() {
              selectedCollege = newValue;
              selectedMajor = null; // Reset major when college changes
              widget.onCollegeChanged(newValue);
              widget.onMajorChanged(null);
            });
          },
          items: collegeMajorMap.keys.toList(),
          hintText: '단과대학 선택',
          leftTopCornerRadius: 8.r,
          leftBottomCornerRadius: 8.r,
          rightTopCornerRadius: 8.r,
          rightBottomCornerRadius: 8.r,
          borderColor: const Color(0xFFCECECE),
          borderWidth: 1.w,
          marginTop: 32.h,
          marginLeft: 16.w,
          marginRight: 16.w,
        ),
        SizedBox(height: 8.h),
        RoundedDropdown(
          initValue: selectedMajor,
          onChanged: (String? newValue) {
            setState(() {
              selectedMajor = newValue;
              widget.onMajorChanged(newValue);
            });
          },
          items: _getMajorsForSelectedCollege(),
          hintText: '학부(학과) 선택',
          leftTopCornerRadius: 8.r,
          leftBottomCornerRadius: 8.r,
          rightTopCornerRadius: 8.r,
          rightBottomCornerRadius: 8.r,
          borderColor: const Color(0xFFCECECE),
          borderWidth: 1.w,
          marginLeft: 16.w,
          marginRight: 16.w,
        ),
      ],
    );
  }

  List<String> _getMajorsForSelectedCollege() {
    if (selectedCollege != null && collegeMajorMap.containsKey(selectedCollege)) {
      return collegeMajorMap[selectedCollege]!;
    }
    return [];
  }
}
