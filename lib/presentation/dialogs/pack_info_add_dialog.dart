import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:janmanager/application/state/pack_info_provider.dart';
import 'package:janmanager/application/state/usr_id_provider.dart';
import 'package:janmanager/domain/types/pack_info_model.dart';
import 'package:janmanager/influstructure/gcp/pack_info_servise.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';
import 'package:janmanager/presentation/thema/size_thema.dart';
import 'package:janmanager/presentation/widgets/common_widget/dialog_errMsg_widget.dart';
import 'package:janmanager/presentation/widgets/common_widget/dialog_item_widegt.dart';
import 'package:janmanager/presentation/widgets/common_widget/dialog_title_widget.dart';

class PackInfoAddDialog extends HookConsumerWidget {
  const PackInfoAddDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ユーザーID
    final userId = ref.read(userIdNotifireProvider);
    //インプットコントローラー
    final packNameController = useTextEditingController();
    final numController = useTextEditingController();
    final feeController = useTextEditingController();
    final timeController = useTextEditingController();
    final timeState = useState(false);
    final availavleState = useState('');
    final mondayState = useState(false);
    final tuesdayState = useState(false);
    final wednesdayState = useState(false);
    final thursdayState = useState(false);
    final fridayState = useState(false);
    final saturdayState = useState(false);
    final sundayState = useState(false);
    final autoCarryState = useState(true);

    //エラーメッセージ
    final packNameErrMsg = useState('');
    final numErrMsg = useState('');
    final feeErrMsg = useState('');
    final timeErrMsg = useState('');
    final availavleErrMsg = useState('');
    final autoCarryErrMsg = useState('');

