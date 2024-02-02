import 'package:rfid/model/seats.dart';

class ResponseScanning {
  bool? success;
  String? message;
  Data? data;

  ResponseScanning({this.success, this.message, this.data});

  ResponseScanning.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? status;
  List<Seats>? seats;

  Data({this.status, this.seats});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['seats'] != null) {
      seats = <Seats>[];
      json['seats'].forEach((v) {
        seats!.add(new Seats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.seats != null) {
      data['seats'] = this.seats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}