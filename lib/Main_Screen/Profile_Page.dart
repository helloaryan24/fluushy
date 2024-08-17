import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluushy/All_Custom_Faction/Colors.dart';
import 'package:fluushy/All_Custom_Faction/TextStyle.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../Controller/PersonContoller.dart';

class ProfilePage_Screen extends StatelessWidget {
  final PersonController controller = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whitecolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: AppColors.contcolor1,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Update profile picture",
                      style: TextStyles.MontserratSemibold3,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.contcolor1,
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Obx(() => buildInputField1(
                  hintText: "Name",
                  controller: TextEditingController(text: controller.username.value),
                  keyboardType: TextInputType.name,
                  onChanged: (query) {
                    // controller.searchLocation(query);
                  },
                )),
                SizedBox(height: 10),
            Obx(() => buildInputField1(
                  hintText: "Gmail",
                  controller: TextEditingController(text: controller.email.value),
                  keyboardType: TextInputType.name,
                  onChanged: (query) {
                    // controller.searchLocation(query);
                  },
                )),
                SizedBox(height: 10),
                buildInputField1(
                  hintText: "Location",
                  controller: controller.searchController.value,
                  keyboardType: TextInputType.name,
                  onChanged: (query) {
                    // controller.searchLocation(query);
                  },
                ),
                SizedBox(height: 10),
                CustomButton4(
                  style: TextStyles.Montserratbold1,
                  backgroundColor: AppColors.contcolor1,
                  onTap: () {},
                  text: "Edit Profile",
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton2(
                        text: 'My reviews',
                        backgroundColor: AppColors.contcolor1,
                        onTap: () {
                          Get.toNamed('/MyReviews_Screen');
                        },
                        style: TextStyles.MontserratMedium3,
                        icon: Icon(
                          Icons.reviews,
                          color: AppColors.whitecolor,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomButton2(
                        text: 'Settings',
                        backgroundColor: AppColors.contcolor1,
                        onTap: () {
                          // Handle tap
                          Get.toNamed('/Settings_Page');
                        },
                        style: TextStyles.MontserratMedium3,
                        icon: Icon(
                          Icons.settings,
                          color: AppColors.whitecolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
