import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../All_Custom_Faction/APIURL.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/Colors.dart';
import 'package:http/http.dart' as http;

import '../Model/Toiletmodel.dart';

// Define a model class for Toilet

class HomePageController extends GetxController {
  final searchController = TextEditingController().obs;
  final mapController = Rx<GoogleMapController?>(null);
  final currentLocation = LatLng(0.0, 0.0).obs;
  final locationName = 'Current Location'.obs;
  final suggestions = <String>[].obs;
  final showBottomSheet = false.obs;
  final customIcon = Rx<BitmapDescriptor?>(null);
  final customIcon1 = Rx<BitmapDescriptor?>(null);
  final mapInitialized = false.obs;
  final selectedHotel = Rxn<Map<String, dynamic>>();
  final nearbyHotels = <Map<String, dynamic>>[].obs;
  LatLng? previousLocation;
  final markers = <Marker>{}.obs;
  final polylines = <Polyline>{}.obs;
  final navigationStarted = RxBool(false);
  var distanceRemaining = 0.0.obs; // Make distanceRemaining reactive
  RxBool isButtonVisible = true.obs;

  // Add the toiletList variable
  final toiletList = <Toilet>[].obs;

  @override
  void onInit() {
    super.onInit();
    startLocationUpdates();
    loadCustomMarkers();
    fetchToiletData();
  }

  Future<void> fetchToiletData() async {
    final url = ApiUrls.gettolietapi; // Your API URL
    print('API URL: $url');

    try {
      // Perform API request
      final response = await http.get(Uri.parse(url));
      print('Response Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        print('API Response: $responseJson');

        // Check if the response has the 'data' key
        if (responseJson.containsKey('data') && responseJson['data'] is List) {
          final data = responseJson['data'] as List;

          // Parse the data into a list of Toilet objects
          toiletList.value = data.map((json) => Toilet.fromJson(json)).toList();
          print("Data fetched successfully: ${toiletList.value}");
        } else {
          print('Invalid API response structure');
          showErrorSnackbar('Failed to load data');
        }
      } else {
        print('API Error: ${response.statusCode} ${response.reasonPhrase}');
        showErrorSnackbar('Failed to load data');
      }
    } catch (e) {
      showErrorSnackbar('An error occurred');
      print('Exception: $e');
    } finally {
      // Hide loading indicator
      Get.back();  // Remove this if Get.dialog() is not being used
    }
  }

  void loadCustomMarkers() async {
    customIcon.value = await _loadMarkerIcon('assets/wc_icon.png', 30);
    customIcon1.value = await _loadMarkerIcon(Images.personimg, 20);
  }

