import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../Module-Product/Views/product_list_view.dart';
import '../Controllers/home_controller.dart';

class HomeView extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Task"),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: PageView(
          physics: ScrollPhysics(
            parent: NeverScrollableScrollPhysics(),),
          children: [
            Container(
              child: Center(
                child: Text("Home"),
              ),
            ),
            Container(
              child: ProductListView()

            ),
            Container(
              child: Center(
                child: Text("Inbox"),
              ),
            ),
            Container(
              child: Center(
                child: Text("Shop"),
              ),
            ),
          ],
          controller: controller.pageController,
        ),
      ),
      bottomNavigationBar: Obx(
          () => FancyBottomNavigation(
              tabs: [
                TabData(iconData: Icons.home_outlined, title: "Home"),
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

          )
      ),
    );
  }

}