    return AlertDialog(
      title: const DialogTitleWidget(title: '利用可能パック'),
      content: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(150),
                  1: FixedColumnWidth(50),
                  2: IntrinsicColumnWidth()
                },
                children: [
                  //パック名
                  TableRow(
                    children: [
                      const DialogItemWidget(text: 'パック名'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidthMin,
                        height: SizeThema.fieldHeightMin,
                        child: TextFormField(
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                          controller: packNameController,
                          cursorColor: ColorThema.black,
                          cursorHeight: SizeThema.cursorHeightMin,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorThema.green, width: 2)),
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                          ),
                        ),
                      )
                    ]
                  ),
                  //パック名エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: packNameErrMsg.value)
                    ]
                  ),
                  //人数
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '人数'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidth,
                        height: SizeThema.fieldHeightMin,
                        child: TextFormField(
                          controller: numController,
                          textInputAction: TextInputAction.next,
                          cursorColor: ColorThema.black,
                          cursorHeight: SizeThema.cursorHeightMin,
                          decoration: const InputDecoration(
                            hintText: '半角数字',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorThema.green, width: 2)),
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                          ),
                        ),
                      )
                    ]
                  ),
                  //人数エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: numErrMsg.value)
                    ]
                  ),
                  //料金
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '料金'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidth,
                        height: SizeThema.fieldHeightMin,
                        child: TextFormField(
                          controller: feeController,
                          textInputAction: TextInputAction.next,
                          cursorColor: ColorThema.black,
                          cursorHeight: SizeThema.cursorHeightMin,
                          decoration: const InputDecoration(
                            hintText: '半角数字',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorThema.green, width: 2)),
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                          ),
                        ),
                      )
                    ]
                  ),
                  //料金エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: feeErrMsg.value)
                    ]
                  ),
                  //利用時間
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '利用時間'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidth,
                        height: SizeThema.fieldHeightMin,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: SizeThema.timeWidth,
                              child: TextFormField(
                                enabled: !timeState.value,
                                controller: timeController,
                                keyboardType: TextInputType.number,
                                cursorColor: ColorThema.black,
                                cursorHeight: SizeThema.cursorHeightMin,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: const InputDecoration(
                                  hintText: '半角数字',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorThema.green, width: 2)),
                                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                                ),
                              ),
                            ),const Padding(padding: EdgeInsets.only(left: 5)),
                            const Text('時間'),
                            const Padding(padding: EdgeInsets.only(left: 10)),
                            Checkbox(
                              activeColor: ColorThema.green,
                              value: timeState.value,
                              onChanged: (value) {
                                timeState.value = value!;
                                if (value) timeController.text = '';
                              }
                            ),
                            const Text('制限なし'),
                          ],
                        )
                      )
                    ]
                  ),
                  //利用時間エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: timeErrMsg.value)
                    ]
                  ),
                  //利用可能日
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '利用可能日'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  activeColor: ColorThema.green,
                                  value: mondayState.value,
                                  onChanged: (value) {mondayState.value = value!;}
                                ),
                                const Text('月'),
                                const Padding(padding: EdgeInsets.only(left: 10)),
                                Checkbox(
                                  activeColor: ColorThema.green,
                                  value: tuesdayState.value,
                                  onChanged: (value) {tuesdayState.value = value!;}
                                ),
                                const Text('火'),
                                const Padding(padding: EdgeInsets.only(left: 10)),
                                Checkbox(
                                  activeColor: ColorThema.green,
                                  value: wednesdayState.value,
                                  onChanged: (value) {wednesdayState.value = value!;}
                                ),
                                const Text('水'),
                                const Padding(padding: EdgeInsets.only(left: 10)),
                                Checkbox(
                                  activeColor: ColorThema.green,
                                  value: thursdayState.value,
                                  onChanged: (value) {thursdayState.value = value!;}
                                ),
                                const Text('木'),
                                const Padding(padding: EdgeInsets.only(left: 10)),
                                Checkbox(
                                  activeColor: ColorThema.green,
                                  value: fridayState.value,
                                  onChanged: (value) {fridayState.value = value!;}
                                ),
                                const Text('金')
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  activeColor: ColorThema.green,
                                  value: saturdayState.value,
                                  onChanged: (value) {saturdayState.value = value!;}
                                ),
                                const Text('土'),
                                const Padding(padding: EdgeInsets.only(left: 10)),
                                Checkbox(
                                  activeColor: ColorThema.green,
                                  value: sundayState.value,
                                  onChanged: (value) {sundayState.value = value!;}
                                ),
                                const Text('日'),
                              ],
                            )
                          ],
                        ) 
                      )
                    ]
                  ),
                  //利用可能日エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: availavleErrMsg.value)
                    ]
                  ),
                  //自動更新
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '自動更新'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidth,
                        height: SizeThema.fieldHeightMin,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              activeColor: ColorThema.black,
                              value: true,
                              groupValue: autoCarryState.value,
                              onChanged: (value) {autoCarryState.value = value!;}
                            ),
                            const Text('する'),
                            const SizedBox(width: 20),
                            Radio(
                              activeColor: ColorThema.black,
                              value: false,
                              groupValue: autoCarryState.value,
                              onChanged: (value) {autoCarryState.value = value!;}
                            ),
                            const Text('しない'),
                          ],
                        ),
                      )
                    ]
                  ),
                  //自動更新エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: autoCarryErrMsg.value)
                    ]
                  ),
                ],
              ),
              //作成・キャンセルボタン
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () async {
                      //利用可能日文字列を作成
                      if (mondayState.value) availavleState.value += '0';
                      if (tuesdayState.value) availavleState.value += '1';
                      if (wednesdayState.value) availavleState.value += '2';
                      if (thursdayState.value) availavleState.value += '3';
                      if (fridayState.value) availavleState.value += '4';
                      if (saturdayState.value) availavleState.value += '5';
                      if (sundayState.value) availavleState.value += '6';
                      //利用可能パックサービスをインスタンス化
                      final packInfoServise = PackInfoServise();
                      //店舗情モデルを作成
                      final PackInfoModel packInfoModel = PackInfoModel(
                        userId: userId,
                        packName: packNameController.text,
                        num: int.parse(numController.text),
                        fee: int.parse(feeController.text),
                        time: int.parse((!timeState.value)?timeController.text:'0'),
                        availavle: availavleState.value,
                        autoCarry: autoCarryState.value
                      );
                      //利用可能パックを登録
                      packInfoServise.create(packInfoModel);
                      //状態管理している店舗情報を最新化
                      ref.read(packInfoNotifireProvider.notifier).reRead();
                      //ダイアログを閉じる
                      Navigator.pop(context);
                    },
                    child:  const Text('作成', style: TextStyle(color: ColorThema.green, fontWeight: FontWeight.bold)),
                  ),
                  TextButton(
                    onPressed: () {Navigator.pop(context);},
                    child: const Text('キャンセル', style: TextStyle(color: ColorThema.grey)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}