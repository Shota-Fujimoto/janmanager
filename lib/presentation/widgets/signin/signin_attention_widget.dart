import 'package:flutter/material.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';
import 'package:janmanager/presentation/thema/size_thema.dart';

class SigninAttentionWidget extends StatelessWidget {
  const SigninAttentionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: SizeThema.fieldWidth,
      child: Text(
        'アカウントをお持ちでない方はどちらかでアカウントを作成してからご利用を開始して下さい。',
        style: TextStyle(
          color: ColorThema.grey
        ),
      ),
    );
  }
}