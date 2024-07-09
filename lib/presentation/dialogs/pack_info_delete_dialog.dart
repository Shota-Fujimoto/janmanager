import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:janmanager/application/state/pack_info_provider.dart';
import 'package:janmanager/domain/types/pack_info_model.dart';
import 'package:janmanager/influstructure/gcp/pack_info_servise.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';
import 'package:janmanager/presentation/widgets/common_widget/dialog_item_widegt.dart';

class PackInfoDeleteDialog extends HookConsumerWidget {
  final PackInfoModel packInfoModel;
  const PackInfoDeleteDialog({super.key, required this.packInfoModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //エラーメッセージ
    final errMsg = useState('');

    return AlertDialog(
      title: const Text('以下のパックを削除しますか？'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            errMsg.value,
            style: const TextStyle(
              color: ColorThema.green
            ),
          ),
          Table(
            columnWidths: const <int,TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: FixedColumnWidth(50),
              2: IntrinsicColumnWidth()
            },
            children: [
              TableRow(
                children: [
                  const DialogItemWidget(text: 'パック名'),
                  const DialogItemWidget(text: ':'),
                  DialogItemWidget(text: packInfoModel.packName!)
                ]
              )
            ],
          ),
          const Gap(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () async {
                  // サービスを呼び出す
                  final packInfoServise = PackInfoServise();
                  await packInfoServise.delete(packInfoModel.documentId).catchError(
                    (e) {
                      errMsg.value = e;
                    },
                  );
                  //状態管理している店舗情報を最新化
                  ref.read(packInfoNotifireProvider.notifier).reRead();
                  //ダイアログを閉じる
                  Navigator.pop(context);
                },
                child: const Text('はい', style: TextStyle(color: ColorThema.red, fontWeight: FontWeight.bold)),
              ),
              TextButton(
                onPressed: () {Navigator.pop(context);},
                child: const Text('いいえ', style: TextStyle(color: ColorThema.grey)),
              ),
            ],
          )
        ],
      )
    );
  }
}