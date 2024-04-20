import 'package:flutter/material.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';
import 'package:janmanager/presentation/thema/size_thema.dart';

class SigninBarWidget extends StatelessWidget {
  const SigninBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: SizeThema.fieldWidth,
      height: SizeThema.fieldHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              height: 2,
              thickness: 1,
              endIndent: 5,
              color: ColorThema.grey,
            ),
          ),
        ],
      ),
    );
  }
}