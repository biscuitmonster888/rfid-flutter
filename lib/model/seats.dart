class Seats {
  String? seat;
  String? tagId;
  bool? checked;

  Seats({this.seat, this.tagId, this.checked});

  Seats.fromJson(Map<String, dynamic> json) {
    seat = json['seat'];
    tagId = json['tag_id'];
    checked = json['checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seat'] = this.seat;
    data['tag_id'] = this.tagId;
    data['checked'] = this.checked;
    return data;
  }
}