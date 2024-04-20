import 'package:flutter/material.dart';
import 'package:janmanager/presentation/pages/event_page.dart';
import 'package:janmanager/presentation/pages/free_page.dart';
import 'package:janmanager/presentation/pages/taku_page.dart';

class MenuItem {

  Map<String, IconData> menuList = {
    '卓': Icons.table_restaurant,
    'フリー': Icons.people_alt,
    'イベント': Icons.event_available
  };

  Widget selectPage(index) {
    const List<Widget> pageList = [
      TakuPage(),
      FreePage(),
      EventPage()
    ];

    return pageList[index];
  }
}