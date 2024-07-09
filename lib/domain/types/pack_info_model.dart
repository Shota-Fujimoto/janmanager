import 'package:cloud_firestore/cloud_firestore.dart';

class PackInfoModel {
  final String? documentId;
  final String? userId;
  final String? packName;
  final int? num;
  final int? fee;
  final int? time;
  final String? availavle;
  final bool? autoCarry;

  PackInfoModel({
    this.documentId,
    this.userId,
    this.packName,
    this.num,
    this.fee,
    this.time,
    this.availavle,
    this.autoCarry
  });

  factory PackInfoModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ){
    final data = snapshot.data();
    return PackInfoModel(
      documentId: data?['documentId'],
      userId: data?['userId'],
      packName: data?['packName'],
      num: data?['num'],
      fee: data?['fee'],
      time: data?['time'],
      availavle: data?['availavle'],
      autoCarry: data?['autoCarry']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (userId != null) 'userId': userId,
      if (packName != null) 'packName': packName,
      if (num != null) 'num': num,
      if (fee != null) 'fee': fee,
      if (time != null) 'time': time,
      if (availavle != null) 'availavle': availavle,
      if (autoCarry != null) 'autoCarry': autoCarry,
    };
  }
}