import 'package:flutter/material.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class TableCellWidget extends StatelessWidget {
  final str;
  const TableCellWidget({super.key, required this.str});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        '$str', 
        style: const TextStyle(
          color: ColorThema.black,
          fontWeight: FontWeight.bold
        )
      )
    );
  }
}