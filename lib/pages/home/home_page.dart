import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rfid/pages/to_do/to_do_page.dart';
import '../replacement/replacement_page.dart';
import '../setting/setting_page.dart';
import 'home_controller.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.find();

  @override
  void initState() {
    super.initState();
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.open_in_full_outlined),
        label: ''
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.widgets),
          label: ''
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
          label: ''
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.black38,
        body: buildPageView(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xFF86744C),
          unselectedItemColor: Colors.black,
          currentIndex: controller.bottomSelectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: buildBottomNavBarItems(),
          onTap: controller.onBottomNavBarTap,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      );
    });
  }

  Widget buildPageView() {
    return PageView(
      controller: controller.pageController,
      onPageChanged: (index) {
        controller.bottomSelectedIndex(index);
      },
      children: <Widget>[
        ReplacementPage(),
        ToDoPage(),
        SettingPage(),
      ],
    );
  }

}
