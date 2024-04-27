import 'dart:convert';

import 'package:get/get.dart';
import 'package:weather_app/core/utils/utils.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherController extends GetxController {
  final loadingWeatherInfo = false.obs;
  final weather = Weather().obs;

  Future<void> getWeatherCurrentWeatherInfo({required query}) async {
    try {
      loadingWeatherInfo.value = true;
      final response = await WeatherService().getCurrentWeather(query);
      if (response.statusCode == 200) {
        weather.value = Weather.fromJson(json.decode(response.body));
        loadingWeatherInfo.value = false;
      } else {
        showMassage(json.decode(response.body)['error']['message']);
        loadingWeatherInfo.value = false;
      }
    } catch (e) {
      loadingWeatherInfo.value = false;
      showMassage(e.toString());
    }
  }
}
