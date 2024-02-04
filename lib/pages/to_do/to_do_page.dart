import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rfid/di/app_routes.dart';
import 'package:rfid/pages/to_do/to_do_controller.dart';

import '../../model/response_schedules.dart';

class ToDoPage extends StatefulWidget {
  @override
  State<ToDoPage> createState() => _ToDoState();
}

class _ToDoState extends State<ToDoPage> {
  ToDoController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.getSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: const Color(0xFF08202D),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tasks to-do',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Tasks will be unlocked 15 min prior',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'G001',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: controller.data.value.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          Data item = controller.data.value.data?[index] ?? Data();
                          return GestureDetector(
                            onTap: () {
                              if (item.isActive ?? false) {
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
                                                'Start Scanning?',
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
                                                  '*${item.dateDisplay} @ ${item.timeDisplay} SGT\n*${item.aircraft?.regNum}\n*${item.aircraft?.model}\n*${item.aircraft?.totalSeats} Seats')),
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
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  await Get.toNamed(AppRoutes.SCAN, arguments: {
                                                    'title': item.aircraft?.regNum ?? '',
                                                    'id': item.id
                                                  });
                                                  controller.getSchedule();
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
                              }
                            },
                            child: Card(
                              elevation: 5,
                              child: ListTile(
                                tileColor: (item.isActive ?? false) ? Colors.white : Colors.black38,
                                contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                                title: Text('${item.dateDisplay} @ ${item.timeDisplay} SGT'),
                                subtitle: Container(
                                  padding: EdgeInsets.only(top: 4),
                                  child: RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xFF757575),
                                      ),
                                      children: <TextSpan>[
                                        const TextSpan(
                                          text: 'Reg. No:',
                                        ),
                                        TextSpan(
                                            text: '${item.aircraft?.regNum ?? ''} \n',
                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                        const TextSpan(
                                          text: 'Model:',
                                        ),
                                        TextSpan(
                                          text: '${item.aircraft?.model ?? ''} \n',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        const TextSpan(
                                          text: 'Manufacturer :',
                                        ),
                                        TextSpan(
                                          text: '${item.aircraft?.manufacturer ?? ''} \n',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        const TextSpan(
                                          text: 'Total Seats :',
                                        ),
                                        TextSpan(
                                          text: '${item.aircraft?.totalSeats} ',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
              ],
            ),
          ),
        ),
      );
    });
  }
}
