import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../All_Custom_Faction/Image.dart';

class Searchcontroller extends GetxController {

  var searchController = TextEditingController().obs;

  var items = [
    {
      'title': 'Sanitation Station',
      'rating': 4.0,
      'reviews': 98,
      'openingHours': '9:00 am to 11:00 pm',
      'facilities': ['Handicapped', 'Children', 'Senior citizens'],
      'imageUrl': Images.LavatoryZone
    },

    {
      'title': 'Sanitation Station',
      'rating': 4.0,
      'reviews': 98,
      'openingHours': '9:00 am to 11:00 pm',
      'facilities': ['Handicapped', 'Senior citizens'],
      'imageUrl': Images.LavatoryZone
    },
    // Add more items as needed
  ].obs;

  // Facility icons mapping
  final facilityIcons = {
    'Handicapped': Icons.accessible,
    'Children': Icons.child_care,
    'Senior citizens': Icons.elderly,
  };
}