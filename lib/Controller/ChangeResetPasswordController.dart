import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Changeresetpasswordcontroller extends GetxController {
  var oldpasswordController = TextEditingController().obs;
  var newpasswordController = TextEditingController().obs;
  var confirmpasswordController = TextEditingController().obs;

}