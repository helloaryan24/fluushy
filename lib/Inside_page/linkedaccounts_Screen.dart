import 'package:flutter/material.dart';
import 'package:fluushy/All_Custom_Faction/Colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/TextStyle.dart';

class Linkedaccounts_Screen extends StatelessWidget {
  const Linkedaccounts_Screen({super.key});

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
          Text('Manage linked accounts', style: TextStyles.Montserratbold6),
          SizedBox(height: 50),
            Text(
              'Link social media or other accounts for easier login and sharing options.',
              style: TextStyles.Montserratbold8,
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 150,
              child: CustomButton1(
                text: 'Add an account',
                backgroundColor: AppColors.contcolor1,
                onTap: () {
                  // Handle tap
                },
                style: TextStyles.MontserratMedium4,
                icon: Icon(
                  Icons.add,
                  color: AppColors.whitecolor,
                ),
              ),
            ),
        ],),
      ),
    );
  }
}
