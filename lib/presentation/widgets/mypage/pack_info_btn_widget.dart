import 'package:flutter/material.dart';
import 'package:janmanager/presentation/dialogs/tenpo_info_dialog.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';
import 'package:janmanager/presentation/thema/size_thema.dart';

class PacKInfoBtnWidget extends StatelessWidget {
  const PacKInfoBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: SizeThema.fieldWidth,
      height: SizeThema.fieldHeightMin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorThema.green
        ),
        child: const Text(
          '追加',
          style: TextStyle(
            color: ColorThema.white,
            fontWeight: FontWeight.bold
          ),),
        onPressed: () {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return const TenpoInfoDialog();
            }
          );
        },
      ),
    );
  }
}