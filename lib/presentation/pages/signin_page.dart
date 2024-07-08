import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';
import 'package:janmanager/presentation/thema/size_thema.dart';
import 'package:janmanager/presentation/widgets/signin/signin_attention_widget.dart';
import 'package:janmanager/presentation/widgets/signin/signin_bar_widget.dart';
import 'package:janmanager/presentation/widgets/signin/signin_google_btn_widget.dart';
import 'package:janmanager/presentation/widgets/signin/signin_title_widget.dart';
import 'package:janmanager/presentation/widgets/signin/signin_twitter_btn_widget.dart';

class SigninPage extends ConsumerWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorThema.whiteGrey,
              ColorThema.green
            ]
          )
        ),
        child: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: SizeThema.fieldWidthMid,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(80),
                    SigninTitleWidget(),
                    Gap(20),
                    SigninBarWidget(),
                    Gap(20),
                    SigninGoogleBtnWidget(),
                    Gap(20),
                    SigninTwitterBtnWidget(),
                    Gap(50),
                    SigninAttentionWidget(),
                    Gap(80)
                  ],
                ),
              )
            ],
          ),
        ) ,
      ),
    );
  }
}