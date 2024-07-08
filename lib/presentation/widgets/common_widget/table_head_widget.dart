import 'package:flutter/material.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class TableHeadWidget extends StatelessWidget {
  final str;
  const TableHeadWidget({super.key, required this.str});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        '$str', 
        style: const TextStyle(
          color: ColorThema.white,
          fontWeight: FontWeight.bold
        )
      )
    );
  }
}