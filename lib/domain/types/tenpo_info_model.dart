import 'package:cloud_firestore/cloud_firestore.dart';

class TenpoInfoModel {
  final String? userId;
  final String? tenpoName;
  final String? phoneNum;
  final String? addressNum;
  final String? address1;
  final String? address2;
  final String? address3;
  final String? address4;
  final String? startTime;
  final String? endTime;
  final int? seatCnt;
  final String? smoke;

  TenpoInfoModel({
    this.userId,
    this.tenpoName,
    this.phoneNum,
    this.addressNum,
    this.address1,
    this.address2,
    this.address3,
    this.address4,
    this.startTime,
    this.endTime,
    this.seatCnt,
    this.smoke
  });

  factory TenpoInfoModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return TenpoInfoModel(
      userId: data?['userId'],
      tenpoName: data?['tenpoName'],
      phoneNum: data?['phoneNum'],
      addressNum: data?['addressNum'],
      address1: data?['address1'],
      address2: data?['address2'],
      address3: data?['address3'],
      address4: data?['address4'],
      startTime: data?['startTime'],
      endTime: data?['endTime'],
      seatCnt: data?['seatCnt'],
      smoke: data?['smoke']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (userId != null) 'userId': userId,
      if (tenpoName != null) 'tenpoName': tenpoName,
      if (phoneNum != null) 'phoneNum': phoneNum,
      if (addressNum != null) 'addressNum': addressNum,
      if (address1 != null) 'address1': address1,
      if (address2 != null) 'address2': address2,
      if (address3 != null) 'address3': address3,
      if (address4 != null) 'address4': address4,
      if (startTime != null) 'startTime': startTime,
      if (endTime != null) 'endTime': endTime,
      if (seatCnt != null) 'seatCnt': seatCnt,
      if (smoke != null) 'smoke': smoke,
    };
  }
}