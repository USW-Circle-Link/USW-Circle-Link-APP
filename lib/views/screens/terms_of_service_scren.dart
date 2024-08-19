import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usw_circle_link/views/widgets/text_font_widget.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Padding(
            padding: EdgeInsets.only(left: 22.w), // 여백 설정
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // 이전 화면으로 돌아가기
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset(
                    'assets/images/ic_back_arrow.svg',
                  ),
                ),
                Text(
                  '이용 약관',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w), // 전체 여백 설정
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 이용약관 텍스트
                TextFontWidget.fontRegular(
                  text: '동구라미 서비스 이용약관\n\n'
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
                      '또한, 천재지변, 전쟁 등의 불가항력적 사유로 인한 서비스 제공의 중단에 대해서도 책임을 지지 않습니다.\n\n'
                     ,
                  fontSize: 12.sp,
                  color: Colors.black, fontweight: FontWeight.w300,
          
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
