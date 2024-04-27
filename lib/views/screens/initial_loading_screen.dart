import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/geolocation_controller.dart';
import 'package:weather_app/views/screens/current_weather_screen.dart';

import '../widgets/util_widget/circle_loading.dart';

class InitialLoadingScreen extends StatefulWidget {
  const InitialLoadingScreen({Key? key}) : super(key: key);

  @override
  State<InitialLoadingScreen> createState() => _InitialLoadingScreenState();
}

class _InitialLoadingScreenState extends State<InitialLoadingScreen> {
  final geolocationController = Get.find<GeolocationController>();

  _initCall() async {
    await geolocationController.getCurrentLocation();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initCall();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => geolocationController.currentLocationLoading.value
              ? const Center(
                  child: CircleLoading(),
                )
              : const CurrentWeatherScreen(),
        ),
      ),
    );
  }
}
