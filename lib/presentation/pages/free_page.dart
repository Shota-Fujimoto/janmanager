import 'package:flutter/material.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class FreePage extends StatelessWidget {
  const FreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: ColoredBox(
        color: ColorThema.whiteGrey,
        child: Center(
          child: Text('フリー'),
        ),
      )
    );
  }
}