import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:janmanager/domain/types/tenpo_info_model.dart';

class TenpoInfoServise {
  final db = FirebaseFirestore.instance;

  Future<void> create(tenpoInfoModel) async {
    //新ドキュメントを取得
    final docRef = db.collection('janmanager_tenpoInfo').withConverter(
      fromFirestore: TenpoInfoModel.fromFirestore,
      toFirestore: (TenpoInfoModel tenpoInfoModel, options) => tenpoInfoModel.toFirestore()
    ).doc();

    await docRef.set(tenpoInfoModel);
  }

  Future<TenpoInfoModel> read(userId) async {
    try {
      //ドキュメントを取得
      final ref = db.collection('janmanager_tenpoInfo').where('userId', isEqualTo: userId).withConverter(
        fromFirestore: TenpoInfoModel.fromFirestore, 
        toFirestore: (TenpoInfoModel tenpoInfoModel, _) => tenpoInfoModel.toFirestore()
      );

      //データを取得
      final docSnap = await ref.get();
      //リスト化
      final List<TenpoInfoModel> tenpoInfoList = docSnap.docs.map((doc) => TenpoInfoModel(
        userId: doc['userId'],
        tenpoName: doc['tenpoName'],
        phoneNum: doc['phoneNum'],
        addressNum: doc['addressNum'],
        address1: doc['address1'],
        address2: doc['address2'],
        address3: doc['address3'],
        address4: doc['address4'],
        startTime: doc['startTime'],
        endTime: doc['endTime'],
        seatCnt: doc['seatCnt'],
        smoke: doc['smoke'],
      )).toList();

      return tenpoInfoList[0];
    }catch(e) {
      print(e);
      return TenpoInfoModel();
    }
  }

  Future<int> count(userId) async {
    //件数の戻り値
    int cnt = 0;

    //件数を取得
    final ref = db.collection('janmanager_tenpoInfo').count().get().then(
      (res) => cnt = res.count!
    );

    return cnt;
  }
}