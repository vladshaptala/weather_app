import 'package:weather_app/models/WeatherForecast.dart';
import 'package:weather_app/utils/Constants.dart';
import 'package:weather_app/utils/location.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, required bool isCity}) async {
    Map<String, String> parameters;
    Location location = Location();

    Position position = await location.getCurrentLocation();

    if (isCity) {
      parameters = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName!
      };
    } else {
      parameters = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': position.latitude.toString(),
        'lon': position.longitude.toString(),
      };
    }

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);

    //log('request ${uri.toString()}');

    var response = await http.get(uri);

    //log('response ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(response.body);
    } else if (response.statusCode == 404) {
      Fluttertoast.showToast(msg: 'City`s name not found. Please try again');
      return Future.error('Error response');
    } else {
      throw Exception('Error response');
    }
  }
}
