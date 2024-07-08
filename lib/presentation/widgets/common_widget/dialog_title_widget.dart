import 'package:flutter/material.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';
import 'package:janmanager/presentation/thema/size_thema.dart';

class DialogTitleWidget extends StatelessWidget {
  final String title;
  const DialogTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title',
      style: const TextStyle(
        fontSize: SizeThema.fontSizeElephant,
        fontWeight: FontWeight.bold,
        color: ColorThema.green
      ),
    );
  }
}