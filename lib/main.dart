import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/geolocation_controller.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/views/screens/initial_loading_screen.dart';

import 'core/routes/Route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      initialRoute: '/',
      getPages: RoutePages,
      initialBinding: BindingsBuilder(() {
        Get.put(GeolocationController());
        Get.put(WeatherController());
      }),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const InitialLoadingScreen(),
    );
  }
}
