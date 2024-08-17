import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Ensure you have this import for using Image.asset
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../All_Custom_Faction/Image.dart';

class HomePageController extends GetxController {
  var searchController = TextEditingController().obs;
  var mapController = Rx<GoogleMapController?>(null);
  var currentLocation = LatLng(26.864608, 75.764692).obs;
  var locationName = 'Current Location'.obs;
  var suggestions = <String>[].obs;
  RxBool showBottomSheet = false.obs;
  var customIcon = Rx<BitmapDescriptor?>(null);

  var nearbyHotels = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCustomMarker();
  }

  Future<bool> _isLocationServiceEnabled() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      return false;
    }
    return true;
  }

  Future<bool> _checkPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> locateMe() async {
    if (await _isLocationServiceEnabled() && await _checkPermissions()) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude,
      );

      // Update the map with the new location
      LatLng newLocation = LatLng(position.latitude, position.longitude);
      updateLocation(newLocation, 'Live Location');
      print(newLocation);

      // Optionally update nearby hotels with new data
      updateNearbyHotels();
    }
  }

  void updateLocation(LatLng newLocation, [String? name]) {
    currentLocation.value = newLocation;
    if (name != null) {
      locationName.value = name;
    }
    mapController.value?.animateCamera(
      CameraUpdate.newLatLng(newLocation),
    );
  }

  void updateNearbyHotels() {
    // Example data, replace with actual data fetching logic
    nearbyHotels.value = [
      {
        'name': 'toilets A',
        'location': LatLng(26.8412232, 75.7727111),
        'image':  Images.googlelogo
      },
      {
        'name': 'toilets B',
        'location': LatLng(26.8401234, 75.7712345),
        'image':  Images.googlelogo
      },
      {
        'name': 'toilets C',
        'location': LatLng(26.8391234, 75.7701234),
        'image':  Images.googlelogo
      },
    ];
  }

  void toggleBottomSheet() {
    showBottomSheet.value = !showBottomSheet.value;
  }

  void searchLocation(String query) {
    LatLng searchedLocation = LatLng(26.864608, 75.764692); // Placeholder value
    updateLocation(searchedLocation, 'Searched Location');
  }

  Future<String?> getPlaceId(String address) async {
    return 'PLACE_ID';
  }

  void selectLocation(String placeId) {
    LatLng selectedLocation = LatLng(26.864608, 75.764692); // Placeholder value
    updateLocation(selectedLocation, 'Selected Location');

    searchController.value.clear();
    suggestions.clear();
  }

  void loadCustomMarker() async {
    final icon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(50, 50)),
      'assets/wc_icon.png',
    );
    customIcon.value = icon;
  }

  void onMarkerTapped(Map<String, dynamic> hotel) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              hotel['name'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset(
              hotel['image'],
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
