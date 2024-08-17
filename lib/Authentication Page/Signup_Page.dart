import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/signupcontoller.dart';

class SignupPage_Screen extends StatelessWidget {
  final singupcontoller contoller = Get.put(singupcontoller());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.whitecolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10,right: 20,left: 20,bottom: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Images.fluushynamewithlogo),
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
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sign up", style: TextStyles.MontserratSemibold7),
                        SizedBox(height: 30),
                        Text("Email Address",
                            style: TextStyles.MontserratRegular7),
                        SizedBox(height: 5),
                        buildInputField2(
                          hintText: "xyz@Gmail.com",
                          controller: contoller.emailController,
                          keyboardType: TextInputType.name,
                          onChanged: (query) {},
                        ),
                        SizedBox(height: 10),
                        Text("Username",
                            style: TextStyles.MontserratRegular7),
                        SizedBox(height: 5),
                        buildInputField2(
                          hintText: "xyz",
                          controller: contoller.usernameController,
                          keyboardType: TextInputType.name,
                          onChanged: (query) {},
                        ),
                        SizedBox(height: 10),
                        Text("Password", style: TextStyles.MontserratRegular7),
                        SizedBox(height: 5),
                        buildInputField2(
                          hintText: "************",
                          controller: contoller.passwordController,
                          keyboardType: TextInputType.name,
                          obscureText: true,
                          onChanged: (query) {},

                        ),
                        SizedBox(height: 10),
                        Text("Confirm password", style: TextStyles.MontserratRegular7),
                        SizedBox(height: 5),
                        buildInputField2(
                          hintText: "************",
                          controller: contoller.confirmPasswordController,
                          keyboardType: TextInputType.name,
                          obscureText: true,
                          onChanged: (query) {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height *0.03),
                CustomButton(
                  text: 'Sign up',
                  backgroundColor: AppColors.whitecolor,
                  onTap: () {
                    contoller.register();

                  },
                  style: TextStyles.MontserratMedium6,
                  icon: Icon(
                    Icons.arrow_forward,
                    color: AppColors.contcolor1,
                    size: 30,
                  ),
                ),

                SizedBox(height: 10),
            GestureDetector(
              onTap: (){},
              child: Container(
                height: 60,
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: AppColors.whitecolor,
                  borderRadius: BorderRadius.circular(18.0),
                  border: Border.all(width: 2,color: AppColors.contcolor1,),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Continue with Google",
                      textAlign: TextAlign.center,
                      style: TextStyles.MontserratMedium6,
                    ),
                    SizedBox(width: 10,),
                    Image.asset(Images.googlelogo),
                  ],
                ),
              ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
