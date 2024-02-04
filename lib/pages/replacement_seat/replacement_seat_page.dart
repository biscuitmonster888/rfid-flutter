import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rfid/model/response_aircraft_seats.dart';
import 'package:rfid/pages/replacement_seat/replacement_seat_controller.dart';

import '../../di/app_routes.dart';

class ReplacementSeatPage extends StatefulWidget {
  @override
  State<ReplacementSeatPage> createState() => _ReplacementSeatState();
}

class _ReplacementSeatState extends State<ReplacementSeatPage> {
  ReplacementSeatController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: const Color(0xFF08202D),
        appBar: AppBar(
          title: Text(
            controller.title.value,
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: controller.response.value.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [...getItems(controller.response.value.data?[index].seats)],
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> getItems(List<Seats>? data) {
    List<Widget> widgets = [];

    for (int i = 0; i < (data?.length ?? 0); i++) {
      widgets.add(
        Expanded(
          child: data?[i].space == true
              ? Container()
              : GestureDetector(
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Seat ${data?[i].lifeVest?.rfidTag ?? ''} selected',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Color(0xFF757575),
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: 'Are you sure to replace this life vest \n',
                                      ),
                                      TextSpan(
                                          text: '${data?[i].tagId ?? ''} \n',
                                          style: TextStyle(fontWeight: FontWeight.bold)),
                                      const TextSpan(
                                        text: 'Seat: ',
                                      ),
                                      TextSpan(
                                          text: '${data?[i].seatNumber ?? ''} \n',
                                          style: TextStyle(fontWeight: FontWeight.bold)),
                                      const TextSpan(
                                        text: 'Brand: ',
                                      ),
                                      TextSpan(
                                        text: '${data?[i].lifeVest?.brand ?? ''}\n',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      const TextSpan(
                                        text: 'Model: ',
                                      ),
                                      TextSpan(
                                        text: '${data?[i].lifeVest?.model ?? ''} \n',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      const TextSpan(
                                        text: 'Expire Date: ',
                                      ),
                                      TextSpan(
                                        text: '${data?[i].lifeVest?.expiryDate ?? ''} ',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'CANCEL',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      await Get.toNamed(AppRoutes.SCAN_REPLACEMENT, arguments: {
                                        'title': controller.title.value ?? '',
                                        'id': data?[i].id,
                                        'seat': data?[i].seatNumber ?? '',
                                        'brand': data?[i].lifeVest?.brand ?? '',
                                        'model': data?[i].lifeVest?.model ?? '',
                                        'expire': data?[i].lifeVest?.expiryDate ?? '',
                                        'tag_id': data?[i].tagId,
                                      });
                                      controller.start();
                                    },
                                    child: const Text(
                                      'CONFIRM',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9), //Color(0xFF04DB00)
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Center(
                        child: FittedBox(
                            child: Text(
                      data?[i].seatNumber ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))),
                  ),
                ),
        ),
      );
    }

    return widgets;
  }
}
