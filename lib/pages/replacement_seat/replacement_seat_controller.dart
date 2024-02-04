import 'package:get/get.dart';

import '../../api/api.dart';
import '../../model/response_aircraft_seats.dart';


class ReplacementSeatController extends GetxController {
  Rx<String> title = ''.obs;
  Rx<int> id = 0.obs;
  Rx<ResponseAircraftSeats> response = ResponseAircraftSeats().obs;

  start() {
    title.value = (Get.arguments ?? {})['title'];

    id.value = (Get.arguments ?? {})['id'];

    Api.getSeatAircraft(id.toString()).then((value) {
      if (value.success ?? false) {
        response.value = value;
      }
    });
  }
}