  Future<BitmapDescriptor> _loadMarkerIcon(String path, double size) {
    return BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(size, size)),
      path,
    );
  }

  void startLocationUpdates() {
    Timer.periodic(Duration(seconds: 10), (_) => locateMe());
  }

  Future<List<LatLng>> getPolylinePoints(LatLng start, LatLng end) async {
    try {
      PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
        googleApiKey: ApiUrls.googleapikey,
        request: PolylineRequest(
          origin: PointLatLng(start.latitude, start.longitude),
          destination: PointLatLng(end.latitude, end.longitude),
          mode: TravelMode.driving,
        ),
      );

      if (result.status == 'OK') {
        return result.points.map((e) => LatLng(e.latitude, e.longitude)).toList();
      } else {
        print('Error getting polyline points: ${result.errorMessage}');
        return [];
      }
    } catch (e) {
      print('Exception while getting polyline points: $e');
      return [];
    }
  }

  void cancelNavigation() {
    navigationStarted.value = false;

    // Clear any polylines on the map
    polylines.clear();

    // Reset the distance remaining
    distanceRemaining.value = 0.0;

    // Optionally, clear selected hotel or other state
    selectedHotel.value = null;

    // Optionally, reset the map view or stop further actions related to navigation
    // You can also remove any other markers or routes related to navigation
    mapController.value?.moveCamera(CameraUpdate.newLatLng(currentLocation.value));

    Get.snackbar(
      "Navigation Cancelled",
      "The navigation has been cancelled.",
      backgroundColor: AppColors.gradientcolor1,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 5),
    );
  }

  void addPolyline(LatLng start, LatLng end) async {
    // polylines.clear();
    print("HELLO!");
    navigationStarted.value = true;
    List<LatLng> polylinePoints = await getPolylinePoints(start, end);
    polylines.add(Polyline(
      polylineId: PolylineId('polyline_${start.latitude}_${start.longitude}'),
      color: Colors.blue,
      width: 5,
      points: polylinePoints,
      startCap: Cap.roundCap,
      endCap: Cap.squareCap,
    ));
    distanceRemaining.value = calculateDistance(end); // Update distanceRemaining reactively
    update();
    Future.delayed(Duration(seconds: 5), () => showEndpointPopup(end));
  }

  void showEndpointPopup(LatLng location) {
    if (selectedHotel.value != null) {
      Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: EdgeInsets.all(16),
          titlePadding: EdgeInsets.symmetric(vertical: 12),
          title: Text(
            selectedHotel.value!['name'],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  selectedHotel.value!['image'],
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "You have reached your destination.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text(
                "Close",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.contcolor1, // Customize the color if needed
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  void showCancelNavigationDialog() {
    if (navigationStarted.value) {
      Get.dialog(
        AlertDialog(
          title: Text("Cancel Navigation"),
          content: Text("Do you want to cancel the navigation?"),
          actions: [
            TextButton(
              onPressed: () {
                cancelNavigation();
                Get.back();
              },
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: Text("No"),
            ),
          ],
        ),
      );
    }
  }

  Future<void> locateMe() async {
    if (await _isLocationServiceEnabled() && await _checkPermissions()) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      LatLng newLocation = LatLng(position.latitude, position.longitude);
      if (previousLocation != null && selectedHotel.value != null) {
        addPolyline(previousLocation!, newLocation);
      }
      updateLocation(newLocation, 'Live Location');
      previousLocation = newLocation;
      updateNearbyHotels();
    } else {
      mapInitialized.value = false;
    }
  }

  Future<bool> _isLocationServiceEnabled() async => await Geolocator.isLocationServiceEnabled();
  Future<bool> _checkPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) permission = await Geolocator.requestPermission();
    return permission != LocationPermission.denied && permission != LocationPermission.deniedForever;
  }

  void updateLocation(LatLng newLocation, String? name) {
    currentLocation.value = newLocation;
    locationName.value = name ?? locationName.value;
    mapController.value?.animateCamera(CameraUpdate.newLatLng(newLocation));
    if (customIcon.value != null) {
      markers.add(Marker(
        markerId: MarkerId("current_location"),
        position: newLocation,
        icon: customIcon.value!,
        infoWindow: InfoWindow(title: name ?? "Your Location"),
      ));
      update();
    }
  }

  void updateNearbyHotels() {
    nearbyHotels.value = [
      {'name': 'OYO', 'location': LatLng(26.8396903,75.7726729), 'image': Images.googlelogo},
    ];
    updateMarkersForNearbyHotels();
  }

  void updateMarkersForNearbyHotels() {
    markers.removeWhere((marker) => marker.markerId.value != "current_location");
    for (var hotel in nearbyHotels) {
      markers.add(Marker(
        markerId: MarkerId(hotel['name']),
        position: hotel['location'],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(
          title: hotel['name'],
          snippet: "${calculateDistance(hotel['location']).toStringAsFixed(2)} km away",
        ),
        onTap: () => onMarkerTapped(hotel),
      ));
    }
    update();
  }

  double calculateDistance(LatLng location) {
    return Geolocator.distanceBetween(
      currentLocation.value.latitude,
      currentLocation.value.longitude,
      location.latitude,
      location.longitude,
    ) / 1000;
  }

  void onMarkerTapped(Map<String, dynamic> hotel) {
    selectedHotel.value = hotel;
  }

  void toggleBottomSheet() => showBottomSheet.value = !showBottomSheet.value;

  void searchLocation(String query) {
    updateLocation(LatLng(26.864608, 75.764692), 'Searched Location');
  }
}
