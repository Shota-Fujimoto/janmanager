//卓情報モデル
import 'package:cloud_firestore/cloud_firestore.dart';

class TakuModel {
  final String? id;
  final int? no;
  final String? userId;
  final String? haipai;
  final String? tensuHyoji;
  final String? sanma;
  final String? smoke;
  final int? feeStudent;
  final int? feeIppan;

  TakuModel({
    this.id,
    this.no,
    this.userId,
    this.haipai,
    this.tensuHyoji,
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
      no: data?['no'],
      userId: data?['userId'],
      haipai: data?['haipai'],
      tensuHyoji: data?['tensuHyoji'],
      sanma: data?['sanma'],
      smoke: data?['smoke'],
      feeStudent: data?['feeStudent'],
      feeIppan: data?['feeIppan']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (no != null) 'no': no,
      if (userId != null) 'userId': userId,
      if (haipai != null) 'haipai': haipai,
      if (tensuHyoji != null) 'tensuHyoji': tensuHyoji,
      if (sanma != null) 'sanma': sanma,
      if (smoke != null) 'smoke': smoke,
      if (feeStudent != null) 'feeStudent': feeStudent,
      if (feeIppan != null) 'feeIppan': feeIppan,
    };
  }
}