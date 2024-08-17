import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../All_Custom_Faction/shared_preferences_Page.dart';

class PersonController extends GetxController {
  var searchController = TextEditingController().obs;
  var username = ''.obs;
  var email = ''.obs; // Add email observable

  @override
  void onInit() {
    super.onInit();
    _loadUsername();
    _loadEmail(); // Load email in onInit
  }

  Future<void> _loadUsername() async {
    String loadedUsername = await UserPreferences.loadUsername();
    username.value = loadedUsername;
  }

  Future<void> _loadEmail() async {
    String loadedEmail = await UserPreferences.loadEmail();
    email.value = loadedEmail; // Update email observable
  }
}
