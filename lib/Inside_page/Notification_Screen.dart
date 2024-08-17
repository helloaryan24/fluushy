import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluushy/All_Custom_Faction/Colors.dart';
import 'package:get/get.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/NotificationContoller.dart';

class Notification_Screen extends StatelessWidget {
  const Notification_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.put(NotificationController());

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
            Text('Notification & preferences', style: TextStyles.Montserratbold6),
            SizedBox(height: 50),
            Text(
              'Notifications related to new reviews, nearby toilets, or updates to their contributions.',
              style: TextStyles.Montserratbold8,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.contcolor1,
                    ),
                    child: Column(
                      children: [
                        Obx(
                              () => CheckboxListTile(
                                activeColor: AppColors.whitecolor,
                            checkColor: AppColors.blackcolor,


                            title: Text('Allow notification for new reviews', style: TextStyles.MontserratRegular7),
                            value: controller.allowNotificationForNewReviews.value,
                            onChanged: (bool? value) {
                              controller.toggleAllowNotificationForNewReviews();
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Obx(
                              () => CheckboxListTile(
                                activeColor: AppColors.whitecolor,
                                checkColor: AppColors.blackcolor,

                                title: Text('Nearby toilets', style: TextStyles.MontserratRegular7),
                            value: controller.nearbyToilets.value,
                            onChanged: (bool? value) {
                              controller.toggleNearbyToilets();
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Obx(
                              () => CheckboxListTile(
                                activeColor: AppColors.whitecolor,
                                checkColor: AppColors.blackcolor,

                                title: Text('E-mail notifications', style: TextStyles.MontserratRegular7),
                            value: controller.emailNotifications.value,
                            onChanged: (bool? value) {
                              controller.toggleEmailNotifications();
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
