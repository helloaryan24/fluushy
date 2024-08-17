
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Authentication Page/Login_Page.dart';
import '../Authentication Page/OTPVerification_Screen.dart';
import '../Authentication Page/Otp_Screen.dart';
import '../Authentication Page/Signup_Page.dart';
import '../Authentication Page/Splash_Screen.dart';
import '../BottomBar/Bottom_bar.dart';
import '../Inside_page/Accounts_settings.dart';
import '../Inside_page/Change_Reset_password_Screen.dart';
import '../Inside_page/My_reviews.dart';
import '../Inside_page/Notification_Screen.dart';
import '../Inside_page/Settings_Screen.dart';
import '../Inside_page/Updateexisting_Screen.dart';
import '../Inside_page/linkedaccounts_Screen.dart';
import '../Main_Screen/Home_Page.dart';
import '../Main_Screen/toiletsdetalis_Screen.dart';



class AppRoutes {
  static const String initial = '/';
  static const String signinpage = '/SigninPage_Screen';
  static const String signuppage = '/SignupPage_Screen';
  static const String otpscreen = '/otp_screen';
  static const String Otpverification_Screen = '/Otpverification_Screen';
  static const String bottombar = '/BottomBar_Page';
  static const String MyReviewsScreen = '/MyReviews_Screen';
  static const String SettingsPage = '/Settings_Page';
  static const String AccountSettings = '/Account_Settings';
  static const String ChangeResetPasswordScreen = '/ChangeResetPassword_Screen';
  static const String UpdateexistingScreen = '/Updateexisting_Screen';
  static const String LinkedaccountsScreen = '/Linkedaccounts_Screen';
  static const String NotificationScreen = '/Notification_Screen';
  static const String ToiletsdetalisScreen = '/Toiletsdetalis_Screen';


  static final routes = [
    GetPage(
      name: initial,
      page: () => SplashScreen(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: signinpage,
      page: () => LoginPage_Screen(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: signuppage,
      page: () => SignupPage_Screen(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: otpscreen,
      page: () => Otp_Screen(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: bottombar,
      page: () => BottomBarPage(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Otpverification_Screen,
      page: () => OtpverificationScreen(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: MyReviewsScreen,
      page: () => MyReviews_Screen(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: SettingsPage,
      page: () => Settings_Page(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: AccountSettings,
      page: () => Account_Settings(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: ChangeResetPasswordScreen,
      page: () => ChangeResetPassword_Screen(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: UpdateexistingScreen,
      page: () => Updateexisting_Screen(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: LinkedaccountsScreen,
      page: () => Linkedaccounts_Screen(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: NotificationScreen,
      page: () => Notification_Screen(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: ToiletsdetalisScreen,
      page: () => ToiletsDetails_Screen(),
      transitionDuration: Duration(milliseconds: 50),
      transition: Transition.leftToRightWithFade,
    ),

  ];
}
