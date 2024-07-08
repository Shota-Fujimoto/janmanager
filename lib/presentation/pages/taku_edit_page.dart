import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janmanager/application/state/usr_id_provider.dart';
import 'package:janmanager/presentation/widgets/common_widget/category_widget.dart';
import 'package:janmanager/presentation/widgets/taku_edit/taku_table_widget.dart';

class TakuEditPage extends ConsumerWidget {
  const TakuEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ユーザーIDを取得
    String userId = ref.read(userIdNotifireProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      width: 1100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CategoryWidget(title: '雀卓'),
          TakuTableWidget(userId: userId, ref: ref)
        ],
      ) 
    );
  }
}