import 'package:rfid/model/response_scanning.dart';
import 'package:rfid/model/response_seats.dart';

import 'base_api.dart';

class Api {

  static Future<ResponseSeats> getSeats(String id) async {
    final result = await BaseApi.get(url: '/api/operations/seats/$id');

    return ResponseSeats.fromJson(result);
  }

  static Future<ResponseScanning> sentSeats(String id, Object? param) async {
    final result = await BaseApi.post(url: '/api/operations/scanning/$id', param: param);

    return ResponseScanning.fromJson(result);
  }

  // static Future<Home> home() async {
  //   final result = await BaseApi.get(url: '/home');
  //
  //   return Home.fromJson(result);
  // }

}
