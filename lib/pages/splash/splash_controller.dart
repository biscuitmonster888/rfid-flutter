import 'package:get/get.dart';

import '../../di/app_routes.dart';


class SplashController extends GetxController {

  Future<void> loadingRoute() async {
    await Future.delayed(const Duration(milliseconds: 2000));

    Get.offAllNamed(AppRoutes.LOGIN);
  }
}
