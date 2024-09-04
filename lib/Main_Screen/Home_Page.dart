import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/HomeController.dart';

class HomePage_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.put(HomePageController());

    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.whitecolor,
        elevation: 5,
        centerTitle: true,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.logo,
              fit: BoxFit.fill,
              width: 40,
            ),
            Text(
              "FLUUSHY",
              style: TextStyles.Montserratbold6,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Obx(() => Stack(
                children: [
                  // Google Map
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: controller.currentLocation.value,
                      zoom: 18,
                    ),
                    myLocationEnabled: false,
                    tiltGesturesEnabled: true,
                    compassEnabled: true,
                    scrollGesturesEnabled: true,
                    zoomGesturesEnabled: true,
                    mapToolbarEnabled: false,
                    indoorViewEnabled: true,
                    circles: {
                      Circle(
                        visible: true,
                        strokeColor: Colors.black,
                        circleId: const CircleId("1"),
                        center: controller.currentLocation.value,
                        // Use the correct location variable
                        radius: 100,
                        strokeWidth: 1,
                        fillColor: AppColors.gradientcolor1.withOpacity(0.2),
                      ),
                    },
                    markers: {
                      Marker(
                        markerId: MarkerId('Devi Lal'),
                        position: controller.currentLocation.value,
                        icon: controller.customIcon1.value ??
                            BitmapDescriptor.defaultMarker,
                        infoWindow: InfoWindow(
                          title: controller.locationName.value,
                        ),
                      ),
                      ...controller.nearbyHotels.map((hotel) {
                        return Marker(
                          markerId: MarkerId(hotel['name'] as String),
                          position: hotel['location'] as LatLng,
                          icon: controller.customIcon.value ??
                              BitmapDescriptor.defaultMarker,
                          infoWindow: InfoWindow(
                            title: hotel['name'],
                          ),
                          onTap: () {
                            controller.onMarkerTapped(hotel);
                          },
                        );
                      }).toSet(),
                    },
                    onMapCreated: (GoogleMapController gMapController) {
                      controller.mapController.value = gMapController;
                      controller.mapInitialized.value = true;
                    },
                    polylines: controller.polylines,
                  ),
                  // Navigation Container
                  if (controller.navigationStarted.value)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Obx(() => Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Navigation',
                                      style: TextStyles.MontserratSemibold6,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.isButtonVisible.value =
                                            !controller.isButtonVisible.value;
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Icon(
                                          controller.isButtonVisible.value
                                              ? Icons.arrow_drop_up
                                              : Icons.arrow_drop_down,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5),

                                // Wrap button in Visibility widget to control its visibility
                                Visibility(
                                  visible: controller.isButtonVisible.value,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller
                                          .cancelNavigation(); // Handle stopping navigation
                                      controller.isButtonVisible.value =
                                          false; // Hide button when clicked
                                    },
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColors.contcolor1,
                                        border: Border.all(
                                            color: AppColors.contcolor1,
                                            width: 1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Cancel Navigation",
                                            style: TextStyles.Montserratbold3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(width: 10),
                                          Icon(
                                            Icons.navigation,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),

                                // Show distance remaining only when navigation has started
                                Obx(() => Text(
                                      'Distance: ${controller.distanceRemaining.value.toStringAsFixed(2)} km',
                                      style: TextStyles.MontserratMedium,
                                    )),
                              ],
                            ),
                          )),
                    ),
                  // Additional Popup
                  if (controller.navigationStarted.value ||
                      controller.showAdditionalPopup.value)
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: GestureDetector(
                        onTap: () {
                          controller.toggleAdditionalPopup();
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.qr_code_scanner_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),

                  Positioned(
                    // top: 300,
                    left: 10,
                    right: 100,
                    bottom: 70,
                    child: Obx(() => Visibility(
                          visible: controller.showAdditionalPopup.value,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                Images.qrcodeimg,
                                // Replace with your local image path
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )),
                  ),

                  if (!controller.navigationStarted.value)
                    Positioned(
                      top: 10,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: AppColors.whitecolor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 2, color: AppColors.contcolor1)),
                          child: TextField(
                            controller: controller.searchController.value,
                            decoration: InputDecoration(
                              hintText: "Search toilets & amenities",
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                            ),
                            onChanged: (query) {
                              controller.searchLocation(query);
                            },
                          ),
                        ),
                      ),
                    ),
                  // Positioned Hotel Information Container
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Obx(() {
                      if (controller.selectedHotel.value != null) {
                        var hotel = controller.selectedHotel.value!;
                        return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    hotel['name'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        controller.selectedHotel.value = null;
                                      },
                                      child: Icon(Icons.cancel_rounded,
                                          size: 30, color: Colors.red))
                                ],
                              ),
                              SizedBox(height: 10),
                              Image.asset(
                                hotel['image'],
                                fit: BoxFit.cover,
                                height: 150,
                                width: double.infinity,
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  print("HELLO!");
                                  controller.addPolyline(
                                    controller.currentLocation.value,
                                    hotel['location'],
                                  );
                                  controller.selectedHotel.value =
                                      null; // Hide the bottom sheet
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.contcolor1,
                                    border: Border.all(
                                        color: AppColors.contcolor1, width: 1),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Directions",
                                        style: TextStyles.Montserratbold3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.navigation,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    }),
                  ),

                  Positioned(
                    bottom: 100,
                    right: 5,
                    child: FloatingActionButton(
                      backgroundColor: Colors.blue.withOpacity(0.9),
                      onPressed: () {
                        // Move camera to the current location
                        controller.mapController.value?.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: controller.currentLocation.value,
                              zoom: 15,
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.my_location,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
