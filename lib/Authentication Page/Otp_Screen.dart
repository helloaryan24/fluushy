import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/otpcontroller1.dart';

class Otp_Screen extends StatelessWidget {
  final Otpcontroller controller = Get.put(Otpcontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whitecolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(Images.otplogo),
                ),
                SizedBox(height: 40),
                Text(
                  "OTP Verification",
                  style: TextStyles.Montserratbold6,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "We will send you a one-time password to the registered E-mail",
                  style: TextStyles.MontserratRegular2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                Text(
                  "Enter the registered E-mail",
                  style: TextStyles.MontserratRegular2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                buildInputField1(
                  hintText: "example@gmail.com",
                  controller: controller.gmailController.value,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (query) {
                    // Handle onChanged
                  },
                ),
                SizedBox(height: 50),
                CustomButton5(
                  style: TextStyles.Montserratbold1,
                  backgroundColor: AppColors.contcolor1,
                  onTap: () {
                    Get.toNamed('/Otpverification_Screen');
                  },
                  text: "Get OTP",
                ),
                SizedBox(height: 20), // Adding some space at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
