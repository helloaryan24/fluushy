import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/SettingsController.dart';

class Settings_Page extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back_outlined),
            ),
            SizedBox(height: 30),
            Text('Settings', style: TextStyles.Montserratbold6),
            SizedBox(height: 50),
            CustomButton3(
              text: 'Account Settings',
              backgroundColor: AppColors.contcolor1,
              onTap: () {
                // Handle tap
                Get.toNamed('/Account_Settings');
              },
              style: TextStyles.MontserratMedium3,
              icon: Icon(
                Icons.navigate_next_outlined,
                color: AppColors.whitecolor,
              ),
            ),
            SizedBox(height: 10),
            CustomButton3(
              text: 'Notifications & preference',
              backgroundColor: AppColors.contcolor1,
              onTap: () {
                Get.toNamed('/Notification_Screen');
              },
              style: TextStyles.MontserratMedium3,
              icon: Icon(
                Icons.navigate_next_outlined,
                color: AppColors.whitecolor,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                controller.logout();
              },
              child: Text(
                "Log out",
                style: TextStyles.MontserratSemibold5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}