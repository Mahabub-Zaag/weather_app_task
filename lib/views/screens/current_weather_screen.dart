import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weather_app/controllers/geolocation_controller.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/views/widgets/util_widget/circle_loading.dart';

class CurrentWeatherScreen extends StatefulWidget {
  const CurrentWeatherScreen({Key? key}) : super(key: key);

  @override
  _CurrentWeatherScreenState createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  final weatherController = Get.find<WeatherController>();
  final geolocationController = Get.find<GeolocationController>();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  _initCall() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await weatherController.getWeatherCurrentWeatherInfo(
          query:
              '${geolocationController.currentLocation.value.latitude.toStringAsFixed(2)},${geolocationController.currentLocation.value.longitude.toStringAsFixed(2)}');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _initCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: () {
          _initCall();
        },
        onLoading: () {},
        child: SafeArea(
          child: Obx(
            () => weatherController.loadingWeatherInfo.value
                ? const Center(
                    child: CircleLoading(),
                  )
                : Container(
                    child: Center(
                        child: Text(
                            weatherController.weather.value.location?.name ??
                                "")),
                  ),
          ),
        ),
      ),
    );
  }
}
