import 'package:janmanager/application/state/usr_id_provider.dart';
import 'package:janmanager/domain/types/pack_info_model.dart';
import 'package:janmanager/influstructure/gcp/pack_info_servise.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pack_info_provider.g.dart';

typedef PackInfoModelList = List<PackInfoModel>;

@riverpod
class PackInfoNotifire extends _$PackInfoNotifire {
  @override
  Future<PackInfoModelList> build() async {
    //利用可能パックサービスをインスタンス化
    PackInfoServise packInfoServise = PackInfoServise();
    //ユーザーIDを取得
    final userId = ref.read(userIdNotifireProvider);
    //パックリストを返す
    return await packInfoServise.read(userId);
  }

  Future<void> reRead() async {
    //エラーチェック
    if (state.value == null) {
      //エラー
      throw Exception('利用可能パックの取得に失敗しました');
    }

    final packInfoServise = PackInfoServise();
    final userId = ref.read(userIdNotifireProvider);
    List<PackInfoModel> newPackInfoModels = await packInfoServise.read(userId);
    state = AsyncValue.data(newPackInfoModels);
  }
}