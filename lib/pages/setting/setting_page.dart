import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rfid/di/app_routes.dart';
import 'package:rfid/pages/to_do/to_do_controller.dart';

class SettingPage extends StatefulWidget {

  @override
  State<SettingPage> createState() => _SettingState();
}

class _SettingState extends State<SettingPage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF08202D),
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),),
            Container(
              width: 330,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: Column(
                children: [
                  Expanded(child: Container(),),
                  Image.asset(
                    "assets/img/logo_1.png",
                    fit: BoxFit.cover,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      Get.offNamed(AppRoutes.LOGIN);
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'SIGN OUT',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(child: Container(),),
                ],
              ),
            ),
            Expanded(child: Container(),),
          ],
        ),
      ),
    );
  }

}
