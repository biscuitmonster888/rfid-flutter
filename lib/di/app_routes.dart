// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:get/get.dart';
import 'package:rfid/di/app_binding.dart';
import 'package:rfid/pages/home/home_page.dart';
import 'package:rfid/pages/login/login_page.dart';
import 'package:rfid/pages/replacement/replacement_page.dart';
import 'package:rfid/pages/replacement_seat/replacement_seat_page.dart';
import 'package:rfid/pages/scan/scan_page.dart';
import 'package:rfid/pages/scan_replacement/scan_replacement_page.dart';
import 'package:rfid/pages/to_do/to_do_page.dart';
import '../pages/splash/splash_page.dart';

class AppRoutes {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: AppRoutes.SPLASH,
        page: () => SplashPage(),
        binding: AppBinding(),
      ),
      GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: AppBinding(),
      ),
      GetPage(
        name: AppRoutes.HOME,
        page: () => HomePage(),
        binding: AppBinding(),
      ),
      GetPage(
        name: AppRoutes.TO_DO,
        page: () => ToDoPage(),
        binding: AppBinding(),
      ),
      GetPage(
        name: AppRoutes.REPLACEMENT,
        page: () => ReplacementPage(),
        binding: AppBinding(),
      ),
      GetPage(
        name: AppRoutes.SCAN,
        page: () => ScanPage(),
        binding: AppBinding(),
      ),
      GetPage(
        name: AppRoutes.REPLACEMENT_SEAT,
        page: () => ReplacementSeatPage(),
        binding: AppBinding(),
      ),
      GetPage(
        name: AppRoutes.SCAN_REPLACEMENT,
        page: () => ScanReplacementPage(),
        binding: AppBinding(),
      ),
    ];
  }

  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const HOME = '/HOME';
  static const TO_DO = '/to_do';
  static const REPLACEMENT = '/replacement';
  static const SCAN = '/scan';
  static const REPLACEMENT_SEAT = '/replacement_seat';
  static const SCAN_REPLACEMENT = '/scan_replacement';

}
