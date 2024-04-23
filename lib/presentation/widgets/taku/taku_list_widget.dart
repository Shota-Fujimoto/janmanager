import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janmanager/application/state/taku_models_provider.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class TakuListWidget extends ConsumerWidget {
  final String userId;
  const TakuListWidget({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // 卓モデルたち(AsyncValue)
    final asyncTakuList = ref.watch(takuModelsNotifireProvider);

    //エラー・処理中処理
    if (asyncTakuList.hasError) {
      return const Text('エラーのときに出すWidget');
    }
    if (!asyncTakuList.hasValue) {
      return const Text('データ準備中に出すWidget');
    }

    //卓リスト
    final takuList = asyncTakuList.value!;

    return SizedBox(
      width: 1000,
      child: ListView.separated(
        itemCount: takuList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorThema.white,
                foregroundColor: ColorThema.green,
                elevation: 0
              ),
              onPressed: () {}, 
              child: Text(takuList[index].takuName!, style: const TextStyle(color: ColorThema.black),)
            ),
          );
        },
        separatorBuilder:  (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
      )
    );
  }
}