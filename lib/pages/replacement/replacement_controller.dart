import 'package:get/get.dart';

import '../../api/api.dart';
import '../../model/response_schedules.dart';


class ReplacementController extends GetxController {
  Rx<ResponseSchedules> data = ResponseSchedules().obs;

  start() {
    Api.getActiveSchedule().then((value) {
      data.value = value;
    });
  }
}
