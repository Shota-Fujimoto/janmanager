import 'package:flutter/material.dart';
import 'package:janmanager/domain/types/taku_model.dart';
import 'package:janmanager/influstructure/gcp/taku_servise.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';
import 'package:janmanager/presentation/thema/size_thema.dart';

class AddTakuDialog extends StatefulWidget {
  final String userId;
  const AddTakuDialog({super.key, required this.userId});

  @override
  State<AddTakuDialog> createState() => _AddTakuDialogState();
}

class _AddTakuDialogState extends State<AddTakuDialog> {
  //卓名
  String _takuName = '';
  //配牌
  String _haipai = 'auto';
  //三麻
  String _sanma = 'ok';
  //喫煙
  String _smoke = 'all';
  //学生料金(/h)
  String _feeStudent = '';
  //一般料金(/h)
  String _feeIppan = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('新規卓作成', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: ColorThema.green),),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(150),
              1: FixedColumnWidth(50),
              2: IntrinsicColumnWidth(),
            },
            children: [
              //卓名
              TableRow(
                children: [
                  const Center(child: Text('卓名', style: TextStyle(fontSize: 18),)),
                  const Center(child: Text(':', style: TextStyle(fontSize: 18),)),
                  SizedBox(
                    width: SizeThema.fieldWidth,
                    height: SizeThema.fieldHeightMin,
                    child: TextField(
                      cursorColor: ColorThema.grey,
                      cursorHeight: SizeThema.fieldHeightMin-15,
                      decoration: const InputDecoration(
                        hintText: '8文字以内',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorThema.green, width: 2)),
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                      ),
                      onChanged: (text) {
                        setState(() {
                          _takuName = text;
                        });
                      },
                    )
                  )
                ]
              ),
              //エラーメッセージ（卓名）
              TableRow(
                children: [
                  Container(),
                  Container(),
                  const SizedBox(height: 20)
                ]
              ),
              //配牌
              TableRow(
                children: [
                  const Center(child: Text('配牌', style: TextStyle(fontSize: 18),)),
                  const Center(child: Text(':', style: TextStyle(fontSize: 18),)),
                  SizedBox(
                    width: SizeThema.fieldWidth,
                    height: SizeThema.fieldHeightMin,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          activeColor: ColorThema.black,
                          value: 'auto',
                          groupValue: _haipai,
                          onChanged: (value) {
                            setState(() {
                              _haipai = value!;
                            });
                          }
                        ),
                        const Text('自動'),
                        const SizedBox(width: 20),
                        Radio(
                          activeColor: ColorThema.black,
                          value: '-',
                          groupValue: _haipai,
                          onChanged: (value) {
                            setState(() {
                              _haipai = value!;
                            });
                          }
                        ),
                        const Text('手動'),
                      ],
                    ),
                  )
                ]
              ),
              //エラーメッセージ（配牌）
              TableRow(
                children: [
                  Container(),
                  Container(),
                  const SizedBox(height: 20,)
                ]
              ),
              //三麻
              TableRow(
                children: [
                  const Center(child: Text('三麻', style: TextStyle(fontSize: 18),)),
                  const Center(child: Text(':', style: TextStyle(fontSize: 18),)),
                  SizedBox(
                    width: SizeThema.fieldWidth,
                    height: SizeThema.fieldHeightMin,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          activeColor: ColorThema.black,
                          value: 'ok',
                          groupValue: _sanma,
                          onChanged: (value) {
                            setState(() {
                              _sanma = value!;
                            });
                          }
                        ),
                        const Text('可能'),
                        const SizedBox(width: 20),
                        Radio(
                          activeColor: ColorThema.black,
                          value: '-',
                          groupValue: _sanma,
                          onChanged: (value) {
                            setState(() {
                              _sanma = value!;
                            });
                          }
                        ),
                        const Text('不可'),
                      ],
                    ),
                  )
                ]
              ),
              //エラーメッセージ（三麻）
              TableRow(
                children: [
                  Container(),
                  Container(),
                  const SizedBox(height: 20,)
                ]
              ),
              //喫煙
              TableRow(
                children: [
                  const Center(child: Text('喫煙', style: TextStyle(fontSize: 18),)),
                  const Center(child: Text(':', style: TextStyle(fontSize: 18),)),
                  SizedBox(
                    width: SizeThema.fieldWidth,
                    height: SizeThema.fieldHeightMin,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          activeColor: ColorThema.black,
                          value: 'all',
                          groupValue: _smoke,
                          onChanged: (value) {
                            setState(() {
                              _smoke = value!;
                            });
                          }
                        ),
                        const Text('可能'),
                        const SizedBox(width: 20),
                        Radio(
                          activeColor: ColorThema.black,
                          value: 'only',
                          groupValue: _smoke,
                          onChanged: (value) {
                            setState(() {
                              _smoke = value!;
                            });
                          }
                        ),
                        const Text('電子のみ'),
                        const SizedBox(width: 20),
                        Radio(
                          activeColor: ColorThema.black,
                          value: '-',
                          groupValue: _smoke,
                          onChanged: (value) {
                            setState(() {
                              _smoke = value!;
                            });
                          }
                        ),
                        const Text('不可'),
                      ],
                    ),
                  )
                ]
              ),
              //エラーメッセージ（喫煙）
              TableRow(
                children: [
                  Container(),
                  Container(),
                  const SizedBox(height: 20,)
                ]
              ),
              //学生料金
              TableRow(
                children: [
                  const Center(child: Text('学生料金(/h)', style: TextStyle(fontSize: 18))),
                  const Center(child: Text(':', style: TextStyle(fontSize: 18))),
                  SizedBox(
                    width: SizeThema.fieldWidth,
                    height: SizeThema.fieldHeightMin,
                    child: TextField(
                      cursorColor: ColorThema.grey,
                      cursorHeight: SizeThema.fieldHeightMin-15,
                      decoration: const InputDecoration(
                        hintText: '半角数字のみ',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorThema.green, width: 2)),
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                      ),
                      onChanged: (text) {
                        setState(() {
                          _feeStudent = text;
                        });
                      },
                    )
                  )
                ]
              ),
              //エラーメッセージ（学生料金）
              TableRow(
                children: [
                  Container(),
                  Container(),
                  const SizedBox(height: 20,)
                ]
              ),
              //一般料金
              TableRow(
                children: [
                  const Center(child: Text('一般料金(/h)', style: TextStyle(fontSize: 18))),
                  const Center(child: Text(':', style: TextStyle(fontSize: 18))),
                  SizedBox(
                    width: SizeThema.fieldWidth,
                    height: SizeThema.fieldHeightMin,
                    child: TextField(
                      cursorColor: ColorThema.grey,
                      cursorHeight: SizeThema.fieldHeightMin-15,
                      decoration: const InputDecoration(
                        hintText: '半角数字のみ',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorThema.green, width: 2)),
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)
                      ),
                      onChanged: (text) {
                        setState(() {
                          _feeIppan = text;
                        });
                      },
                    )
                  )
                ]
              ),
              //エラーメッセージ（一般料金）
              TableRow(
                children: [
                  Container(),
                  Container(),
                  const SizedBox(height: 20,)
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
                  final TakuModel takuModel = TakuModel(
                    userId: widget.userId,
                    takuName: _takuName,
                    haipai: _haipai,
                    sanma: _sanma,
                    smoke: _smoke,
                    feeStudent: _feeStudent,
                    feeIppan: _feeIppan
                  );
                  final takuServise = TakuServise();
                  List<TakuModel> takuList = await takuServise.read(widget.userId);
                  for (final taku in takuList) {
                    print(taku.takuName);
                  }
                  takuServise.create(takuModel);
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

    );
  }
}