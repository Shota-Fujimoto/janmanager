import 'package:flutter/material.dart';
import 'package:janmanager/presentation/pages/event_page.dart';
import 'package:janmanager/presentation/pages/free_page.dart';
import 'package:janmanager/presentation/pages/menu_page.dart';
import 'package:janmanager/presentation/pages/my_page.dart';
import 'package:janmanager/presentation/pages/profit_page.dart';
import 'package:janmanager/presentation/pages/stock_page.dart';
import 'package:janmanager/presentation/pages/taku_edit_page.dart';
import 'package:janmanager/presentation/pages/taku_ope_page.dart';

class MenuItem {

  Map<String, IconData> menuList = {
    '卓編集': Icons.dashboard_customize,
    '卓管理': Icons.dashboard,
    'イベント': Icons.event,
    'フリー': Icons.people_alt,
    '売上': Icons.analytics,
    '在庫': Icons.source,
    'メニュー': Icons.description,
    'マイページ': Icons.manage_accounts
  };

  Widget selectPage(index) {
    const List<Widget> pageList = [
      TakuEditPage(),
      TakuOpePage(),
      EventPage(),
      FreePage(),
      ProfitPage(),
      StockPage(),
      MenuPage(),
      MyPage()
    ];

    return pageList[index];
  }
}