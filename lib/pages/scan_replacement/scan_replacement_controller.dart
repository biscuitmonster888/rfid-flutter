import 'package:get/get.dart';

import '../../api/api.dart';
import '../../model/response_rfid_detail.dart';


class ScanReplacementController extends GetxController {
  RxInt page = 0.obs;
  RxString selectTag = ''.obs;
  RxString title = ''.obs;

  RxInt id = 0.obs;
  RxString seat = ''.obs;
  RxString brand = ''.obs;
  RxString model = ''.obs;
  RxString expire = ''.obs;
  RxString tagId = ''.obs;
  RxList<String> rfidList = <String>[].obs;
  Rx<ResponseRfidDetail> rfidDetail = ResponseRfidDetail().obs;

  start() {
    title.value = (Get.arguments ?? {})['title'] ?? '';
    id.value = (Get.arguments ?? {})['id'] ?? 0;
    brand.value = (Get.arguments ?? {})['brand'] ?? '';
    seat.value = (Get.arguments ?? {})['seat'] ?? '';
    model.value = (Get.arguments ?? {})['model'] ?? '';
    expire.value = (Get.arguments ?? {})['expire'] ?? '';
    tagId.value = (Get.arguments ?? {})['tag_id'] ?? '';
  }

  scanResult() {
    Api.getRFIDgetRFIDDetails(selectTag.value).then((value) {
      if(value.success ?? false) {
        rfidDetail.value = value;
        page.value = 2;
      }

    });
  }

  postReplaceLifeVest() {
    Api.postReplaceLifeVest(id.value.toString(), (rfidDetail.value.data?.id ?? '').toString()).then((value) {
      if (value['success'] ?? false) Get.back();
    });
  }
}
