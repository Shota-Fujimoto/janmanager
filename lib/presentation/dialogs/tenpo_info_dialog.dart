import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:janmanager/application/state/tenpo_info_provider.dart';
import 'package:janmanager/application/state/usr_id_provider.dart';
import 'package:janmanager/domain/types/tenpo_info_model.dart';
import 'package:janmanager/influstructure/api/address_servise.dart';
import 'package:janmanager/influstructure/gcp/tenpo_info_servise.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';
import 'package:janmanager/presentation/thema/size_thema.dart';
import 'package:janmanager/presentation/widgets/common_widget/dialog_errMsg_widget.dart';
import 'package:janmanager/presentation/widgets/common_widget/dialog_item_widegt.dart';
import 'package:janmanager/presentation/widgets/common_widget/dialog_title_widget.dart';

class TenpoInfoDialog extends HookConsumerWidget {
  const TenpoInfoDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ユーザーID
    final userId = ref.read(userIdNotifireProvider);
    //インプットコントローラー
    final tenpoNameController = useTextEditingController();
    final phoneNumController = useTextEditingController();
    final addressNumController = useTextEditingController();
    final address1Controller = useTextEditingController();
    final address2Controller = useTextEditingController();
    final address3Controller = useTextEditingController();
    final address4Controller = useTextEditingController();
    final startTimeController = useTextEditingController();
    final endTimeController = useTextEditingController();
    final seatCntController = useTextEditingController();
    final smokeState = useState('true');
    //エラーメッセージ
    final tenpoNameErrMsg = useState('');
    final phoneNumErrMsg = useState('');
    final addressNumErrMsg = useState('');
    final address1ErrMsg = useState('');
    final address2ErrMsg = useState('');
    final address3ErrMsg = useState('');
    final address4ErrMsg = useState('');
    final startTimeErrMsg = useState('');
    final endTimeErrMsg = useState('');
    final seatCntErrMsg = useState('');
    final smokeErrMsg = useState('');

