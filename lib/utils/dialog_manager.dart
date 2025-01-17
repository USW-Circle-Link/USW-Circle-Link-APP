import 'package:flutter/material.dart';
import 'package:usw_circle_link/const/data.dart';
import 'package:usw_circle_link/views/widgets/alert_text_dialog.dart';
import 'package:usw_circle_link/views/widgets/major_picker_dialog.dart';
import 'package:usw_circle_link/views/widgets/policy_dialog.dart';

class DialogManager {
  DialogManager._();

  static final DialogManager instance = DialogManager._();

  /// ### showAlertDialog 함수 사용법 :
  /// #### 1. 글씨 종류
  /// * title 은 굵은 글씨
  /// * content 는 가는 글씨
  /// #### 2. 버튼 사용법 (중요!!)
  /// * 버튼 두개 사용시 [leftButtonText]와 [rightButtonText] 인자로 넘겨야함
  /// * 버튼 하나만 사용할 시 [leftButtonText]만 인자로 넘김
  Future<void> showAlertDialog({
    required BuildContext context,
    String? title,
    String? content,
    String? leftButtonText,
    String? rightButtonText,
    Function()? onLeftButtonPressed,
    Function()? onRightButtonPressed,
    bool barrierDismissible = true,
    Color? titleColor, // 제목 색상
    Color? contentColor, // 내용 색상
    Color? leftButtonColor, // 왼쪽 버튼 색상
    Color? rightButtonColor, // 오른쪽 버튼 색상
  }) async {
    await showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (_) => AlertTextDialog(
        title: title ?? "알림",
        content: content,
        leftButtonText: rightButtonText == null ? '확인' : leftButtonText,
        rightButtonText: rightButtonText,
        onLeftButtonPressed: onLeftButtonPressed,
        onRightButtonPressed: onRightButtonPressed,
        titleColor: titleColor ?? const Color(0xFF000000), // 기본 제목 색상
        contentColor: contentColor ?? const Color(0xFF767676), // 기본 내용 색상
        leftButtonColor: leftButtonColor ?? const Color(0xFF0085FF), // 기본 왼쪽 버튼 색상
        rightButtonColor: rightButtonColor ?? const Color(0xFF0085FF), // 기본 오른쪽 버튼 색상
      ),
    );
  }


  Future<void> showMajorPickerDialog({
    required BuildContext context,
    String? defaultCollege,
    String? defaultMajor,
    void Function(String? newCollege, String? newMajor)? onChanged,
    required void Function(String? college, String? major) onConfirmPressed,
  }) async {
    await showDialog(
      context: context,
      builder: (_) => MajorPickerDialog(
        colleges: colleges,
        majors: majors,
        selectedCollege: defaultCollege,
        selectedMajor: defaultMajor,
        onChanged: onChanged,
        onConfirmPressed: onConfirmPressed,
      ),
    );
  }

  Future<bool> showPolicyDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (_) => PolicyDialog()
    ) ?? true;
  }
}
