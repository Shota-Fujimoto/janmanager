import 'package:flutter/material.dart';
import 'package:janmanager/domain/types/pack_info_model.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';
import 'package:janmanager/presentation/widgets/mypage/pack_info_delete_btn_widget.dart';
import 'package:janmanager/presentation/widgets/mypage/pack_info_edit_btn_widget.dart';

class PackInfoTableWidget extends StatelessWidget {
  final List<PackInfoModel> packInfo;
  const PackInfoTableWidget({super.key, required this.packInfo});

  @override
  Widget build(BuildContext context) {

    //ブレークポイント
    double breakPoint = 800;

    //画面サイズ取得
    final screenSize = MediaQuery.of(context).size;
    double screenRate = 0.12;
    if (screenSize.width < breakPoint) {
      screenRate = 0.7;
    }
    final columnWidth = screenSize.width*0.9*screenRate;

    //カラムを作成
    List<DataColumn> _buildTableColumns() {
      if (screenSize.width >= breakPoint) {
        return [
          const DataColumn(label: Text('')),
          const DataColumn(label: Text('')),
          DataColumn(label: SizedBox(width: columnWidth, child: const Text('パック名'),), numeric: false),
          DataColumn(label: SizedBox(width: columnWidth, child: const Text('人数（人）'),), numeric: false),
          DataColumn(label: SizedBox(width: columnWidth, child: const Text('料金（円）'),), numeric: false),
          DataColumn(label: SizedBox(width: columnWidth, child: const Text('時間（時間）'),), numeric: false),
          DataColumn(label: SizedBox(width: columnWidth, child: const Text('利用可能日'),), numeric: false),
          DataColumn(label: SizedBox(width: columnWidth, child: const Text('自動延長'),), numeric: false),
        ];
      }else {
        return [
          const DataColumn(label: Text('')),
          const DataColumn(label: Text('')),
          DataColumn(label: SizedBox(width: columnWidth, child: const Text('パック名'),), numeric: false)
        ];
      }
    }

    //データ行を作成
    List<DataRow> _buildTableRows() {
      if (packInfo.isNotEmpty) {
        return packInfo.map((model) {
          if (screenSize.width >= breakPoint) {
            //表示データ加工
            String availavleStr = model.availavle!;
            availavleStr = availavleStr.replaceAll('0', '月');
            availavleStr = availavleStr.replaceAll('1', '火');
            availavleStr = availavleStr.replaceAll('2', '水');
            availavleStr = availavleStr.replaceAll('3', '木');
            availavleStr = availavleStr.replaceAll('4', '金');
            availavleStr = availavleStr.replaceAll('5', '土');
            availavleStr = availavleStr.replaceAll('6', '日');
            String timeStr = model.time!.toString();
            if (model.time! == 0) timeStr = '制限なし';
            String autoCarryStr = 'しない';
            if (model.autoCarry!) autoCarryStr='する';
            
            return DataRow(
              cells: [
                DataCell(PackInfoDeleteBtnWidget(packInfoModel: model)),
                DataCell(PackInfoEditBtnWidget(packInfoModel: model,)),
                DataCell(Text(model.packName!)),
                DataCell(Text(model.num!.toString())),
                DataCell(Text(model.fee!.toString())),
                DataCell(Text(timeStr)),
                DataCell(Text(availavleStr)),
                DataCell(Text(autoCarryStr)),
              ]
            );
          }else {
            return DataRow(
              cells: [
                DataCell(PackInfoDeleteBtnWidget(packInfoModel: model)),
                DataCell(PackInfoEditBtnWidget(packInfoModel: model)),
                DataCell(Text(model.packName!))
              ]
            );
          }
        }).toList();
      }else {
        if (screenSize.width >= breakPoint) {
          return [
            const DataRow(
              cells: [
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text(''))
              ]
            )
          ];
        }else {
          return [
            const DataRow(
              cells: [
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
              ]
            )
          ];
        }
      }
    }

    //表示用テーブル
    DataTable tableWidget = DataTable(
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
      columns: _buildTableColumns(),
      rows: _buildTableRows()
    );

    return FittedBox(
      child: tableWidget,
    );
  }
}