import 'package:janmanager/application/state/usr_id_provider.dart';
import 'package:janmanager/domain/types/taku_model.dart';
import 'package:janmanager/influstructure/gcp/taku_servise.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'taku_models_provider.g.dart';

typedef TakuModelList = List<TakuModel>;

@riverpod
class TakuModelsNotifire extends _$TakuModelsNotifire {
  @override
  Future<TakuModelList> build() async {
    //卓サービスをインスタンス化
    TakuServise takuServise = TakuServise();
    //ユーザーIDを取得
    final userId = ref.read(userIdNotifireProvider);
    //卓リストを返す
    return await takuServise.read(userId);
  }

  Future<void> reRead() async {
    // エラーチェック
    if (state.value == null) {
      // エラー
      throw Exception(
        'まだ最初のデータがないのに追加しようとしました',
      );
    }

    
    final takuServise = TakuServise();
    final userId = ref.read(userIdNotifireProvider);
    List<TakuModel> newTakuModels = await takuServise.read(userId);
    state = AsyncValue.data(newTakuModels);

    // // 古いモデルたち
    // final oldModels = state.value!;
    // // 新しいモデルたち (List.of でコピーしてから使う)
    // final newModels = List.of(oldModels);
    // // データに追加
    // newModels.add(newModel);

    // // 状態を上書き
    // state = AsyncValue.data(newModels);
  }
}