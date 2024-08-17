import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../All_Custom_Faction/APIURL.dart';
import '../All_Custom_Faction/All_Widget.dart';

class singupcontoller extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<void> register() async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      showEmptyFieldDialog();
    } else if (username.length <= 5) {
      showInvalidUsernameLengthDialog();
    } else if (!EmailValidator.validate(email)) {
      showInvalidEmailDialog();
    } else if (password.length < 8) {
      showInvalidPasswordLengthDialog();
    } else if (!containsUppercaseLetter(password)) {
      showMissingUppercaseLetterDialog();
    } else if (!containsSpecialCharacter(password)) {
      showMissingSpecialCharacterDialog();
    } else if (password != confirmPassword) {
      showPasswordMismatchDialog();
    } else {
      await AllApiFaction().signUp(username, email, password, confirmPassword);
    }
  }

  void signup() {
    Get.back(); // Navigate to the previous page
  }

  void signupdone() {
    Get.offAllNamed('/BottomBar_Page'); // Navigate to bottom bar page
  }


  void showEmptyFieldDialog() {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        contentPadding: EdgeInsets.all(0),
        content: AlertDialogBox(
          message: 'All fields are required!',
        ),
      ),
    );
  }

  void showInvalidUsernameLengthDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        content: AlertDialogBox(
          message: 'Username must be more than 5 characters!',
        ),
      ),
      barrierDismissible: false,
    );
  }

  void showInvalidEmailDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        content: AlertDialogBox(
          message: 'Please enter a valid email address!',
        ),
      ),
      barrierDismissible: false,
    );
  }

  void showInvalidPasswordLengthDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        content: AlertDialogBox(
          message: 'Password must be at least 8 characters long!',
        ),
      ),
      barrierDismissible: false,
    );
  }

  void showMissingUppercaseLetterDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        content: AlertDialogBox(
          message: 'Password must contain at least one uppercase letter!',
        ),
      ),
      barrierDismissible: false,
    );
  }

  void showMissingSpecialCharacterDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        content: AlertDialogBox(
          message: 'Password must contain at least one special character!',
        ),
      ),
      barrierDismissible: false,
    );
  }

  void showPasswordMismatchDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        content: AlertDialogBox(
          message: 'Passwords do not match!',
        ),
      ),
      barrierDismissible: false,
    );
  }

  void showErrorSnackbar(String message) {
    showSuccessSnackbar(message,
        icon: Icons.error_outline, iconColor: Colors.red, containerColor: Colors.red);
  }

  bool containsUppercaseLetter(String s) {
    return s.contains(RegExp(r'[A-Z]'));
  }

  bool containsSpecialCharacter(String s) {
    return s.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
}
