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
  int? reportId;
  String? status;
  List<Layout>? layout;

  Data({this.reportId, this.status, this.layout});

  Data.fromJson(Map<String, dynamic> json) {
    reportId = json['report_id'];
    status = json['status'];
    if (json['layout'] != null) {
      layout = <Layout>[];
      json['layout'].forEach((v) {
        layout!.add(new Layout.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['report_id'] = this.reportId;
    data['status'] = this.status;
    if (this.layout != null) {
      data['layout'] = this.layout!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
