// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:fluushy/All_Custom_Faction/Colors.dart';
// import '../All_Custom_Faction/All_Widget.dart';
// import '../All_Custom_Faction/Image.dart';
// import '../All_Custom_Faction/TextStyle.dart';
// import '../Controller/HomeController.dart';
//
// class HomePage_Screen extends StatelessWidget {
//   const HomePage_Screen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Initialize the controller
//     final HomePageController controller = Get.put(HomePageController());
//
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColors.whitecolor,
//         body: LayoutBuilder(
//           builder: (context, constraints) {
//             // Define the height of the GoogleMap based on the screen height
//             double mapHeight = constraints.maxHeight * 0.6; // Adjust the multiplier as needed
//
//             return Column(
//               children: [
//                 SizedBox(height: 20),
//                 Text(
//                   "FLUUSHY",
//                   style: TextStyles.Montserratbold9,
//                 ),
//                 SizedBox(height: 10), // Add spacing between text and image
//                 Image.asset(Images.logo, fit: BoxFit.fill, width: 200),
//                 SizedBox(height: 10), // Add spacing between image and input field
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                   child: Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: AppColors.contcolor1,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: buildInputField(
//                       hintText: "Search toilets & amenities",
//                       controller: controller.searchController.value,
//                       keyboardType: TextInputType.name,
//                       onChanged: (query) {
//                         controller.searchLocation(query);
//                       },
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     width: double.infinity,
//                     child: Obx(() {
//                       final customIcon = controller.customIcon.value;
//
//                       return GoogleMap(
//                         initialCameraPosition: CameraPosition(
//                           target: controller.currentLocation.value,
//                           zoom: 15,
//                         ),
//                         myLocationEnabled: true,
//                         myLocationButtonEnabled: false,
//                         zoomControlsEnabled: true,
//                         markers: {
//                           Marker(
//                             markerId: MarkerId('currentLocation'),
//                             position: controller.currentLocation.value,
//                             icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//                             infoWindow: InfoWindow(
//                               title: controller.locationName.value,
//                             ),
//                           ),
//                           ...controller.nearbyHotels.map((hotel) => Marker(
//                             markerId: MarkerId(hotel['name'] as String), // Cast 'name' to String
//                             position: hotel['location'] as LatLng, // Cast 'location' to LatLng
//                             icon: customIcon!, // Use the custom home icon
//                             infoWindow: InfoWindow(
//                               title: hotel['name'] as String, // Cast 'name' to String
//                             ),
//                           )).toSet(),
//                         },
//                         onMapCreated: (GoogleMapController gMapController) {
//                           controller.mapController.value = gMapController;
//                         },
//                       );
//                     }),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// ====================================

//
// import 'package:flutter/cupertino.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class HomePageController extends GetxController {
//   var searchController = TextEditingController().obs;
//   var mapController = Rx<GoogleMapController?>(null);
//   var currentLocation = LatLng(26.864608, 75.764692).obs;
//   var locationName = 'Current Location'.obs;
//   var suggestions = <String>[].obs;
//   RxBool showBottomSheet = false.obs;
//   var customIcon = Rx<BitmapDescriptor?>(null); // Add this line
//
//   // List of nearby hotels
//   var nearbyHotels = [
//     {
//       'name': 'toilets A',
//       'location': LatLng(26.865608, 75.764692),
//     },
//     {
//       'name': 'toilets B',
//       'location': LatLng(26.864908, 75.764892),
//     },
//     {
//       'name': 'toilets C',
//       'location': LatLng(26.864408, 75.764292),
//     },
//
//     {
//       'name': 'toilets d',
//       'location': LatLng(26.864408, 75.764292),
//     },
//     {
//       'name': 'toilets E',
//       'location': LatLng(26.864408, 75.764292),
//     },
//     {
//       'name': 'toilets F',
//       'location': LatLng(26.864408, 75.764292),
//     },
//   ].obs;
//
//   void updateLocation(LatLng newLocation, [String? name]) {
//     currentLocation.value = newLocation;
//     if (name != null) {
//       locationName.value = name;
//     }
//     mapController.value?.animateCamera(
//       CameraUpdate.newLatLng(newLocation),
//     );
//   }
//
//   void toggleBottomSheet() {
//     showBottomSheet.value = !showBottomSheet.value;
//   }
//
//   void searchLocation(String query) {
//     LatLng searchedLocation = LatLng(26.864608, 75.764692); // Placeholder value
//     updateLocation(searchedLocation, 'Searched Location');
//   }
//
//   Future<String?> getPlaceId(String address) async {
//     return 'PLACE_ID';
//   }
//
//   void selectLocation(String placeId) {
//     LatLng selectedLocation = LatLng(26.864608, 75.764692); // Placeholder value
//     updateLocation(selectedLocation, 'Selected Location');
//     searchController.value.clear();
//     suggestions.clear();
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadCustomMarker();
//   }
//
//   void loadCustomMarker() async {
//     final icon = await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(size: Size(50, 50)),
//       'assets/wc_icon.png',
//     );
//     customIcon.value = icon;
//   }
// }



//Home page
//==================
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:fluushy/All_Custom_Faction/Colors.dart';
// import '../All_Custom_Faction/All_Widget.dart';
// import '../All_Custom_Faction/Image.dart';
// import '../All_Custom_Faction/TextStyle.dart';
// import '../Controller/HomeController.dart';
//
// class HomePage_Screen extends StatelessWidget {
//   const HomePage_Screen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Initialize the controller
//     final HomePageController controller = Get.put(HomePageController());
//
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColors.whitecolor,
//         body: LayoutBuilder(
//           builder: (context, constraints) {
//             // Define the height of the GoogleMap based on the screen height
//             double mapHeight = constraints.maxHeight * 0.6; // Adjust the multiplier as needed
//
//             return Column(
//               children: [
//                 SizedBox(height: 20),
//                 Text(
//                   "FLUUSHY",
//                   style: TextStyles.Montserratbold9,
//                 ),
//                 SizedBox(height: 10), // Add spacing between text and image
//                 Image.asset(Images.logo, fit: BoxFit.fill, width: 200),
//                 SizedBox(height: 10), // Add spacing between image and input field
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                   child: Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: AppColors.contcolor1,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: buildInputField(
//                       hintText: "Search toilets & amenities",
//                       controller: controller.searchController.value,
//                       keyboardType: TextInputType.name,
//                       onChanged: (query) {
//                         controller.searchLocation(query);
//                       },
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     width: double.infinity,
//                     child: Obx(() {
//                       final customIcon = controller.customIcon.value;
//
//                       return GoogleMap(
//                         initialCameraPosition: CameraPosition(
//                           target: controller.currentLocation.value,
//                           zoom: 15,
//                         ),
//                         myLocationEnabled: true,
//                         myLocationButtonEnabled: false,
//                         zoomControlsEnabled: true,
//                         markers: {
//                           Marker(
//                             markerId: MarkerId('currentLocation'),
//                             position: controller.currentLocation.value,
//                             icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//                             infoWindow: InfoWindow(
//                               title: controller.locationName.value,
//                             ),
//                           ),
//                           ...controller.nearbyHotels.map((hotel) => Marker(
//                             markerId: MarkerId(hotel['name'] as String), // Cast 'name' to String
//                             position: hotel['location'] as LatLng, // Cast 'location' to LatLng
//                             icon: customIcon!, // Use the custom home icon
//                             infoWindow: InfoWindow(
//                               title: hotel['name'] as String, // Cast 'name' to String
//                             ),
//                           )).toSet(),
//                         },
//                         onMapCreated: (GoogleMapController gMapController) {
//                           controller.mapController.value = gMapController;
//                         },
//                       );
//                     }),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/cupertino.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class HomePageController extends GetxController {
//   var searchController = TextEditingController().obs;
//   var mapController = Rx<GoogleMapController?>(null);
//   var currentLocation = LatLng(26.864608, 75.764692).obs;
//   var locationName = 'Current Location'.obs;
//   var suggestions = <String>[].obs;
//   RxBool showBottomSheet = false.obs;
//   var customIcon = Rx<BitmapDescriptor?>(null); // Add this line
//
//   // List of nearby hotels
//   var nearbyHotels = [
//     {
//       'name': 'toilets A',
//       'location': LatLng(26.865608, 75.764691),
//     },
//     {
//       'name': 'toilets B',
//       'location': LatLng(26.864908, 75.764890),
//     },
//     {
//       'name': 'toilets C',
//       'location': LatLng(26.864408, 75.764210),
//     },
//     {
//       'name': 'toilets d',
//       'location': LatLng(26.864408, 75.764294),
//     },
//     {
//       'name': 'toilets E',
//       'location': LatLng(26.864408, 75.764295),
//     },
//     {
//       'name': 'toilets F',
//       'location': LatLng(26.864408, 75.764293),
//     },
//   ].obs;
//
//   void updateLocation(LatLng newLocation, [String? name]) {
//     currentLocation.value = newLocation;
//     if (name != null) {
//       locationName.value = name;
//     }
//     mapController.value?.animateCamera(
//       CameraUpdate.newLatLng(newLocation),
//     );
//   }
//
//   void toggleBottomSheet() {
//     showBottomSheet.value = !showBottomSheet.value;
//   }
//
//   void searchLocation(String query) {
//     LatLng searchedLocation = LatLng(26.864608, 75.764692); // Placeholder value
//     updateLocation(searchedLocation, 'Searched Location');
//   }
//
//   Future<String?> getPlaceId(String address) async {
//     return 'PLACE_ID';
//   }
//
//   void selectLocation(String placeId) {
//     LatLng selectedLocation = LatLng(26.864608, 75.764692); // Placeholder value
//     updateLocation(selectedLocation, 'Selected Location');
//     searchController.value.clear();
//     suggestions.clear();
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadCustomMarker();
//   }
//
//   void loadCustomMarker() async {
//     final icon = await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(size: Size(50, 50)),
//       'assets/wc_icon.png',
//     );
//     customIcon.value = icon;
//   }
// }
