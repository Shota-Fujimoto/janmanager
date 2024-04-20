import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janmanager/application/state/signin_state.dart';
import 'package:janmanager/presentation/widgets/taku/add_taku_btn_widget.dart';
import 'package:janmanager/presentation/widgets/taku/taku_list_widget.dart';

class TakuPage extends ConsumerWidget {
  const TakuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ユーザーIDを取得
    final String userId = ref.read(userIdProvider);

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddTakuBtnWidget(userId: userId),
                TakuListWidget(userId: userId)
              ],
            )
          ),
        ],
      ) 
    );
  }
}