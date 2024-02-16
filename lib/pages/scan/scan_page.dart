import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rfid/pages/scan/scan_controller.dart';
import 'package:sunmi_uhf/sunmi_uhf.dart';
import '../../model/seats.dart';

class ScanPage extends StatefulWidget {
  @override
  State<ScanPage> createState() => _ScanState();
}

class _ScanState extends State<ScanPage> {
  ScanController controller = Get.find();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    controller.start();

    SunmiUhf.onUhfScanned().listen((event) async {
      if (event != null) {
        var _result = event;
        print('TAG ${_result}');

        var body = json.encode({
          "tags": [_result]
        });

        await controller.sentSeats(body);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<bool> _willPopCallback() async {
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
                  child: const Text(
                    'Cancel Submission?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(
                height: 8,
              ),
              Container(alignment: Alignment.topLeft, child: Text('Are you sure to cancel the current report ?')),
              const SizedBox(height: 12),
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
                    onPressed: () {
                      controller.cancelSchedule().then((value) {
                        if (value) Get.back();

                        Navigator.pop(context);
                      });
                    },
                    child: const Text(
                      'OK',
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

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return WillPopScope(
        onWillPop: _willPopCallback,
        child: Scaffold(
          backgroundColor: const Color(0xFF08202D),
          appBar: AppBar(
            title: Text(
              '${controller.title}',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
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
                              child: const Text(
                                'Cancel Submission?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          Container(alignment: Alignment.topLeft, child: Text('Are you sure to cancel the current report ?')),
                          const SizedBox(height: 12),
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
                                onPressed: () {
                                  controller.cancelSchedule().then((value) {
                                    if (value) Get.back();

                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text(
                                  'OK',
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
                        itemCount: controller.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(
                            () => Row(
                              children: [...getItems(controller.data[index].seats)],
                            ),
                          );
                        }),
                  ),
                ),
                if (controller.isFirst.value)
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            controller.isFirst.value = false;
                            controller.isScanning.value = true;

                            timer = Timer.periodic(const Duration(seconds: 3), (Timer t) => runScanner());
                            setState(() {});
                          },
                          child: Container(
                            child: Text(
                              'START',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                if (!controller.isFirst.value)
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            controller.isScanning.value = !controller.isScanning.value;
                            if (controller.isScanning.value) {
                              timer = Timer.periodic(const Duration(seconds: 3), (Timer t) => runScanner());
                            } else {
                              timer?.cancel();
                            }
                          },
                          child: Container(
                            child: Text(
                              controller.isScanning.value == true ? 'STOP' : 'RESUME',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        if (controller.isScanning.value == false)
                          Expanded(
                            child: Container(),
                          ),
                        if (controller.isScanning.value == false)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Obx(
                                  () => Dialog(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              alignment: Alignment.topLeft,
                                              child: const Text(
                                                'Confirm Submission?',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                  'Are you sure to submit the current report ?\n ${controller.title}\n Seat scanned: ${controller.status}')),
                                          const SizedBox(height: 12),
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
                                                onPressed: () {
                                                  controller.submitSchedule().then((value) {
                                                    if (value) Get.back();

                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: const Text(
                                                  'OK',
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              child: Text(
                                'SUBMIT',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }

  List<Widget> getItems(List<Seats>? items) {
    if (items == null) return [];

    List<Widget> widgets = [];

    for (int i = 0; i < items.length; i++) {
      widgets.add(
        Expanded(
          child: items[i].space == true
              ? Container()
              : GestureDetector(
                  onTap: () async {
                    return; // for dev
                    var body = json.encode({
                      "tags": [items[i].tagId]
                    });

                    await controller.sentSeats(body);
                  },
                  child: Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color: (items[i].checked ?? false) ? Color(0xFF04DB00) : Color(0xFFD9D9D9), //Color(0xFF04DB00)
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Center(
                        child: FittedBox(
                            child: Text(
                      '${items[i].seatNumber}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))),
                  ),
                ),
        ),
      );
    }

    return widgets;
  }

  runScanner() async {
    var _isConnected = await SunmiUhf.isConnect();
    if (!_isConnected) return;
    SunmiUhf.scan();
  }
}
