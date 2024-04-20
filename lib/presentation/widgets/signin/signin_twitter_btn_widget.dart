import 'package:flutter/material.dart';
import 'package:janmanager/influstructure/gcp/twitter_signin_auth.dart';
import 'package:janmanager/presentation/thema/size_thema.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SigninTwitterBtnWidget extends StatelessWidget {
  const SigninTwitterBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeThema.fieldWidth,
      height: SizeThema.fieldHeight,
      child: SignInButton(
        Buttons.twitter, 
        text: 'Twitterで始める',
        onPressed: () async {
          final servise = TwitterSignInAuth();
          await servise.signIn().catchError(
            (e) {
              debugPrint('サインインできませんでした $e');
            },
          );
        }
      ),
    ) ;
  }
}