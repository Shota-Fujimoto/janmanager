import 'package:flutter/material.dart';
import 'package:janmanager/domain/types/pack_info_model.dart';
import 'package:janmanager/presentation/dialogs/pack_info_edit_dialog.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class PackInfoEditBtnWidget extends StatelessWidget {
  final PackInfoModel packInfoModel;
  const PackInfoEditBtnWidget({super.key, required this.packInfoModel});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return PackInfoEditDialog(packInfoModel: packInfoModel);
          }
        );
      }, 
      child: const Text(
        '編集',
        style: TextStyle(
          color: ColorThema.green,
          fontWeight: FontWeight.bold
        ),
      )
    );
  }
}