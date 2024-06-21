import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'usr_id_provider.g.dart';

@riverpod
class UserIdNotifire extends _$UserIdNotifire {
  @override
  String build() {
    //Authをインスタンス化
    final auth = FirebaseAuth.instance;
    //ユーザーIDを取得
    final userId = auth.currentUser?.uid.toString();

    if (userId == null) {
      return '';
    }
    else {
      return userId;
    }
  }
}