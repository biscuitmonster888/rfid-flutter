class ResponseSchedules {
  bool? success;
  String? message;
  List<Data>? data;

  ResponseSchedules({this.success, this.message, this.data});

  ResponseSchedules.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? reportId;
  String? scheduleAt;
  String? dateDisplay;
  String? timeDisplay;
  bool? isActive;
  Aircraft? aircraft;
  Status? status;

  Data(
      {this.id,
        this.reportId,
        this.scheduleAt,
        this.dateDisplay,
        this.timeDisplay,
        this.isActive,
        this.aircraft,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reportId = json['report_id'];
    scheduleAt = json['schedule_at'];
    dateDisplay = json['date_display'];
    timeDisplay = json['time_display'];
    isActive = json['is_active'];
    aircraft = json['aircraft'] != null
        ? new Aircraft.fromJson(json['aircraft'])
        : null;
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['report_id'] = this.reportId;
    data['schedule_at'] = this.scheduleAt;
    data['date_display'] = this.dateDisplay;
    data['time_display'] = this.timeDisplay;
    data['is_active'] = this.isActive;
    if (this.aircraft != null) {
      data['aircraft'] = this.aircraft!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class Aircraft {
  int? id;
  String? regNum;
  String? manufacturer;
  String? model;
  int? totalSeats;

  Aircraft(
      {this.id, this.regNum, this.manufacturer, this.model, this.totalSeats});

  Aircraft.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regNum = json['reg_num'];
    manufacturer = json['manufacturer'];
    model = json['model'];
    totalSeats = json['totalSeats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reg_num'] = this.regNum;
    data['manufacturer'] = this.manufacturer;
    data['model'] = this.model;
    data['totalSeats'] = this.totalSeats;
    return data;
  }
}

class Status {
  int? id;
  String? name;
  String? preferredColor;

  Status({this.id, this.name, this.preferredColor});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    preferredColor = json['preferred_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['preferred_color'] = this.preferredColor;
    return data;
  }
}