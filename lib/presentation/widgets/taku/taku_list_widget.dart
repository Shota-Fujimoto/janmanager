import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janmanager/influstructure/gcp/taku_servise.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class TakuListWidget extends ConsumerWidget {
  final String userId;
  const TakuListWidget({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final takuList = [];
    
    void createTakuList(id) async {
      final takuServise = TakuServise();
      await takuServise.read(id);
        for (final taku in takuList) {
          takuList.add(taku.takuName);
        }
    }

    createTakuList(userId);
    print(takuList);

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
              child: Text(takuList[index], style: const TextStyle(color: ColorThema.black),)
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