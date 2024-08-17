import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/BottomBarController.dart';
import '../Main_Screen/Home_Page.dart';
import '../Main_Screen/Profile_Page.dart';
import '../Main_Screen/Search_Page.dart';

class BottomBarPage extends StatelessWidget {
  final BottomBarController controller = Get.put(BottomBarController());

  final List<Widget> _pages = [
    HomePage_Screen(),
    SearchPage_Screen(),
    ProfilePage_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return _pages[controller.selectedIndex.value];
      }),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.all(0),
        color: AppColors.whitecolor,
        height: 50,
        child: Column(
          children: [
            Container(height: 2,width: double.infinity,color:AppColors.gradientcolor2,),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40,bottom: 5,top: 10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildBottomNavItem(Icons.home, 0),
                  buildBottomNavItem(Icons.search_rounded, 1),
                  buildBottomNavItem(Icons.person, 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        controller.changeIndex(index);
      },
      child: Obx(() {
        return Icon(
          icon,
          size: 30,
          color: controller.selectedIndex.value == index ? AppColors.contcolor1 : Colors.grey,
        );
      }),
    );
  }
}
