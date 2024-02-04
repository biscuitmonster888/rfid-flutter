import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rfid/pages/scan_replacement/scan_replacement_controller.dart';


class ScanReplacementPage extends StatefulWidget {
  @override
  State<ScanReplacementPage> createState() => _ScanReplacementState();
}

class _ScanReplacementState extends State<ScanReplacementPage> {
  ScanReplacementController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  Future<bool> _willPopCallback() async {
    if(controller.page.value != 0) {
      controller.page.value = controller.page.value - 1;
      setState(() {

      });
      return false;
    } else {
      Navigator.of(context).pop();
    }
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
              '${controller.title.value} (${controller.seat.value})',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                if(controller.page.value != 0) {
                  controller.page.value = controller.page.value - 1;
                  setState(() {

                  });
                  return;
                }

                Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12,),
                    child: (controller.page.value == 0 || controller.page.value == 1) ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Life Vest Replacement',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF757575),
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                  text: 'Seat: ',
                                  style: TextStyle(color: Colors.white)
                              ),
                              TextSpan(
                                  text: '${controller.seat.value} \n',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                              const TextSpan(
                                  text: 'Brand: ',
                                  style: TextStyle(color: Colors.white)
                              ),
                              TextSpan(
                                text: '${controller.brand.value}\n',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              const TextSpan(
                                  text: 'Model: ',
                                  style: TextStyle(color: Colors.white)
                              ),
                              TextSpan(
                                text: '${controller.model.value}\n',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              const TextSpan(
                                text: 'Expire Date: ',
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: '${controller.expire.value} ',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        if (controller.page.value == 0)
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Icon(
                                    Icons.find_in_page_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'Scan the new Life Vest',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (controller.page.value == 1)
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 50),
                                  Text(
                                    'Life vest(s) found, slect one',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Expanded(child: ListView.builder(
                                      padding: const EdgeInsets.all(8),
                                      itemCount: controller.rfidList.value.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Container(
                                          margin: EdgeInsets.all(4),
                                          color: Colors.white,
                                          child: RadioListTile<String>(
                                            activeColor: Colors.black,
                                            controlAffinity: ListTileControlAffinity.trailing,
                                            value: controller.rfidList.value[index],
                                            groupValue: controller.selectTag.value,
                                            onChanged: (String? value) {

                                              setState(() {
                                                controller.selectTag.value = value ?? '';
                                              });
                                            },
                                            title: Text('${controller.rfidList.value[index]}', style: TextStyle(color: Colors.black),),
                                          ),
                                        );
                                      }
                                  )),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ) : Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Life Vest Replacement Confirm',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 50,),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Are you sure to replace this life vest:',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Card(
                          elevation: 5,
                          child: ListTile(
                            tileColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                            subtitle: Container(
                              padding: EdgeInsets.only(top: 4),
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Tag ID : ',),
                                    TextSpan(
                                        text: '${controller.tagId.value} \n',style: TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                    const TextSpan(
                                      text: 'Aircraft Reg. No: ',),
                                    TextSpan(
                                      text: '${controller.title.value} \n', style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(
                                      text: 'Seat : ',),
                                    TextSpan(
                                      text: '${controller.seat.value} \n', style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(
                                      text: 'Brand : ',),
                                    TextSpan(
                                      text: '${controller.brand.value} \n',style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(
                                      text: 'Model : ',),
                                    TextSpan(
                                      text: '${controller.model.value} \n',style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(
                                      text: 'Expire Date : ',),
                                    TextSpan(
                                      text: '${controller.expire.value} ',style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'With this one:',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Card(
                          elevation: 5,
                          child: ListTile(
                            tileColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                            subtitle: Container(
                              padding: EdgeInsets.only(top: 4),
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Tag ID : ',),
                                    TextSpan(
                                        text: '${controller.rfidDetail.value.data?.rfidTag ?? ''} \n',style: TextStyle(fontWeight: FontWeight.bold)
                                    ),
                                    const TextSpan(
                                      text: 'Aircraft Reg. No: ',),
                                    TextSpan(
                                      text: '${controller.rfidDetail.value.data?.aircraftSeat?.aircraft?.regNum ?? ''} \n', style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(
                                      text: 'Seat : ',),
                                    TextSpan(
                                      text: '${controller.rfidDetail.value.data?.aircraftSeat?.rowNum ?? ''}${controller.rfidDetail.value.data?.aircraftSeat?.seatLetter ?? ''} \n', style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(
                                      text: 'Brand : ',),
                                    TextSpan(
                                      text: '${controller.rfidDetail.value.data?.aircraftSeat?.aircraft?.manufacturer ?? ''} \n',style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(
                                      text: 'Model : ',),
                                    TextSpan(
                                      text: '${controller.rfidDetail.value.data?.aircraftSeat?.aircraft?.model ?? ''} \n',style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(
                                      text: 'Expire Date : ',),
                                    TextSpan(
                                      text: '${controller.rfidDetail.value.data?.expiryDate ?? ''} ',style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Container(),),
                        if(controller.rfidDetail.value.data?.aircraftSeat?.aircraft != null)
                        Row(
                          children: [
                            Expanded(child: Container(),),
                            Icon(
                              Icons.warning_outlined,
                              color: Colors.red,
                            ),
                            Text(
                              'Warning',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Icon(
                              Icons.warning_outlined,
                              color: Colors.red,
                            ),
                            Expanded(child: Container(),),
                          ],
                        ),
                        SizedBox(height: 12,),
                        if(controller.rfidDetail.value.data?.aircraftSeat?.aircraft != null)
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF757575),
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                  text: 'By doing this, the life vest will be ',
                                  style: TextStyle(color: Colors.white)
                              ),
                              TextSpan(
                                  text: 'REMOVED ',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                              const TextSpan(
                                  text: 'from\n',
                                  style: TextStyle(color: Colors.white)
                              ),
                              TextSpan(
                                text: 'B-58211, seat 16A',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Container(),),
                      ],
                    ),),
                ),
                if(controller.page.value == 0)
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: Container(),),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          controller.page.value = 1;
                        },
                        child: Container(
                          child: Text(
                            'START SCANNING',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(child: Container(),),
                    ],
                  ),
                ),
                if(controller.page.value == 1)
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: Container(),),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                        },
                        child: Container(
                          child: Text(
                            'RETRY',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(child: Container(),),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          controller.scanResult();
                        },
                        child: Container(
                          child: Text(
                            'NEXT',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(child: Container(),),
                    ],
                  ),
                ),
                if(controller.page.value == 2)
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(child: Container(),),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            controller.postReplaceLifeVest();
                          },
                          child: Container(
                            child: Text(
                              'CONFIRM',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(child: Container(),),
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

}
