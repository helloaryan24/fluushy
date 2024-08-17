import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/SplashScreenController.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenController controller = Get.put(SplashScreenController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      body: Center(
        child: Obx(
              () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: controller.isVisible.value ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColors.whitecolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(Images.logo),
                ),
              ),
              SizedBox(height: 20),
              AnimatedOpacity(
                opacity: controller.isVisible.value ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Text(
                  "FLUUSHY",
                  style: TextStyles.Montserratbold9,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
