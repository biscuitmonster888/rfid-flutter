import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  final GlobalKey webViewKey = GlobalKey();
  RxInt bottomSelectedIndex = 0.obs;
  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void onBottomNavBarTap(int? index) {
    if (index != null && index >= 0 && index <= 3 && index != bottomSelectedIndex.value) {
      bottomSelectedIndex(index);
      pageController.jumpToPage(index);
    }
  }
}
