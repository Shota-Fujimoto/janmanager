import 'package:flutter/material.dart';
import 'package:janmanager/domain/types/tenpo_info_model.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class TenpoInfoTableWidget extends StatelessWidget {
  final TenpoInfoModel tenpoInfo;
  const TenpoInfoTableWidget({super.key, required this.tenpoInfo});

  @override
  Widget build(BuildContext context) {

    //表示用変数
    String tenpoName = '';
    String phoneNum = '';
    String addressNum = '';
    String address = '';
    String openTime = '';
    String seatCnt = '';
    String smoke = '';

    //表示用変数加工
    if (tenpoInfo.userId != null) {
      tenpoName = tenpoInfo.tenpoName!;
      phoneNum = tenpoInfo.phoneNum!;
      addressNum = tenpoInfo.addressNum!;
      address = tenpoInfo.address1!+tenpoInfo.address2!+tenpoInfo.address3!+tenpoInfo.address4!;
      openTime = tenpoInfo.startTime!+' ~ '+tenpoInfo.endTime!;
      seatCnt = tenpoInfo.seatCnt.toString();
      smoke = (tenpoInfo.smoke == 'true')?'あり':'なし';
    }

    //画面サイズ取得
    final screenSize = MediaQuery.of(context).size;
    final columnWidth = screenSize.width*0.9*0.5;

    return FittedBox(
      child: DataTable(
        //罫線
        border: TableBorder.all(color: ColorThema.grey),
        //カラムの色
        headingRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          return ColorThema.green;
        }),
        //ヘッダーのテキストスタイル
        headingTextStyle: const TextStyle(color: ColorThema.white, fontWeight: FontWeight.bold),
        //データ行の色
        dataRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          return ColorThema.white;
        }),
        //データ行のテキストスタイル
        dataTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        //カラム
        columns: [
          DataColumn(label: SizedBox(width: columnWidth, child: const Text('項目'),), numeric: false),
          DataColumn(label: SizedBox(width: columnWidth, child: const Text('登録内容')), numeric: false)
        ],
        //データ行
        rows: [
          DataRow(cells: [
            const DataCell(Text('店舗名')),
            DataCell(Text('$tenpoName'))
          ]),
          DataRow(cells: [
            const DataCell(Text('電話番号')),
            DataCell(Text('$phoneNum'))
          ]),
          DataRow(cells: [
            const DataCell(Text('郵便番号')),
            DataCell(Text('$addressNum'))
          ]),
          DataRow(cells: [
            const DataCell(Text('住所')),
            DataCell(Text('$address'))
          ]),
          DataRow(cells: [
            const DataCell(Text('営業時間')),
            DataCell(Text('$openTime'))
          ]),
          DataRow(cells: [
            const DataCell(Text('卓数')),
            DataCell(Text('$seatCnt'))
          ]),
          DataRow(cells: [
            const DataCell(Text('喫煙席')),
            DataCell(Text('$smoke'))
          ]),
        ],
      )
    );
  }
}