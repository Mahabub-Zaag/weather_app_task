import 'package:get/get.dart';
import 'package:weather_app/views/screens/current_weather_screen.dart';

final List<GetPage<dynamic>> RoutePages = [
  GetPage(
    name: "/",
    page: () => const CurrentWeatherScreen(),
  )
];
