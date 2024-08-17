import 'package:get/get.dart';

class NotificationController extends GetxController {
  var allowNotificationForNewReviews = false.obs;
  var nearbyToilets = false.obs;
  var emailNotifications = false.obs;

  void toggleAllowNotificationForNewReviews() {
    allowNotificationForNewReviews.value = !allowNotificationForNewReviews.value;
  }

  void toggleNearbyToilets() {
    nearbyToilets.value = !nearbyToilets.value;
  }

  void toggleEmailNotifications() {
    emailNotifications.value = !emailNotifications.value;
  }
}
