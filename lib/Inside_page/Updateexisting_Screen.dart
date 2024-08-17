import 'package:flutter/material.dart';
import 'package:fluushy/All_Custom_Faction/Colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/UpdateexistingGmailController.dart';

class Updateexisting_Screen extends StatelessWidget {
  final Updateexistinggmailcontroller controller =
      Get.put(Updateexistinggmailcontroller());

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
            Text('Update existing E-mail', style: TextStyles.Montserratbold6),
            SizedBox(height: 50),
            buildInputField1(
              hintText: "Enter existing password",
              controller: controller.oldemailController.value,
              keyboardType: TextInputType.name,
              onChanged: (query) {
                // controller.searchLocation(query);
              },
            ),
            SizedBox(height: 10),
            buildInputField1(
              hintText: "Enter new Password",
              controller: controller.newemailController.value,
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
          ],
        ),
      ),
    );
  }
}
