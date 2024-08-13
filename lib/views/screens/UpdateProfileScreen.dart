import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/model/Circle.dart';
import 'package:usw_circle_link/viewmodels/UpdateProfileViewmodel.dart';
import 'package:usw_circle_link/views/screens/MainScreen.dart';
import 'package:usw_circle_link/views/widgets/RoundedDropdown.dart';
import 'package:usw_circle_link/views/widgets/RoundedTextField.dart';

class UpdateProfileScreen extends ConsumerStatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends ConsumerState<UpdateProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController studentnumberController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  String? selectedCollege;
  String? selectedMajor;

  bool isInitialized = false;

  bool isNameValid = true;
  bool isPhoneNumberValid = true;
  bool isStudentNumberValid = true;

  final token = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI0YzM0NmNjYS04ZjFkLTQ5OGQtOGQ1NS0zMjZmNjkzNjYzZjIiLCJyb2xlIjoiVVNFUiIsImNsdWJJZHMiOlsxXSwiaWF0IjoxNzIzNTM4NDI4LCJleHAiOjE3MjM1NDAyMjh9.UoCa60fsmnqWRCkgHHdPtb8otuQKfBF3Vy6bEFztMOo';

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchProfileData();
    });
  }

  void fetchProfileData() {
    ref.read(updateProfileViewmodel(token).future).then((profile) {
      if (mounted) {
        setState(() {
          nameController.text = profile.userName;
          phonenumberController.text = profile.userHp;
          studentnumberController.text = profile.studentNumber;
          departmentController.text = profile.major;
          selectedMajor = profile.major;
          isInitialized = true;
        });
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    phonenumberController.dispose();
    studentnumberController.dispose();
    departmentController.dispose();
    super.dispose();
  }

  bool validateName(String name) {
    final nameRegex = RegExp(r'^[가-힣]+$'); // 한글만 허용
    return nameRegex.hasMatch(name);
  }

  bool validatePhoneNumber(String phoneNumber) {
    final phoneNumberRegex = RegExp(r'^\d+$'); // 숫자만 허용
    return phoneNumberRegex.hasMatch(phoneNumber);
  }

  bool validateStudentNumber(String studentNumber) {
    final studentNumberRegex = RegExp(r'^\d+$'); // 숫자만 허용
    return studentNumberRegex.hasMatch(studentNumber);
  }

  @override
  Widget build(BuildContext context) {
    final profileAsyncValue = ref.watch(updateProfileViewmodel(token));

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(62.h),
          child: AppBar(
            scrolledUnderElevation: 0,
            toolbarHeight: 62.h,
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: const Color(0xffFFFFFF),
            automaticallyImplyLeading: false,
            title: SizedBox(
              width: 375.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      'assets/images/back.svg',
                      height: 36.h,
                      width: 36.w,
                    ),
                  ),
                  SizedBox(width: 69.8.w),
                  Text(
                    '내 정보 수정',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.111.h,
                      letterSpacing: -0.45.sp,
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ),
        body: profileAsyncValue.when(
          data: (profile) {
            if (!isInitialized) {
              // 데이터를 초기화
              nameController.text = profile.userName;
              phonenumberController.text = profile.userHp;
              studentnumberController.text = profile.studentNumber;
              departmentController.text = profile.major;
              selectedMajor = profile.major;
              isInitialized = true;
            }
            return buildForm(context);
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('오류가 발생했습니다: $error')),
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30.h),
          Row(
            children: [
              SizedBox(width: 36.w),
              Text(
                '이름',
                style: TextStyle(
                  color: const Color(0xff000000),
                  fontFamily: 'Pretendard',
                  fontSize: 16.sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              SizedBox(width: 32.w),
              Container(
                width: 311.w,
                child: RoundedTextField(
                  height: 50.h,
                  textEditController: nameController,
                  leftBottomCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  leftTopCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  borderColor: isNameValid ? const Color(0xffDBDBDB) : Colors.red,
                  borderWidth: 1.w,
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  textAlign: TextAlign.left,
                  hintText: "이름",
                  prefixIcon: SvgPicture.asset(
                    'assets/images/ic_person.svg',
                    width: 13.w,
                    height: 16.h,
                    fit: BoxFit.scaleDown,
                  ),
                  hintStyle: TextStyle(
                      fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              SizedBox(width: 36.w),
              Text(
                '전화번호',
                style: TextStyle(
                  color: const Color(0xff000000),
                  fontFamily: 'Pretendard',
                  fontSize: 16.sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              SizedBox(width: 32.w),
              Container(
                width: 311.w,
                child: RoundedTextField(
                  height: 50.h,
                  textEditController: phonenumberController,
                  leftBottomCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  leftTopCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  borderColor: isPhoneNumberValid ? const Color(0xffDBDBDB) : Colors.red,
                  borderWidth: 1.w,
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  textAlign: TextAlign.left,
                  prefixIcon: SvgPicture.asset(
                    'assets/images/ic_phone.svg',
                    width: 13.w,
                    height: 16.h,
                    fit: BoxFit.scaleDown,
                  ),
                  hintText: "전화번호 (- 제외입력)",
                  hintStyle: TextStyle(
                      fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              SizedBox(width: 36.w),
              Text(
                '학번',
                style: TextStyle(
                  color: const Color(0xff000000),
                  fontFamily: 'Pretendard',
                  fontSize: 16.sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              SizedBox(width: 32.w),
              Container(
                width: 311.w,
                child: RoundedTextField(
                  height: 50.h,
                  textEditController: studentnumberController,
                  leftBottomCornerRadius: 8.r,
                  rightBottomCornerRadius: 8.r,
                  leftTopCornerRadius: 8.r,
                  rightTopCornerRadius: 8.r,
                  borderColor: isStudentNumberValid ? const Color(0xffDBDBDB) : Colors.red,
                  borderWidth: 1.w,
                  maxLines: 1,
                  textInputType: TextInputType.text,
                  textAlign: TextAlign.left,
                  prefixIcon: SvgPicture.asset(
                    'assets/images/ic_tag.svg',
                    width: 13.w,
                    height: 16.h,
                    fit: BoxFit.scaleDown,
                  ),
                  hintText: "학번",
                  hintStyle: TextStyle(
                      fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              SizedBox(width: 36.w),
              Text(
                '학과',
                style: TextStyle(
                  color: const Color(0xff000000),
                  fontFamily: 'Pretendard',
                  fontSize: 16.sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              SizedBox(width: 32.w),
              Container(
                width: 311.w,
                child: GestureDetector(
                  onTap: () async {
                    await showCustomDialog(context);
                  },
                  child: AbsorbPointer(
                    child: RoundedTextField(
                      height: 50.h,
                      textEditController: departmentController,
                      leftBottomCornerRadius: 8.r,
                      rightBottomCornerRadius: 8.r,
                      leftTopCornerRadius: 8.r,
                      rightTopCornerRadius: 8.r,
                      borderColor: const Color(0xffDBDBDB),
                      borderWidth: 1.w,
                      maxLines: 1,
                      textInputType: TextInputType.none,
                      textAlign: TextAlign.left,
                      textInputAction: TextInputAction.done,
                      prefixIcon: SvgPicture.asset(
                        'assets/images/ic_bookmark.svg',
                        width: 13.w,
                        height: 16.h,
                        fit: BoxFit.scaleDown,
                      ),
                      suffixIcon: SvgPicture.asset(
                        'assets/images/>.svg',
                        width: 32.w,
                        height: 32.h,
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: selectedMajor ?? '학과',
                      hintStyle: TextStyle(
                          fontSize: 14.sp, fontFamily: 'Pretendard-Regular'),
                      isAnimatedHint: false,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 48.h),
          CustomButton(
            text: '수정 완료',
            onPressed: () {
              setState(() {
                isNameValid = validateName(nameController.text);
                isPhoneNumberValid = validatePhoneNumber(phonenumberController.text);
                isStudentNumberValid = validateStudentNumber(studentnumberController.text);
              });

              if (isNameValid && isPhoneNumberValid && isStudentNumberValid) {
                final updatedProfile = Circle(
                  userName: nameController.text,
                  studentNumber: studentnumberController.text,
                  userHp: phonenumberController.text,
                  major: selectedMajor ?? departmentController.text,
                );

                // token 변수를 여기에 잘 전달했는지 확인하세요.
                ref.read(ProfileProvider).updateProfile(token, updatedProfile).then((_) {
                  ref.refresh(updateProfileViewmodel(token));
                  showalarmCustomDialog(context).then((_) {
                    Navigator.pop(context);
                  });
                }).catchError((error) {
                  // Handle error
                  print('Error: $error');
                });
              }
            },
          )
        ],
      ),
    );
  }

  Future<void> showCustomDialog(BuildContext context) async {
    final result = await showDialog<Map<String, String?>>(
      context: context,
      builder: (BuildContext context) {
        String? localSelectedCollege = selectedCollege;
        String? localSelectedMajor = selectedMajor;

        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RoundedDropdown(
                      initValue: selectedCollege,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCollege = newValue;
                          selectedMajor = null; // 단과대학이 바뀌면 학과도 초기화합니다.
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
                      initValue: selectedMajor, // 여기에 selectedMajor를 전달
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMajor = newValue;
                          departmentController.text = newValue ?? '';
                        });
                      },
                      items: collegeMajorMap[selectedCollege] ?? [],
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
                    SizedBox(height: 20.h),
                    SizedBox.fromSize(
                      size: Size.fromHeight(1.h),
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xFFCECECE)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(
                            {'college': localSelectedCollege, 'major': localSelectedMajor});
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size.fromHeight(50.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.zero, bottom: Radius.circular(15.r)),
                        ),
                      ),
                      child: Text(
                        "확인",
                        style: TextStyle(
                          color: Color(0xFF0085FF),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedCollege = result['college'];
        selectedMajor = result['major'];
      });
    }
  }

  List<String> getMajorsForSelectedCollege() {
    if (selectedCollege != null && collegeMajorMap.containsKey(selectedCollege)) {
      return collegeMajorMap[selectedCollege]!;
    }
    return [];
  }

  Future<void> showalarmCustomDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.zero,
            width: 270.w,
            height: 125.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: const Color(0xffffffff),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 15.h),
                Text(
                  "알림",
                  style: TextStyle(
                    color: const Color(0xff111111),
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    fontFamily: "Pretendard",
                    fontStyle: FontStyle.normal,
                    height: 1.11.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "내 정보가 수정되었습니다",
                  style: TextStyle(
                    color: const Color(0xff767676),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontFamily: "Pretendard",
                    fontStyle: FontStyle.normal,
                    height: 1.14.sp,
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                    width: 275.w,
                    height: 1.h,
                    decoration: BoxDecoration(color: Color(0xffdadada))),
                SizedBox(height: 1.h),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  child: Text(
                    "확인",
                    style: TextStyle(
                      color: const Color(0xff0085FF),
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      fontFamily: "Pretendard",
                      fontStyle: FontStyle.normal,
                      height: 1.11.sp,
                    ),
                  ),
                  style: ButtonStyle(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.sp,
      width: 311.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: const Color(0xff000000),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: const Color(0xffffffff),
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Pretendard',
            height: 1.111.sp,
          ),
        ),
      ),
    );
  }
}
