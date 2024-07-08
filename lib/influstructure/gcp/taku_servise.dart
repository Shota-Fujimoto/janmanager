import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:janmanager/domain/types/taku_model.dart';

class TakuServise {
  final db = FirebaseFirestore.instance;

  Future<void> create(takuModel) async {
    //新ドキュメントを取得
    final docRef = db.collection('janmanager_taku').withConverter(
      fromFirestore: TakuModel.fromFirestore,
      toFirestore: (TakuModel takuModel, options) => takuModel.toFirestore(),
    ).doc();

    //データをセット
    await  docRef.set(takuModel);
  }

  Future<List<TakuModel>> read(userId) async {
    //ドキュメントを取得
    final ref = db.collection('janmanager_taku').where('userId', isEqualTo: userId).orderBy('no').withConverter(
      fromFirestore: TakuModel.fromFirestore,
      toFirestore: (TakuModel takuModel, _) => takuModel.toFirestore(),
    );

    //データを取得
    final docSnap = await ref.get();
    //リスト化
    final List<TakuModel> takuList = docSnap.docs.map((doc) => TakuModel(
      id: doc.id,
      userId: doc['userId'],
      haipai: doc['haipai'],
      sanma: doc['sanma'],
      smoke: doc['smoke'],
      feeStudent: doc['feeStudent'],
      feeIppan: doc['feeIppan']
    )).toList();

    return takuList;
            
  }

  Future<int> count(userId) async {
    //件数の戻り値
    int cnt = 0;
    //件数を取得
    final ref = db.collection('janmanager_taku').count().get().then(
      (res) => cnt = res.count!
    );
    
    return cnt;
  }

}