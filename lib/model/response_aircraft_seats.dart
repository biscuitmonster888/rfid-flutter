class ResponseAircraftSeats {
  bool? success;
  String? message;
  List<Data>? data;

  ResponseAircraftSeats({this.success, this.message, this.data});

  ResponseAircraftSeats.fromJson(Map<String, dynamic> json) {
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
  int? row;
  List<Seats>? seats;

  Data({this.row, this.seats});

  Data.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    if (json['seats'] != null) {
      seats = <Seats>[];
      json['seats'].forEach((v) {
        seats!.add(new Seats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row'] = this.row;
    if (this.seats != null) {
      data['seats'] = this.seats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Seats {
  int? id;
  String? seatNumber;
  String? tagId;
  bool? space;
  bool? checked;
  LifeVest? lifeVest;

  Seats(
      {this.id,
        this.seatNumber,
        this.tagId,
        this.space,
        this.checked,
        this.lifeVest});

  Seats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seatNumber = json['seat_number'];
    tagId = json['tag_id'];
    space = json['space'];
    checked = json['checked'];
    lifeVest = json['life_vest'] != null
        ? new LifeVest.fromJson(json['life_vest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seat_number'] = this.seatNumber;
    data['tag_id'] = this.tagId;
    data['space'] = this.space;
    data['checked'] = this.checked;
    if (this.lifeVest != null) {
      data['life_vest'] = this.lifeVest!.toJson();
    }
    return data;
  }
}

class LifeVest {
  int? id;
  int? statusId;
  String? rfidTag;
  Null? serialNum;
  String? brand;
  String? model;
  Null? batchNum;
  Null? manufactureDate;
  String? expiryDate;
  Null? remarks;
  int? aircraftSeatId;

  LifeVest(
      {this.id,
        this.statusId,
        this.rfidTag,
        this.serialNum,
        this.brand,
        this.model,
        this.batchNum,
        this.manufactureDate,
        this.expiryDate,
        this.remarks,
        this.aircraftSeatId});

  LifeVest.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}