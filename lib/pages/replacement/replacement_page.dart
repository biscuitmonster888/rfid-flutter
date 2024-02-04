import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rfid/di/app_routes.dart';
import 'package:rfid/model/response_schedules.dart';
import 'package:rfid/pages/replacement/replacement_controller.dart';
import 'package:rfid/pages/to_do/to_do_controller.dart';

class ReplacementPage extends StatefulWidget {
  @override
  State<ReplacementPage> createState() => _ReplacementState();
}

class _ReplacementState extends State<ReplacementPage> {
  ReplacementController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.start();
  }


  @override
  Widget build(BuildContext context) {
    return Obx((){
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
                            'Life Vest Replacement',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 8,
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
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Current Active Task',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Expanded(child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: controller.data.value.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      Data item = controller.data.value.data?[index] ?? Data();
                      // Card(
                      //                       elevation: 5,
                      //                       child: ListTile(
                      //                         tileColor: Colors.black38,
                      //                         contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                      //                         title: Text('Today @ 1530pm SGT'),
                      //                         subtitle: Container(
                      //                           padding: EdgeInsets.only(top: 4),
                      //                           child: RichText(
                      //                             text: TextSpan(
                      //                               style: const TextStyle(
                      //                                 fontSize: 14.0,
                      //                                 color: Color(0xFF757575),
                      //                               ),
                      //                               children: <TextSpan>[
                      //                                 const TextSpan(
                      //                                   text: 'Reg. No:',),
                      //                                 TextSpan(
                      //                                     text: 'B-58201 \n',style: TextStyle(fontWeight: FontWeight.bold)
                      //                                 ),
                      //                                 const TextSpan(
                      //                                   text: 'Model:',),
                      //                                 TextSpan(
                      //                                   text: 'AIRBUS  A321neo \n', style: TextStyle(fontWeight: FontWeight.bold),
                      //                                 ),
                      //                                 const TextSpan(
                      //                                   text: 'Manufacturer :',),
                      //                                 TextSpan(
                      //                                   text: 'AIRBUS \n', style: TextStyle(fontWeight: FontWeight.bold),
                      //                                 ),
                      //                                 const TextSpan(
                      //                                   text: 'Total Seats :',),
                      //                                 TextSpan(
                      //                                   text: '180 ',style: TextStyle(fontWeight: FontWeight.bold),
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      return  GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.REPLACEMENT_SEAT, arguments: {
                            'title': item.aircraft?.regNum ?? '',
                            'id': item.aircraft?.id,
                          });
                        },
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            tileColor: Colors.white,
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
                    }
                )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
