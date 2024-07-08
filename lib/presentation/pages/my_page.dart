import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:janmanager/application/state/pack_info_provider.dart';
import 'package:janmanager/application/state/tenpo_info_provider.dart';
import 'package:janmanager/presentation/widgets/common_widget/category_widget.dart';
import 'package:janmanager/presentation/widgets/common_widget/error_contents_widget.dart';
import 'package:janmanager/presentation/widgets/common_widget/indicator_widget.dart';
import 'package:janmanager/presentation/widgets/mypage/pack_info_btn_widget.dart';
import 'package:janmanager/presentation/widgets/mypage/pack_info_table_widget.dart';
import 'package:janmanager/presentation/widgets/mypage/tenpo_info_btn_widget.dart';
import 'package:janmanager/presentation/widgets/mypage/tenpo_info_table_widget.dart';

class MyPage extends HookConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //店舗情報を取得
    final asyncTenpoInfo = ref.watch(tenpoInfoNotifireProvider);
    //エラー・処理中処理
    if (asyncTenpoInfo.hasError) {
      return const ErrorContentsWidget();
    }
    if (!asyncTenpoInfo.hasValue) {
      return const IndicatorWidget();
    }
    final tenpoInfo = asyncTenpoInfo.value!;


    //利用可能パックを取得
    final asyncPackInfo = ref.watch(packInfoNotifireProvider);
    //エラー処理
    if (asyncPackInfo.hasError) {
      return const ErrorContentsWidget();
    }
    if (!asyncPackInfo.hasValue) {
      return const IndicatorWidget();
    }
    final packInfo = asyncPackInfo.value!;



    //画面サイズ取得
    final screenSize = MediaQuery.of(context).size;
    final contensWidth = screenSize.width*0.8;


    
    return Container(
      margin: EdgeInsets.symmetric(vertical: screenSize.height*0.01, horizontal: screenSize.width*0.01),
      width: contensWidth,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CategoryWidget(title: '店舗情報'),
            TenpoInfoTableWidget(tenpoInfo: tenpoInfo),
            const Padding(padding: EdgeInsets.only(top: 20)),
            TenpoInfoBtnWidget(tenpoInfo: tenpoInfo),
            const Padding(padding: EdgeInsets.only(top: 50)),
            const CategoryWidget(title: '利用可能パック'),
            PackInfoTableWidget(packInfo: packInfo),
            const Padding(padding: EdgeInsets.only(top: 20)),
            const PacKInfoBtnWidget(),
            const Padding(padding: EdgeInsets.only(top: 50)),
            const CategoryWidget(title: 'フリールール'),
            TenpoInfoTableWidget(tenpoInfo: tenpoInfo),
            const Padding(padding: EdgeInsets.only(top: 20)),
            TenpoInfoBtnWidget(tenpoInfo: tenpoInfo),
            const Padding(padding: EdgeInsets.only(top: 50)),
          ],
        ),
      ),
    );
  }
}