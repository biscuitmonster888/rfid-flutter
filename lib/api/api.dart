import 'dart:convert';

import 'package:rfid/model/response_scanning.dart';
import 'package:rfid/model/response_seats.dart';

import '../model/response_aircraft_seats.dart';
import '../model/response_rfid_detail.dart';
import '../model/response_schedules.dart';
import '../model/vest.dart';
import 'base_api.dart';

class Api {

  static Future<ResponseSeats> getSeats(String id) async {
    final result = await BaseApi.get(url: '/api/operations/seats/schedules/$id');

    return ResponseSeats.fromJson(result);
  }

  static Future<ResponseAircraftSeats> getSeatAircraft(String id) async {
    final result = await BaseApi.get(url: '/api/operations/seats/aircrafts/$id');

    return ResponseAircraftSeats.fromJson(result);
  }

  static Future<ResponseScanning> sentSeats(String id, Object? param) async {
    final result = await BaseApi.post(url: '/api/operations/scanning/$id', param: param);

    return ResponseScanning.fromJson(result);
  }


  static Future<ResponseSchedules> getSchedule() async {
    final result = await BaseApi.get(url: '/api/operations/schedules');

    return ResponseSchedules.fromJson(result);
  }


  static Future<dynamic> cancelSchedule(String id) async {
    final result = await BaseApi.get(url: '/api/operations/report/$id/cancel');

    return result;
  }

  static Future<dynamic> submitSchedule(String id) async {
    final result = await BaseApi.get(url: '/api/operations/report/$id/conclude');

    return result;
  }

  static Future<ResponseSchedules> getActiveSchedule() async {
    final result = await BaseApi.get(url: '/api/operations/schedules/active');

    return ResponseSchedules.fromJson(result);
  }

  ///api/operations/replace-lifevest/seats/848
  static Future<ResponseRfidDetail> getRFIDgetRFIDDetails(String tag) async {
    final result = await BaseApi.get(url: '/api/operations/lifevests/rfid/$tag');

    return ResponseRfidDetail.fromJson(result);
  }

  static Future<dynamic> postReplaceLifeVest(String oldId, String newId) async {
    var body = json.encode({
      "new_life_vest_id": newId
    });
    final result = await BaseApi.post(url: '/api/operations/replace-lifevest/seats/$oldId', param: body);

    return result;
  }
}
