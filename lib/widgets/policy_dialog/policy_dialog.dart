import 'package:flutter/material.dart';
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
        // 16.w -> 16.0 으로 변경하여 고정값으로 만듭니다.
        padding: const EdgeInsets.all(16.0),
        child: PolicyScreen(
          policyType: widget.policyType,
          isDialog: true,
        ),
      ),
    );
  }
}