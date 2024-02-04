import 'dart:async';

import 'package:get/get.dart';

import '../../api/api.dart';
import '../../model/seats.dart';

class ScanController extends GetxController {
  Rx<String> title = ''.obs;
  RxList<Layout> data = <Layout>[].obs;
  Rx<int> reportId = 0.obs;
  Rx<bool> isScanning = false.obs;
  Rx<bool> isFirst = true.obs;
  Rx<String> status = ''.obs;
  Timer? timer;

  start() {
    title.value = (Get.arguments ?? {})['title'];

    int id = (Get.arguments ?? {})['id'];

    Api.getSeats(id.toString()).then((value) {
      if (value.success ?? false) {
        reportId.value = value.data?.reportId ?? 0;
        status.value = value.data?.status ?? '';
        List<Layout>? items = value.data?.layout;
        if (items != null) data.value = items;
      }
    });
  }

  sentSeats(Object? param) {
    Api.sentSeats(reportId.value.toString(), param).then((value) {
      if (value.success ?? false) {
        status.value = value.data?.status ?? '';
        List<Layout>? items = value.data?.layout;
        if (items != null) data.value = items;
      }
    });
  }

  Future<bool> cancelSchedule() async {
    final result = await Api.cancelSchedule(reportId.value.toString());


    return result['success'] ?? false;
  }


  Future<bool> submitSchedule() async {
    final result = await Api.submitSchedule(reportId.value.toString());


    return result['success'] ?? false;
  }

}
