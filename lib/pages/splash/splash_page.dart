import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rfid/pages/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.loadingRoute();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Image.asset(
                "assets/img/logo_1.png",
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ));
  }
}
