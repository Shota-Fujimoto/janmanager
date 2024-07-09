import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:janmanager/domain/types/pack_info_model.dart';

class PackInfoServise {
  final db = FirebaseFirestore.instance;



  //CREATE
  Future<void> create(packInfoModel) async {
    //新ドキュメントを取得
    final docRef = db.collection('janmanager_packInfo').withConverter(
      fromFirestore: PackInfoModel.fromFirestore,
      toFirestore: (PackInfoModel packInfoModel, options) => packInfoModel.toFirestore()
    ).doc();

    //データをセット
    await docRef.set(packInfoModel);
  }



  //READ
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
        documentId: doc.id,
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


  //UPDATE
  Future<void> update(PackInfoModel packInfoModel) async {
    //更新
    await db.collection('janmanager_packInfo').doc(packInfoModel.documentId).withConverter(
      fromFirestore: PackInfoModel.fromFirestore,
      toFirestore: (PackInfoModel packInfoModel, options) => packInfoModel.toFirestore()
    ).set(packInfoModel);
  }


  //DELETE
  Future<void> delete(documentId) async {
    //削除
    await db.collection('janmanager_packInfo').doc(documentId).delete();
  }


}