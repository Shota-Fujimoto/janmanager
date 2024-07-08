import 'package:janmanager/application/state/usr_id_provider.dart';
import 'package:janmanager/domain/types/tenpo_info_model.dart';
import 'package:janmanager/influstructure/gcp/tenpo_info_servise.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'tenpo_info_provider.g.dart';

@riverpod
class TenpoInfoNotifire extends _$TenpoInfoNotifire {
  @override
  Future<TenpoInfoModel> build() async {
    //店舗情報サービスをインスタンス化
    TenpoInfoServise tenpoInfoServise = TenpoInfoServise();
    //ユーザーIDを取得
    final userId = ref.read(userIdNotifireProvider);
    //店舗情報を返す
    return await tenpoInfoServise.read(userId);
  }

  Future<void> reRead() async {
    //エラーチェック
    if (state.value == null) {
      throw Exception(
        '店舗情報読み込みエラーです。'
      );
    }
    //店舗情報を更新
    final TenpoInfoServise tenpoInfoServise = TenpoInfoServise();
    final userId = ref.read(userIdNotifireProvider);
    TenpoInfoModel tenpoInfoModel = await tenpoInfoServise.read(userId);
    state = AsyncValue.data(tenpoInfoModel);
  }
}

