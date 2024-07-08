import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:janmanager/domain/types/menu_item.dart';
import 'package:janmanager/presentation/dialogs/signout_dialog.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';
import 'package:janmanager/presentation/thema/size_thema.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //メニューのインデックス
    final selectedIndex = useState(0);
    //メニュークラスのインスタンス
    MenuItem menuItem = MenuItem();

    return Scaffold(
      //ヘッダー
      appBar: AppBar(
        elevation: 3,
        shadowColor: ColorThema.grey,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: SizeThema.appbarSide),
            //タイトル
            Text(
              'Janmanager',
              style: GoogleFonts.lobsterTwo(
                fontSize: SizeThema.fontSizeElephant,
              ),
            ),
          ],
        ),
        backgroundColor: ColorThema.green,
        foregroundColor: ColorThema.white,
        actions: <Widget>[
          //ログアウトボタン
          IconButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return const SignOutDialog();
                }
              );
            },
            icon: const Icon(Icons.login_rounded)
          ),
          const SizedBox(width: 25)
        ],
      ),
      //メインコンテンツ
      body: ColoredBox(
        color: ColorThema.whiteGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (context, constraint) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: NavigationRail(
                        labelType: NavigationRailLabelType.all,
                        elevation: 7,
                        backgroundColor: ColorThema.white,
                        minExtendedWidth: 170,
                        useIndicator: false,
                        selectedIconTheme: const IconThemeData(color: ColorThema.green),
                        selectedLabelTextStyle: const TextStyle(color: ColorThema.green),
                        unselectedIconTheme: const IconThemeData(color: ColorThema.grey),
                        unselectedLabelTextStyle: const TextStyle(color: ColorThema.grey),
                        destinations: [
                          //メニューアイテムを作成
                          for (final menu in menuItem.menuList.keys)
                            NavigationRailDestination(
                              icon: Icon(menuItem.menuList[menu]),
                              label: Text(menu),
                            ),
                        ],
                        selectedIndex: selectedIndex.value,
                        onDestinationSelected: (index) {
                          selectedIndex.value = index;
                        },
                      ),
                    ),
                  ),
                );
              }
            ),
            //表示するページを選択
            menuItem.selectPage(selectedIndex.value)
          ],
        ),
      ) 
    );
  }
}