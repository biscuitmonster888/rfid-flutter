import 'package:get/get.dart';

import '../../api/api.dart';
import '../../model/response_schedules.dart';


class ToDoController extends GetxController {
  Rx<ResponseSchedules> data = ResponseSchedules().obs;

  getSchedule(){
    Api.getSchedule().then((value) {
      data.value = value;
    });
  }
}
