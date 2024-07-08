import 'package:flutter/material.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class DialogErrMsgWidget extends StatelessWidget {
  final errMsg;
  const DialogErrMsgWidget({super.key, required this.errMsg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        '$errMsg', 
        style: const TextStyle(
          color: ColorThema.red
        )
      )
    );
  }
}