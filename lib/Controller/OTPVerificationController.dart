import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import to handle JSON

import '../All_Custom_Faction/APIURL.dart';
import '../All_Custom_Faction/All_Widget.dart';

class Otpverificationcontroller extends GetxController {
  final mpinController = TextEditingController();
  final pin = ''.obs;

  @override
  void dispose() {
    mpinController.dispose();
    super.dispose();
  }

  void onPinChanged(String userInput) {
    pin.value = userInput;
  }

  Future<void> Verifyotp(BuildContext context) async {
    final otp = mpinController.text.trim();
    if (otp.isEmpty) {
      _showErrorDialog('Otp field is empty');
      return;
    }

    await AllApiFaction().confirmOtp(otp, context);
  }

  Future<void> resendotp(BuildContext context) async {
    await AllApiFaction().resendOtp();
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


