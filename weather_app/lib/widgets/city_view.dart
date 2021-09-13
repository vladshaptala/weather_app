import 'package:flutter/material.dart';
import 'package:weather_app/models/WeatherForecast.dart';
import 'package:weather_app/utils/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  CityView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(snapshot.data!.list[0].dt * 1000);
    var city = snapshot.data?.city.name;
    var country = snapshot.data?.city.country;

    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '$city, $country',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${Util.getFormattedDate(formattedDate)}',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
