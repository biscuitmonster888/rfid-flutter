
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    LoginController controller = Get.find();

    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Image.asset(
                "assets/img/logo_1.png",
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: TextField(
                  controller: controller.userController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Staff ID',
                    hintText: 'Staff ID',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Password',
                    labelText: 'Password',
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  controller.login();
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'SIGN IN',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(),
              ),
            ],
          ),
        ));
  }
}
