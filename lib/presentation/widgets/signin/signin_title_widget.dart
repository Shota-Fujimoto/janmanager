import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';
import 'package:janmanager/presentation/thema/size_thema.dart';

class SigninTitleWidget extends StatelessWidget {
  const SigninTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Janmanager',
      style: GoogleFonts.lobsterTwo(
        fontSize: SizeThema.fontSizeTitle,
        color: ColorThema.green
      ),
    );
  }
}