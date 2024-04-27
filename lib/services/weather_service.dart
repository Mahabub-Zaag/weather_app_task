import 'package:http/http.dart' as http;
import 'package:weather_app/core/constant/string_constant.dart';
import 'package:weather_app/core/helpers/api_url.dart';

class WeatherService {
  Future<http.Response> getCurrentWeather(dynamic query) async {
    String url = '$GET_CURRENT_WEATHER_API?key=$WEATHER_API_KEY&q=$query';
    return http.get(Uri.parse(url), );
  }
}