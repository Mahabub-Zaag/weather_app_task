import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/core/utils/utils.dart';

import '../services/geolocation_service.dart';

class GeolocationController extends GetxController{
  final currentLocationLoading = false.obs;
  final currentLocation = LatLng(0.0, 0.0).obs;


  Future<void> getCurrentLocation() async {
    try {
      currentLocationLoading(true);
      var position = await GeolocationService.getCurrentLocation();
      // String address = await getAddressFromLocation(position.latitude, position.longitude);
      currentLocation(LatLng(position.latitude, position.longitude));
      debugPrint("Current location: ${currentLocation.value.latitude} , ${currentLocation.value.longitude}");

      // currentAddress(address);
    } catch (err) {
      // checkPermissionIsAllow(false);
      showMassage(err);
    } finally {
      currentLocationLoading(false);
    }
  }
}