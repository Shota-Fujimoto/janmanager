import 'package:flutter/material.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class ProfitPage extends StatelessWidget {
  const ProfitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: ColoredBox(
        color: ColorThema.whiteGrey,
        child: Center(
          child: Text('売上'),
        ),
      )
    );
  }
}