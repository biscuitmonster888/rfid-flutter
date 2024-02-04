class Layout {
  int? row;
  List<Seats>? seats;

  Layout({this.row, this.seats});

  Layout.fromJson(Map<String, dynamic> json) {
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

  Seats(
      {this.id,
        this.seatNumber,
        this.tagId,
        this.space,
        this.checked});

  Seats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seatNumber = json['seat_number'];
    tagId = json['tag_id'];
    space = json['space'];
    checked = json['checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seat_number'] = this.seatNumber;
    data['tag_id'] = this.tagId;
    data['space'] = this.space;
    data['checked'] = this.checked;
    return data;
  }
}