import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usw_circle_link/views/screens/policy_scren.dart';

class PolicyDialog extends StatefulWidget {
  const PolicyDialog({Key? key, required this.policyType}) : super(key: key);

  final PolicyType policyType;

  @override
  _PolicyDialogState createState() => _PolicyDialogState();
}

class _PolicyDialogState extends State<PolicyDialog> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.of(context).pop(false);
        }
      },
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: PolicyScreen(
          policyType: widget.policyType,
          isDialog: true,
        ),
      ),
    );
  }
}
