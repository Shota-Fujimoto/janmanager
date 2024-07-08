import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janmanager/presentation/dialogs/add_taku_dialog.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class TakuTableWidget extends StatelessWidget {
  final String userId;
  final WidgetRef ref;
  const TakuTableWidget({super.key, required this.userId, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: ColorThema.grey),
      columnWidths: <int, TableColumnWidth>{
        0: FixedColumnWidth(80),
        1: FixedColumnWidth(80),
        2: FixedColumnWidth(100),
        3: FixedColumnWidth(100),
        4: FixedColumnWidth(100),
        5: FixedColumnWidth(100),
        6: FixedColumnWidth(100),
        7: FixedColumnWidth(400),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: ColorThema.green
          ),
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: Text('No', style: TextStyle(color: ColorThema.white))
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: Text('配牌', style: TextStyle(color: ColorThema.white))
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: Text('点数表示', style: TextStyle(color: ColorThema.white))
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: Text('一般料金', style: TextStyle(color: ColorThema.white))
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: Text('学生料金', style: TextStyle(color: ColorThema.white))
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: Text('三麻利用', style: TextStyle(color: ColorThema.white))
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: Text('喫煙', style: TextStyle(color: ColorThema.white))
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: Text('適用可能パック', style: TextStyle(color: ColorThema.white))
            ),
          ]
        ),
        TableRow(
          children: [
            TextButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) {
                    return AddTakuDialog(userId: userId, ref: ref);
                  }
                );
              }, 
              child: Text('追加', style: TextStyle(color: ColorThema.green))
            ),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
          ]
        )
      ],
    );
  }
}