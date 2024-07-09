import 'package:flutter/material.dart';
import 'package:janmanager/domain/types/pack_info_model.dart';
import 'package:janmanager/presentation/dialogs/pack_info_delete_dialog.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class PackInfoDeleteBtnWidget extends StatelessWidget {
  final PackInfoModel packInfoModel;
  const PackInfoDeleteBtnWidget({super.key, required this.packInfoModel});

  @override
  Widget build(BuildContext context) {

    return TextButton(
      onPressed: () {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return PackInfoDeleteDialog(packInfoModel: packInfoModel);
          }
        );
      }, 
      child: const Text(
        '削除',
        style: TextStyle(
          color: ColorThema.red,
          fontWeight: FontWeight.bold
        ),
      )
    );
  }
}