import 'package:flutter/material.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorThema.green
      ),
    );
  }
}