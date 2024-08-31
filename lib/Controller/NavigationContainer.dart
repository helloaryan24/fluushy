import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NavigationContainer extends StatelessWidget {
  final LatLng destination;
  final double distanceRemaining;
  final VoidCallback onCancel;

  NavigationContainer({
    required this.destination,
    required this.distanceRemaining,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white.withOpacity(0.9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Navigating to: ${destination.latitude}, ${destination.longitude}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Distance remaining: ${distanceRemaining.toStringAsFixed(2)} km',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: onCancel,
              child: Text('Cancel Navigation'),
            ),
          ],
        ),
      ),
    );
  }
}
