import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:rfid/seat_page.dart';
import 'package:sunmi_uhf/sunmi_uhf.dart';

import 'di/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' RIFD Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _result = 'Unknown';
  bool _isConnected = false;
  init() async {
    _isConnected = await SunmiUhf.init();
    if(_isConnected){
      SunmiUhf.onUhfScanned().listen((event) {
        if(event != null) {
          _result = event;
          setState(() {});
        }

      });
    }

  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    SunmiUhf.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppRoutes.SPLASH,
      defaultTransition: Transition.fade,
      getPages: AppRoutes.pages(),
      smartManagement: SmartManagement.keepFactory,
      title: 'DEFUNDEN',
      themeMode: ThemeMode.system,
      builder: EasyLoading.init(),
    );
  }
}
