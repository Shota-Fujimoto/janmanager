import 'package:flutter/material.dart';
import 'package:janmanager/domain/types/pack_info_model.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class PackInfoTableWidget extends StatelessWidget {
  final List<PackInfoModel> packInfo;
  const PackInfoTableWidget({super.key, required this.packInfo});

  @override
  Widget build(BuildContext context) {

    //ブレークポイント
    double breakPoint = 800;

    //画面サイズ取得
    final screenSize = MediaQuery.of(context).size;
    double screenRate = 0.16;
    if (screenSize.width < breakPoint) {
      screenRate = 1;
    }
    final columnWidth = screenSize.width*0.9*screenRate;

    //カラムを作成
    List<DataColumn> _buildTableColumns() {
      if (packInfo.isNotEmpty) {
        if (screenSize.width >= breakPoint) {
          return [
            DataColumn(label: SizedBox(width: columnWidth, child: const Text('パック名'),), numeric: false),
            DataColumn(label: SizedBox(width: columnWidth, child: const Text('人数'),), numeric: false),
            DataColumn(label: SizedBox(width: columnWidth, child: const Text('料金'),), numeric: false),
            DataColumn(label: SizedBox(width: columnWidth, child: const Text('時間'),), numeric: false),
            DataColumn(label: SizedBox(width: columnWidth, child: const Text('利用可能日'),), numeric: false),
            DataColumn(label: SizedBox(width: columnWidth, child: const Text('自動繰越'),), numeric: false),
          ];
        }else {
          return [
            DataColumn(label: SizedBox(width: columnWidth, child: const Text('パック名'),), numeric: false)
          ];
        }
      }else {
        if (screenSize.width >= breakPoint) {
          return [
            DataColumn(label: SizedBox(width: columnWidth, child: const Text('パック名'),), numeric: false),
            DataColumn(label: SizedBox(width: columnWidth, child: const Text('人数'),), numeric: false),
            DataColumn(label: SizedBox(width: columnWidth, child: const Text('料金'),), numeric: false),
            DataColumn(label: SizedBox(width: columnWidth, child: const Text('時間'),), numeric: false),
            DataColumn(label: SizedBox(width: columnWidth, child: const Text('利用可能日'),), numeric: false),
            DataColumn(label: SizedBox(width: columnWidth, child: const Text('自動繰越'),), numeric: false),
          ];
        }else {
          return [
            DataColumn(label: SizedBox(width: columnWidth, child: const Text('パック名'),), numeric: false)
          ];
        }
      }
    }

    //データ行を作成
    List<DataRow> _buildTableRows() {
      if (packInfo.isNotEmpty) {
        return packInfo.map((model) {
          if (screenSize.width >= breakPoint) {
            return DataRow(
              cells: [
                DataCell(Text(model.packName!)),
                DataCell(Text(model.num!.toString())),
                DataCell(Text(model.fee!.toString())),
                DataCell(Text(model.time!)),
                DataCell(Text(model.availavle!)),
                DataCell(Text(model.autoCarry!)),
              ]
            );
          }else {
            return const DataRow(
              cells: [
                DataCell(Text(''))
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
                DataCell(Text(''))
              ]
            )
          ];
        }else {
          return [
            const DataRow(
              cells: [
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