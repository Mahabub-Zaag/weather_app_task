import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/models/address.dart';

import '../services/geolocation_service.dart';

class GeolocationController extends GetxController {
  final currentLocationLoading = false.obs;
  final currentLocation = LatLng(0.0, 0.0).obs;
  final currentPlaceMark = Placemark().obs;
  final currentAddress = Address().obs;

  Future<void> getCurrentLocation() async {
    try {
      currentLocationLoading(true);
      var position = await GeolocationService.getCurrentLocation();
      // String address = await getAddressFromLocation(position.latitude, position.longitude);
      currentLocation(LatLng(position.latitude, position.longitude));
      debugPrint(
          "Current location: ${currentLocation.value.latitude} , ${currentLocation.value.longitude}");

      // currentAddress(address);
    } catch (err) {
      // checkPermissionIsAllow(false);
      showMassage(err);
    } finally {
      currentLocationLoading(false);
    }
  }

  Future<String?> _getAddressFromLatLng(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address = "";
        if (place.street != null) {
          address += place.street.toString();
        }
        if (place.locality != null) {}
        if (place.administrativeArea != null) {}
        if (place.postalCode != null) {}
        if (place.country != null) {
          address += place.country!;
        }
        return address.trim();
      }
    } catch (e) {
      print("Error fetching address: $e");
    }
    return null;
  }
}
