import 'current.dart';
import 'location.dart';

class Weather {
  Location? location;
  Current? current;

  Weather({this.location, this.current});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      current: Current.fromJson(json['current']),
      location: Location.fromJson(json['location']),
    );
  }
}
