import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/ChangeResetPasswordController.dart';

class ChangeResetPassword_Screen extends StatelessWidget {
  final Changeresetpasswordcontroller controller = Get.put(Changeresetpasswordcontroller());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            ),          SizedBox(height: 30),
          Text('Change or Reset password', style: TextStyles.Montserratbold6),
          SizedBox(height: 50),
          buildInputField1(
            hintText: "Enter existing password",
            controller: controller.oldpasswordController.value,
            keyboardType: TextInputType.name,
            onChanged: (query) {
              // controller.searchLocation(query);
            },
          ),
            SizedBox(height: 10),

            buildInputField1(
            hintText: "Enter new Password",
            controller: controller.oldpasswordController.value,
            keyboardType: TextInputType.name,
            onChanged: (query) {
              // controller.searchLocation(query);
            },
          ),
            SizedBox(height: 10),
            buildInputField1(
            hintText: "Rewrite new Password",
            controller: controller.oldpasswordController.value,
            keyboardType: TextInputType.name,
            onChanged: (query) {
              // controller.searchLocation(query);
            },
          ),
            SizedBox(
              height: 20,
            ),
            CustomButton4(
              style: TextStyles.Montserratbold1,
              backgroundColor: AppColors.contcolor1,
              onTap: () {},
              text: "Change Password",
            ),
        ],),
      ),
    );
  }
}
