import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;


class BaseApi {
  static var API_NAME = 'https://app.defunden.com';

  static Future<dynamic> post(
      {required String url, Object? param, bool isJsonString = false}) async {
    EasyLoading.show(status: 'loading...', dismissOnTap: true);
    Map<String, String>? headers;


    headers = {
      'Content-Type': 'application/json',
    };

    log("[POST] ${Uri.parse(API_NAME + url)}");
    log(param.toString());

    final response = await http.post(Uri.parse(API_NAME + url), body: param, headers: headers);

    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      Map result = jsonDecode(response.body);

      return result;
    } else {
      Map result = {};
      try {
        result = jsonDecode(response.body);
      } catch (e) {
        log(response.body);
      }

      return result.isNotEmpty ? result : {'success': false, 'message': 'Connection Fail'};
    }
  }

  static Future<dynamic> delete({required String url}) async {
    EasyLoading.show(status: 'loading...');
    Map<String, String>? headers;


    headers = {'Accept': 'application/json',};

    log("[GET] ${Uri.parse(API_NAME + url)}");

    final response = await http.delete(Uri.parse(API_NAME + url), headers: headers);

    Map result = jsonDecode(response.body);

    EasyLoading.dismiss();

    if (response.statusCode == 200) {
      return result;
    } else {
      return result.isNotEmpty ? result : {'success': false, 'message': 'Connection Fail'};
    }
  }

  static Future<dynamic> get({required String url}) async {
    EasyLoading.show(status: 'loading...', dismissOnTap: true);
    Map<String, String>? headers;


    headers = {'Content-Type': 'application/json'};

    log("[GET] ${Uri.parse(API_NAME + url)}");

    final response = await http.get(Uri.parse(API_NAME + url), headers: headers);

    Map result = jsonDecode(response.body);

    EasyLoading.dismiss();

    if (response.statusCode == 200) {
      return result;
    } else {
      return result.isNotEmpty ? result : {'success': false, 'message': 'Connection Fail'};
    }
  }
}
