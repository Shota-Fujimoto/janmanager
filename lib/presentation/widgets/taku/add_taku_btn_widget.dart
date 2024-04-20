import 'package:flutter/material.dart';
import 'package:janmanager/presentation/dialogs/add_taku_dialog.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class AddTakuBtnWidget extends StatelessWidget {
  final String userId;
  const AddTakuBtnWidget({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorThema.white,
          foregroundColor: ColorThema.green,
          elevation: 0,
          shape: const CircleBorder(
            side: BorderSide(color: ColorThema.green, width: 1, style: BorderStyle.solid)
          )
        ),
        onPressed: () {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return AddTakuDialog(userId: userId);
            }
          );
        },
        child: const Icon(Icons.add, color: ColorThema.green),
      ),
    );
  }
}