import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/APIURL.dart';
import '../All_Custom_Faction/All_Widget.dart';

class Logincontoller extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showDialog('All fields are required!');
    } else if (!EmailValidator.validate(email)) {
      _showDialog('Please enter a valid email address!');
    } else if (password.length < 8) {
      _showDialog('Password must be at least 8 characters long!');
    }
    // else if (!containsUppercaseLetter(password)) {
    //   _showDialog('Password must contain at least one uppercase letter!');
    // } else if (!containsSpecialCharacter(password)) {
    //   _showDialog('Password must contain at least one special character!');
    // }
    else {
      await AllApiFaction().login(email, password);
    }
  }

  void _showDialog(String message) {
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

  bool containsUppercaseLetter(String s) => s.contains(RegExp(r'[A-Z]'));

  bool containsSpecialCharacter(String s) =>
      s.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
}
