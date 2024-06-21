import 'package:flutter/material.dart';
import 'package:janmanager/influstructure/gcp/google_signin_auth.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class SignOutDialog extends StatefulWidget {
  const SignOutDialog({super.key});

  @override
  State<SignOutDialog> createState() => _SigOutDialogState();
}

class _SigOutDialogState extends State<SignOutDialog> {

  String errMsg = "";

  void setErrMsg() {
    errMsg = "ログアウトに失敗しました。";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('ログアウトしますか？'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            errMsg,
            style: const TextStyle(
              color: ColorThema.green
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () async {
                  // サービスを呼び出す
                  final service = GoogleSigninAuth();
                  await service.signout().catchError(
                    (e) {
                      setErrMsg();
                    },
                  );
                  Navigator.pop(context);
                },
                child: const Text('はい', style: TextStyle(color: ColorThema.green, fontWeight: FontWeight.bold)),
              ),
              TextButton(
                onPressed: () {Navigator.pop(context);},
                child: const Text('いいえ', style: TextStyle(color: ColorThema.grey)),
              ),
            ],
          )
        ],
      )
    );
  }
}
