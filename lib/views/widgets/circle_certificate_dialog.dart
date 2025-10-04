

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as ref;

import '../../viewmodels/certificate_view_model.dart';


// void CertificateDialog() {
//   showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext) {
class CircleCertificateDialog extends ConsumerWidget{
   const CircleCertificateDialog ({super.key});

        @override
        Widget build(BuildContext context, WidgetRef ref) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text("동아리 인증코드 입력"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('취소'),
              ),
              ElevatedButton(
                onPressed: () =>
                    ref.read(certificateViewModelProvider.notifier)
                        .certificate(),
                child: Text('확인'),
              ),
            ],
          );
        }
        }
//       },
//   );
// }
// class CircleCertificateDialog extends ConsumerWidget{
//   const CircleCertificateDialog ({super.key});


  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   return AlertDialog(
  //     title: Text("동아리 인증"),
  //     content: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         TextField(
  //           style: TextStyle(fontSize: 15),
  //           textAlign: TextAlign.center,
  //         ),
  //       ],
  //     ),
  //     actions: [
  //       TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text('취소'),
  //       ),
  //       ElevatedButton(
  //           onPressed: () => ref.read(cirtificateViewModelProvider.notifier).certificate(),
  //           child: Text('확인'),
  //       ),
  //     ],
  //   );
  // }
