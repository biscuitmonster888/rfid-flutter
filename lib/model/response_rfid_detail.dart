class ResponseRfidDetail {
  bool? success;
  String? message;
  Data? data;

  ResponseRfidDetail({this.success, this.message, this.data});

  ResponseRfidDetail.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? statusId;
  String? rfidTag;
  String? serialNum;
  String? brand;
  String? model;
  String? batchNum;
  String? manufactureDate;
  String? expiryDate;
  String? remarks;
  int? aircraftSeatId;
  AircraftSeat? aircraftSeat;

  Data({this.id, this.statusId, this.rfidTag, this.serialNum, this.brand, this.model, this.batchNum, this.manufactureDate, this.expiryDate, this.remarks, this.aircraftSeatId, this.aircraftSeat});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusId = json['status_id'];
    rfidTag = json['rfid_tag'];
    serialNum = json['serial_num'];
    brand = json['brand'];
    model = json['model'];
    batchNum = json['batch_num'];
    manufactureDate = json['manufacture_date'];
    expiryDate = json['expiry_date'];
    remarks = json['remarks'];
    aircraftSeatId = json['aircraft_seat_id'];
    aircraftSeat = json['aircraft_seat'] != null ? new AircraftSeat.fromJson(json['aircraft_seat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status_id'] = this.statusId;
    data['rfid_tag'] = this.rfidTag;
    data['serial_num'] = this.serialNum;
    data['brand'] = this.brand;
    data['model'] = this.model;
    data['batch_num'] = this.batchNum;
    data['manufacture_date'] = this.manufactureDate;
    data['expiry_date'] = this.expiryDate;
    data['remarks'] = this.remarks;
    data['aircraft_seat_id'] = this.aircraftSeatId;
    if (this.aircraftSeat != null) {
      data['aircraft_seat'] = this.aircraftSeat!.toJson();
    }
    return data;
  }
}

class AircraftSeat {
  int? id;
  int? aircraftId;
  String? zone;
  String? classes;
  int? rowNum;
  String? seatLetter;
  String? tagId;
  int? lifeVestId;
  int? statusId;
  Aircraft? aircraft;

  AircraftSeat({this.id, this.aircraftId, this.zone, this.classes, this.rowNum, this.seatLetter, this.tagId, this.lifeVestId, this.statusId, this.aircraft});

  AircraftSeat.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  aircraftId = json['aircraft_id'];
  zone = json['zone'];
  classes = json['class'];
  rowNum = json['row_num'];
  seatLetter = json['seat_letter'];
  tagId = json['tag_id'];
  lifeVestId = json['life_vest_id'];
  statusId = json['status_id'];
  aircraft = json['aircraft'] != null ? new Aircraft.fromJson(json['aircraft']) : null;
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['aircraft_id'] = this.aircraftId;
  data['zone'] = this.zone;
  data['class'] = this.classes;
  data['row_num'] = this.rowNum;
  data['seat_letter'] = this.seatLetter;
  data['tag_id'] = this.tagId;
  data['life_vest_id'] = this.lifeVestId;
  data['status_id'] = this.statusId;
  if (this.aircraft != null) {
  data['aircraft'] = this.aircraft!.toJson();
  }
  return data;
  }
}

class Aircraft {
  int? id;
  String? regNum;
  String? manufacturer;
  String? model;

  Aircraft({this.id, this.regNum, this.manufacturer, this.model});

  Aircraft.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regNum = json['reg_num'];
    manufacturer = json['manufacturer'];
    model = json['model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reg_num'] = this.regNum;
    data['manufacturer'] = this.manufacturer;
    data['model'] = this.model;
    return data;
  }
}