import 'package:flutter/material.dart';
import 'package:janmanager/presentation/thema/size_thema.dart';

class DialogItemWidget extends StatelessWidget {
  final String text;
  const DialogItemWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$text',
        style: TextStyle(
          fontSize: SizeThema.fontSizeTiger
        ),
      ),
    );
  }
}