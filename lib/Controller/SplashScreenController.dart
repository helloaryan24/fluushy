import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  RxBool isVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    startAnimation();
    navigateToNextScreen();
  }

  void startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    isVisible.value = true;
  }

  void navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Get.offNamed('/BottomBar_Page'); // Navigate to PickupAddress_Page if logged in
    } else {
      Get.offNamed('/SigninPage_Screen'); // Navigate to On_boarding_Page if not logged in
    }
  }
}
