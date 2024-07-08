import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:janmanager/domain/types/pack_info_model.dart';

class PackInfoServise {
  final db = FirebaseFirestore.instance;

  Future<void> create(packInfoModel) async {
    //新ドキュメントを取得
    final docRef = db.collection('janmanager_packInfo').withConverter(
      fromFirestore: PackInfoModel.fromFirestore,
      toFirestore: (PackInfoModel packInfoModel, options) => packInfoModel.toFirestore()
    ).doc();

    //データをセット
    await docRef.set(packInfoModel);
  }

  Future<List<PackInfoModel>> read(userId) async {
    try {
      //ドキュメントを取得
      final ref = db.collection('janmanager_packInfo').where('userId', isEqualTo: userId).withConverter(
        fromFirestore: PackInfoModel.fromFirestore,
        toFirestore: (PackInfoModel packInfoModel, _) => packInfoModel.toFirestore()
      );

      //データを取得
      final docSnap = await ref.get();
      //リスト化
      final List<PackInfoModel> packList = docSnap.docs.map((doc) => PackInfoModel(
        userId: doc['userId'],
        packName: doc['packName'],
        num: doc['num'],
        fee: doc['fee'],
        time: doc['time'],
        availavle: doc['availavle'],
        autoCarry: doc['autoCarry']
      )).toList();

      return packList;
      
    }catch(e) {
      return [PackInfoModel()];
    }
    
  }
}