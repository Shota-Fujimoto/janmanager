import 'dart:convert';

import 'package:janmanager/domain/types/address_model.dart';
import 'package:http/http.dart' as http;

class AddressServise {
  
  //住所取得処理
  Future<Address?> searchAddress(String zipcode) async {

    try {
      //住所取得
      final response = await http.get(
        Uri.parse('https://zipcloud.ibsnet.co.jp/api/search?zipcode=$zipcode')
      );

      //正常なレスポンスのみ処理
      if (response.statusCode != 200) {
        return null;
      }
      //配列を取得
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final results = body['results'] as List?;
      if (results == null || results.isEmpty) {
        return null;
      }
      final json = results.first as Map<String, dynamic>;
      final address = Address.fromJson(json);

      return address;

    }catch (e) {
      return null;
    }
  }

  
}