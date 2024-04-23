//卓情報モデル
import 'package:cloud_firestore/cloud_firestore.dart';

class TakuModel {
  final String? id;
  final String? userId;
  final String? takuName;
  final String? haipai;
  final String? sanma;
  final String? smoke;
  final String? feeStudent;
  final String? feeIppan;

  TakuModel({
    this.id,
    this.userId,
    this.takuName,
    this.haipai,
    this.sanma,
    this.smoke,
    this.feeStudent,
    this.feeIppan
  });

  factory TakuModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return TakuModel(
      userId: data?['userId'],
      takuName: data?['takuName'],
      haipai: data?['haipai'],
      sanma: data?['sanma'],
      smoke: data?['smoke'],
      feeStudent: data?['feeStudent'],
      feeIppan: data?['feeIppan']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (userId != null) "userId": userId,
      if (takuName != null) "takuName": takuName,
      if (haipai != null) "haipai": haipai,
      if (sanma != null) "sanma": sanma,
      if (smoke != null) "smoke": smoke,
      if (feeStudent != null) "feeStudent": feeStudent,
      if (feeIppan != null) "feeIppan": feeIppan,
    };
  }
}