import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:janmanager/domain/types/tenpo_info_model.dart';
import 'package:janmanager/presentation/dialogs/tenpo_info_dialog.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';
import 'package:janmanager/presentation/thema/size_thema.dart';

class TenpoInfoBtnWidget extends ConsumerWidget {
  final TenpoInfoModel tenpoInfo;
  const TenpoInfoBtnWidget({super.key, required this.tenpoInfo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //ボタンテキスト
    String btnTxt = '登録';
    if (tenpoInfo.userId != null) {
      btnTxt = '編集';
    }

    return SizedBox(
      width: SizeThema.fieldWidth,
      height: SizeThema.fieldHeightMin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorThema.green
        ),
        child: Text(
          '$btnTxt',
          style: const TextStyle(
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