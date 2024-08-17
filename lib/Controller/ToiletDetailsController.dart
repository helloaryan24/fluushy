import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ToiletDetailsController extends GetxController {
  final facilityIcons = {
    'Handicapped': Icons.accessible,
    'Children': Icons.child_care,
    'Senior citizens': Icons.elderly,
  }.obs;

  var facilities = ['Handicapped', 'Children', 'Senior citizens'].obs;
// Add other states and methods as needed
}