    return AlertDialog(
      title: const DialogTitleWidget(title: '店舗情報'),
      content: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Table(
                columnWidths: const <int,TableColumnWidth>{
                  0: FixedColumnWidth(150),
                  1: FixedColumnWidth(50),
                  2: IntrinsicColumnWidth()
                },
                children: [
                  //店舗名
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '店舗名'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidthMin,
                        height: SizeThema.fieldHeightMin,
                        child: TextFormField(
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                          controller: tenpoNameController,
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
                  //店舗名エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: tenpoNameErrMsg.value)
                    ]
                  ),
                  //電話番号
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '電話番号'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidth,
                        height: SizeThema.fieldHeightMin,
                        child: TextFormField(
                          controller: phoneNumController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          cursorColor: ColorThema.black,
                          cursorHeight: SizeThema.cursorHeightMin,
                          decoration: const InputDecoration(
                            hintText: 'ハイフンなし半角数字',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorThema.green, width: 2)),
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                          ),
                        ),
                      )
                    ]
                  ),
                  //電話番号エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: phoneNumErrMsg.value)
                    ]
                  ),
                  //郵便番号
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '郵便番号'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidth,
                        height: SizeThema.fieldHeightMin,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: SizeThema.zipcodeWidth,
                              child: TextFormField(
                                controller: addressNumController,
                                keyboardType: TextInputType.number,
                                cursorColor: ColorThema.black,
                                cursorHeight: SizeThema.cursorHeightMin,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(7),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: const InputDecoration(
                                  hintText: 'ハイフンなし半角数字',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorThema.green, width: 2)),
                                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                                ),
                                onChanged: (zipcode) async {
                                  
                                },
                              ),
                            ),
                            SizedBox(
                              width: SizeThema.btnWidth,
                              child: TextButton(
                                onPressed: () async {
                                  //郵便番号を取得
                                  final addressNum = addressNumController.text;
                                  //数字7桁以外は処理しない
                                  if (addressNum.length != 7) {
                                    addressNumErrMsg.value = '正しく郵便番号を入力してください。';
                                    return;
                                  };
                                  //インジケーター表示
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const Center(
                                        child: CircularProgressIndicator(
                                          color: ColorThema.green,
                                        ),
                                      );
                                    },
                                  );
                                  //住所検索
                                  final addressServise = AddressServise();
                                  final result = await addressServise.searchAddress(addressNum);
                                  if (result != null) {
                                    address1Controller.text = result.address1;
                                    address2Controller.text = result.address2;
                                    address3Controller.text = result.address3;
                                    addressNumErrMsg.value = '';
                                  } else {
                                    // 結果がなければエラーメッセージ表示
                                    addressNumErrMsg.value = '住所が存在しません。';
                                  }
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  '自動入力',
                                  style: TextStyle(
                                    color: ColorThema.green,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ),
                            ),
                          ],
                        )
                      ),
                    ]
                  ),
                  //郵便番号エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: addressNumErrMsg.value)
                    ]
                  ),
                  //都道府県
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '都道府県'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidth,
                        height: SizeThema.fieldHeightMin,
                        child: TextFormField(
                          controller: address1Controller,
                          textInputAction: TextInputAction.next,
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
                  //都道府県エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: address1ErrMsg.value)
                    ]
                  ),
                  //市区町村
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '市区町村'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidth,
                        height: SizeThema.fieldHeightMin,
                        child: TextFormField(
                          controller: address2Controller,
                          textInputAction: TextInputAction.next,
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
                  //市区町村エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: address2ErrMsg.value)
                    ]
                  ),
                  //番地
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '番地'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidth,
                        height: SizeThema.fieldHeightMin,
                        child: TextFormField(
                          controller: address3Controller,
                          textInputAction: TextInputAction.next,
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
                  //番地エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: address3ErrMsg.value)
                    ]
                  ),
                  //建物名
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '建物名'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidth,
                        height: SizeThema.fieldHeightMin,
                        child: TextFormField(
                          controller: address4Controller,
                          textInputAction: TextInputAction.next,
                          cursorColor: ColorThema.black,
                          cursorHeight: SizeThema.cursorHeightMin,
                          decoration: const InputDecoration(
                            hintText: '任意',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorThema.green, width: 2)),
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                          ),
                        ),
                      )
                    ]
                  ),
                  //建物名エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: address4ErrMsg.value)
                    ]
                  ),
                  //営業開始時間
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '営業開始時間'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidth,
                        height: SizeThema.fieldHeightMin,
                        child: TextFormField(
                          controller: startTimeController,
                          textInputAction: TextInputAction.next,
                          cursorColor: ColorThema.black,
                          cursorHeight: SizeThema.cursorHeightMin,
                          decoration: const InputDecoration(
                            hintText: '例)9:00',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorThema.green, width: 2)),
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                          ),
                        ),
                      )
                    ]
                  ),
                  //営業開始時間エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: startTimeErrMsg.value)
                    ]
                  ),
                  //営業終了時間
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '営業終了時間'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidth,
                        height: SizeThema.fieldHeightMin,
                        child: TextFormField(
                          controller: endTimeController,
                          textInputAction: TextInputAction.next,
                          cursorColor: ColorThema.black,
                          cursorHeight: SizeThema.cursorHeightMin,
                          decoration: const InputDecoration(
                            hintText: '例)23:00',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorThema.green, width: 2)),
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                          ),
                        ),
                      )
                    ]
                  ),
                  //営業終了時間エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: endTimeErrMsg.value)
                    ]
                  ),
                  //席数
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '席数'),
                      const DialogItemWidget(text: ':'),
                      SizedBox(
                        width: SizeThema.fieldWidth,
                        height: SizeThema.fieldHeightMin,
                        child: TextFormField(
                          controller: seatCntController,
                          textInputAction: TextInputAction.next,
                          cursorColor: ColorThema.black,
                          cursorHeight: SizeThema.cursorHeightMin,
                          decoration: const InputDecoration(
                            hintText: '任意',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorThema.green, width: 2)),
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                          ),
                        ),
                      )
                    ]
                  ),
                  //席数エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: seatCntErrMsg.value)
                    ]
                  ),
                  //喫煙席
                  TableRow(
                    children: [
                      const DialogItemWidget(text: '喫煙席'),
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
                              value: 'true',
                              groupValue: smokeState.value,
                              onChanged: (value) {smokeState.value = value.toString();}
                            ),
                            const Text('あり'),
                            const SizedBox(width: 20),
                            Radio(
                              activeColor: ColorThema.black,
                              value: 'false',
                              groupValue: smokeState.value,
                              onChanged: (value) {smokeState.value = value.toString();}
                            ),
                            const Text('なし'),
                          ],
                        ),
                      )
                    ]
                  ),
                  //喫煙エラーメッセージ
                  TableRow(
                    children: [
                      Container(),
                      Container(),
                      DialogErrMsgWidget(errMsg: smokeErrMsg.value)
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
                      //店舗情報サービスをインスタンス化
                      final tenpoInfoServise = TenpoInfoServise();
                      //店舗情モデルを作成
                      final TenpoInfoModel tenpoInfoModel = TenpoInfoModel(
                        userId: userId,
                        tenpoName: tenpoNameController.text,
                        phoneNum: phoneNumController.text,
                        addressNum: addressNumController.text,
                        address1: address1Controller.text,
                        address2: address2Controller.text,
                        address3: address3Controller.text,
                        address4: address4Controller.text,
                        startTime: startTimeController.text,
                        endTime: endTimeController.text,
                        seatCnt: int.parse(seatCntController.text),
                        smoke: smokeState.value
                      );
                      //店舗情報を登録
                      tenpoInfoServise.create(tenpoInfoModel);
                      //状態管理している店舗情報を最新化
                      ref.read(tenpoInfoNotifireProvider.notifier).reRead();
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
        )
      )
    );
  }
}