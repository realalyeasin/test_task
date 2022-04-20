import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../Module-Product/Views/explore.dart';
import '../Controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Test Task"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SizedBox.expand(
        child: PageView(
          allowImplicitScrolling: true,
          padEnds: true,
          physics: const ScrollPhysics(
            parent: NeverScrollableScrollPhysics(),
          ),
          children: [
            const Center(
              child: Text("Home"),
            ),
            Explore(),
            const Center(
              child: Text("Inbox"),
            ),
            const Center(
              child: Text("Shop"),
            ),
          ],
          controller: controller.pageController,
        ),
      ),
      bottomNavigationBar: Obx(() => FancyBottomNavigation(
            barBackgroundColor: Colors.black,
            activeIconColor: Colors.white,
            textColor: Colors.white,
            circleColor: Colors.black,
            tabs: [
              TabData(
                iconData: Icons.home_outlined,
                title: "Home",
              ),
              TabData(iconData: Icons.explore, title: "Explore"),
              TabData(iconData: Icons.inbox_sharp, title: "Inbox"),
              TabData(iconData: Icons.shopping_cart, title: "Shop"),
            ],
            onTabChangedListener: (position) {
              controller.currentIndex.value = position;
              controller.pageController.jumpToPage(position);
            },
            initialSelection: controller.currentIndex.value,
            key: controller.bottomNavigationKey,
            inactiveIconColor: Colors.grey,
          )),
    );
  }
}
