import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/HomeController.dart';

class HomePage_Screen extends StatelessWidget {
  const HomePage_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.put(HomePageController());
    controller.locateMe();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whitecolor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "FLUUSHY",
                  style: TextStyles.Montserratbold9,
                ),
                SizedBox(height: 10),
                Image.asset(Images.logo, fit: BoxFit.fill, width: 200),
                SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.contcolor1,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: buildInputField(
                      hintText: "Search toilets & amenities",
                      controller: controller.searchController.value,
                      keyboardType: TextInputType.name,
                      onChanged: (query) {
                        controller.searchLocation(query);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    return GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: controller.currentLocation.value,
                        zoom: 15,
                      ),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      zoomControlsEnabled: true,
                      markers: {
                        Marker(
                          markerId: MarkerId('currentLocation'),
                          position: controller.currentLocation.value,
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueRed),
                          infoWindow: InfoWindow(
                            title: controller.locationName.value,
                          ),
                        ),
                        ...controller.nearbyHotels
                            .map((hotel) => Marker(
                                  markerId: MarkerId(hotel['name'] as String),
                                  position: hotel['location'] as LatLng,
                                  icon: controller.customIcon.value ??
                                      BitmapDescriptor.defaultMarker,
                                  draggable: true,
                                  flat: true,
                                  visible: true,

                                ))
                            .toSet(),
                      },
                      onMapCreated: (GoogleMapController gMapController) {
                        controller.mapController.value = gMapController;
                      },
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
