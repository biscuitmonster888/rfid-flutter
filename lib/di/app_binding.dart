import 'package:get/get.dart';
import 'package:rfid/pages/home/home_controller.dart';
import 'package:rfid/pages/replacement_seat/replacement_seat_controller.dart';
import 'package:rfid/pages/scan/scan_controller.dart';
import 'package:rfid/pages/scan_replacement/scan_replacement_controller.dart';
import 'package:rfid/pages/splash/splash_controller.dart';
import 'package:rfid/pages/to_do/to_do_controller.dart';
import '../pages/login/login_controller.dart';
import '../pages/replacement/replacement_controller.dart';


class AppBinding extends Bindings {
  @override
  void dependencies() {
    //controller
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => ToDoController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ReplacementController());
    Get.lazyPut(() => ScanController());
    Get.lazyPut(() => ReplacementSeatController());
    Get.lazyPut(() => ScanReplacementController());
  }
}
