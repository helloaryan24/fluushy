import 'package:flutter/material.dart';
import 'package:fluushy/All_Custom_Faction/Colors.dart';
import 'package:fluushy/All_Custom_Faction/TextStyle.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../Controller/LoginContoller.dart';

class LoginPage_Screen extends StatelessWidget {
  final Logincontoller contoller = Get.put(Logincontoller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.whitecolor,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text("Welcome\nBack...", style: TextStyles.MontserratRegular8),
                SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.gradientcolor1,
                        AppColors.gradientcolor2,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sign in", style: TextStyles.MontserratSemibold7),
                        SizedBox(height: 10),
                        Text("Email Address",
                            style: TextStyles.MontserratRegular7),
                        SizedBox(height: 5),
                        buildInputField2(
                          hintText: "xyz@Gmail.com",
                          controller: contoller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (query) {},
                        ),
                        SizedBox(height: 20),
                        Text("Password", style: TextStyles.MontserratRegular7),
                        SizedBox(height: 5),
                        buildInputField2(
                          hintText: "************",
                          controller: contoller.passwordController,
                          keyboardType: TextInputType.name,
                          obscureText: true,
                          onChanged: (query) {},
                        ),
                        SizedBox(height: 20),
                        Text("Forgot Password?",
                            style: TextStyles.MontserratRegular7),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                CustomButton(
                  text: 'Sign in',
                  backgroundColor: AppColors.contcolor1,
                  onTap: () {
                    contoller.login();

                  },
                  style: TextStyles.MontserratMedium3,
                  icon: Icon(
                    Icons.arrow_forward,
                    color: AppColors.whitecolor,
                    size: 30,
                  ),
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: 'Sign up',
                  backgroundColor: AppColors.whitecolor,
                  onTap: () {
                    Get.toNamed('/SignupPage_Screen');
                    // Handle tap
                  },
                  style: TextStyles.MontserratMedium6,
                  icon: Icon(
                    Icons.arrow_forward,
                    color: AppColors.contcolor1,
                    size: 30,
                  ),
                ),
                // SizedBox(height: 10),
                // CustomButton(
                //   text: 'Sign in',
                //   backgroundColor: AppColors.contcolor1,
                //   onTap: () {
                //     // Handle tap
                //   },
                //   style: TextStyles.MontserratMedium3,
                //   icon: Icon(
                //     Icons.arrow_forward,
                //     color: AppColors.whitecolor,
                //     size: 30,
                //   ),
                // ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
