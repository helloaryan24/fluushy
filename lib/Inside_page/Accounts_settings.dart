import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/TextStyle.dart';

class Account_Settings extends StatelessWidget {

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
            ),            SizedBox(height: 30),
            Text('Accounts settings', style: TextStyles.Montserratbold6),
            SizedBox(height: 50),
            CustomButton3(
              text: 'Change or Reset password!',
              backgroundColor: AppColors.contcolor1,
              onTap: () {
                // Handle tap
                Get.toNamed('/ChangeResetPassword_Screen');
              },
              style: TextStyles.MontserratMedium3,
              icon: Icon(
                Icons.navigate_next_outlined,
                color: AppColors.whitecolor,
              ),
            ),
            SizedBox(height: 10),
            CustomButton3(
              text: 'Update existing email',
              backgroundColor: AppColors.contcolor1,
              onTap: () {
                Get.toNamed('/Updateexisting_Screen');
              },
              style: TextStyles.MontserratMedium3,
              icon: Icon(
                Icons.navigate_next_outlined,
                color: AppColors.whitecolor,
              ),
            ),
            SizedBox(height: 10),
            CustomButton3(
              text: 'Manage linked accounts',
              backgroundColor: AppColors.contcolor1,
              onTap: () {
                Get.toNamed('/Linkedaccounts_Screen');
              },
              style: TextStyles.MontserratMedium3,
              icon: Icon(
                Icons.navigate_next_outlined,
                color: AppColors.whitecolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
