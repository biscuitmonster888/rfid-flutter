import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sunmi_uhf/sunmi_uhf.dart';

import 'api/api.dart';
import 'model/seats.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({super.key});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  List<Seats> seats = [];
  bool isStart = false;
  Timer? timer;
  int table = 0;

  @override
  void initState() {
    super.initState();

    SunmiUhf.onUhfScanned().listen((event) {
      if (event != null) {
        var isSeated = false;
        var _result = event;
        print('TAG ${_result}');

        var body = json.encode({
          "tags": [_result]
        });

        for (var element in seats) {
          if(element.tagId == _result) {
            if(element.checked == true) {
              isSeated = true;
            }

            continue;
          }
        }

        if(isSeated) return;

        // Api.sentSeats(table.toString(), body).then((value) {
        //   if (value.success ?? false) {
        //     seats = value.data?.seats ?? [];
        //     setState(() {});
        //   }
        // });
      }
    });

    // Api.getSeats('1').then((value) {
    //   if (value.success ?? false) {
    //     seats = value.data?.seats ?? [];
    //     table = value.data?.reportId ?? 0;
    //     setState(() {});
    //   }
    // });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Seats'),
        ),
        body: Column(
          children: [
            Expanded(
                child: GridView.count(
              crossAxisCount: 6,
              primary: false,
              padding: const EdgeInsets.all(20),
              children: [...returnWidget()],
            )),
            GestureDetector(
              onTap: () {
                isStart = !isStart;

                if (isStart) {
                  timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => runScanner());
                } else {
                  timer?.cancel();
                }
                setState(() {});
              },
              child: isStart
                  ? Icon(
                      Icons.stop_circle_outlined,
                      size: 50,
                    )
                  : Icon(
                      Icons.play_circle_filled_outlined,
                      size: 50,
                    ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> returnWidget() {
    List<Widget> widgets = [];
    //
    // seats.forEach((element) {
    //   widgets.add(Container(
    //     margin: const EdgeInsets.all(12.0),
    //     decoration: BoxDecoration(
    //         border:
    //             Border.all(color: (element.checked ?? false) ? Color(0xFF62A71D) : Colors.black)),
    //     child: Center(child: FittedBox(child: Text(element.seat ?? '', style: TextStyle(color: (element.checked ?? false) ? Color(0xFF62A71D) : Colors.black),))),
    //   ));
    // });

    return widgets;
  }

  runScanner() async {
    var _isConnected = await SunmiUhf.isConnect();
    if (!_isConnected) return;
    SunmiUhf.scan();
  }
}
