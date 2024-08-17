import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluushy/All_Custom_Faction/shared_preferences_Page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Usermodel.dart';
import 'All_Widget.dart';
import 'Image.dart';

class ApiUrls {
  static const String MainUrl = 'https://fluushy.devashishsoni.site/api/';
  static const String signuprapiapi = '${MainUrl}signup';
  static const String loginapi = '${MainUrl}signin';
  static const String verifyotpapi = '${MainUrl}verify-otp';
  static const String resendotpapi = '${MainUrl}resend-otp';
}

class AllApiFaction extends GetxController {

  Future<void> signUp(String username, String email, String password, String passwordConfirmation) async {
    Get.dialog(
      lottieAnimation(Get.context!),
      barrierDismissible: false,
    );

    try {
      final String signUpUrl = ApiUrls.signuprapiapi;
      final signUpResponse = await http.post(
        Uri.parse(signUpUrl),
        body: {
          'username': username,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );

      Get.back();

      if (signUpResponse.statusCode == 200) {
        final jsonResponse = jsonDecode(signUpResponse.body);
        final success = jsonResponse['success'];
        final message = jsonResponse['message'];

        if (success == true) {
          showSuccessSnackbar(message,
              icon: Icons.check_circle,
              iconColor: Colors.green,
              containerColor: Colors.green);

          Get.toNamed('/Otpverification_Screen', arguments: {'email': email});
        } else {
          showErrorSnackbar(message);
        }
      } else {
        final message = jsonDecode(signUpResponse.body)['message'] ?? 'An error occurred';
        showErrorSnackbar(message);
      }
    } catch (e) {
      Get.back();
      showErrorSnackbar('An error occurred while processing your request: $e');
    }
  }

  Future<void> login(String email, String password) async {
    Get.dialog(
      lottieAnimation(Get.context!),
      barrierDismissible: false,
    );

    try {
      final String loginUrl = ApiUrls.loginapi;
      final loginResponse = await http.post(
        Uri.parse(loginUrl),
        body: {
          'email': email,
          'password': password,
        },
      );

      final jsonResponse = jsonDecode(loginResponse.body);

      if (loginResponse.statusCode == 200) {
        final UserResponse userResponse = UserResponse.fromJson(jsonResponse);

        Get.back();

        if (userResponse.success == true) {
          final message = userResponse.message!;
          showSuccessSnackbar(message,
              icon: Icons.check_circle,
              iconColor: Colors.green,
              containerColor: Colors.green);

          Data? data = userResponse.data;
          if (data != null) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt('userId', data.id ?? 0);
            await prefs.setString('username', data.username ?? '');
            await prefs.setString('email', data.email ?? '');
            await prefs.setString('password', data.password ?? '');
            await prefs.setBool('isEmailVerified', data.isEmailVerified ?? false);
            await prefs.setInt('v', data.v ?? 0);
            await prefs.setString('token', data.token ?? '');
            await prefs.setBool('isLoggedIn', true);
          }

          Get.offAllNamed('/BottomBar_Page');
        } else {
          final message = userResponse.message!;
          showSuccessSnackbar(message,
              icon: Icons.error_outline,
              iconColor: Colors.red,
              containerColor: Colors.red);
        }
      } else {
        final message = jsonResponse['message'] ?? 'An error occurred';
        showSuccessSnackbar(message,
            icon: Icons.error_outline,
            iconColor: Colors.red,
            containerColor: Colors.red);
      }
    } catch (e) {
      Get.back();
      showSuccessSnackbar('An error occurred while processing your request',
          icon: Icons.error_outline,
          iconColor: Colors.red,
          containerColor: Colors.red);
    }
  }

  Future<void> confirmOtp(String otp, BuildContext context) async {
    final Map<String, dynamic> args = Get.arguments;
    final String email = args['email'];
    print('Email: $email');
    print('OTP: $otp');
    print('API URL: ${ApiUrls.verifyotpapi}');

    Get.dialog(
      lottieAnimation(context),
      barrierDismissible: false,
    );

    try {
      final int otpInt = int.parse(otp);
      final confirmOtpResponse = await http.post(
        Uri.parse(ApiUrls.verifyotpapi),
        body: {'email': email, 'otp': otpInt.toString()},
      );

      final jsonResponse = jsonDecode(confirmOtpResponse.body);

      if (confirmOtpResponse.statusCode == 200) {
        final UserResponse userResponse = UserResponse.fromJson(jsonResponse);

        Get.back();

        if (userResponse.success == true) {
          final message = userResponse.message!;
          showSuccessSnackbar(message,
              icon: Icons.check_circle,
              iconColor: Colors.green,
              containerColor: Colors.green);

          Data? data = userResponse.data;
          if (data != null) {
            await UserPreferences.clearAllData();

            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt('userId', data.id ?? 0);
            await prefs.setString('username', data.username ?? '');
            await prefs.setString('email', data.email ?? '');
            await prefs.setString('password', data.password ?? '');
            await prefs.setBool('isEmailVerified', data.isEmailVerified ?? false);
            await prefs.setInt('v', data.v ?? 0);
            await prefs.setString('token', data.token ?? '');
            await prefs.setBool('isLoggedIn', true);
          }

          Get.offAllNamed('/BottomBar_Page');
        } else {
          final message = userResponse.message!;
          showSuccessSnackbar(message,
              icon: Icons.error_outline,
              iconColor: Colors.red,
              containerColor: Colors.red);
        }
      } else {
        final message = jsonResponse['message'] ?? 'An error occurred';
        showSuccessSnackbar(message,
            icon: Icons.error_outline,
            iconColor: Colors.red,
            containerColor: Colors.red);
      }
    } catch (e) {
      Get.back();
      showSuccessSnackbar('An error occurred while processing your request',
          icon: Icons.error_outline,
          iconColor: Colors.red,
          containerColor: Colors.red);
    }
  }

  Future<void> resendOtp() async {
    try {
      final args = Get.arguments as Map<String, dynamic>?;
      final email = args?['email'];
      if (email == null) {
        _showErrorDialog('Missing email argument');
        return;
      }

      final response = await http.post(Uri.parse(ApiUrls.resendotpapi), body: {'email': email});
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final message = responseData['message'] ?? 'OTP resent successfully';
        showSuccessSnackbar(message,
            icon: Icons.check_circle,
            iconColor: Colors.green,
            containerColor: Colors.green);
      } else {
        showSuccessSnackbar('Failed to resend OTP. Please try again.',
            icon: Icons.error_outline,
            iconColor: Colors.red,
            containerColor: Colors.red);
      }
    } catch (e) {
      showSuccessSnackbar('An error occurred while processing your request.',
          icon: Icons.error_outline,
          iconColor: Colors.red,
          containerColor: Colors.red);
    }
  }

  void _showErrorDialog(String message) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        contentPadding: EdgeInsets.all(0),
        content: AlertDialogBox(message: message),
      ),
      barrierDismissible: false,
    );
  }
}
