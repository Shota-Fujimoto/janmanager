import 'package:flutter/material.dart';
import 'package:janmanager/influstructure/gcp/google_signin_auth.dart';
import 'package:janmanager/presentation/thema/size_thema.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SigninGoogleBtnWidget extends StatelessWidget {
  const SigninGoogleBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeThema.fieldWidth,
      height: SizeThema.fieldHeight,
      child: SignInButton(
        Buttons.google, 
        text: 'Googleで始める',
        onPressed: () async {
          final servise = GoogleSigninAuth();
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