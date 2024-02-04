import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../di/app_routes.dart';

class LoginController extends GetxController {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Rx<bool> isChecked = false.obs;

  void login() {
    if(userController.text == 'admin' && passwordController.text == 'admin') {
      Get.offNamed(AppRoutes.HOME);
    } else {
      Fluttertoast.showToast(
          msg: 'FAIL TO LOGIN',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }
  }
}
