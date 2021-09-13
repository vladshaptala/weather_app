import 'package:flutter/material.dart';
import 'package:weather_app/models/WeatherForecast.dart';
import 'package:weather_app/utils/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecast> snapshot, int index) {
  var forecastList = snapshot.data!.list;
  var tempMin = forecastList[index].temp.min.toInt();
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0];

  return Column(
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            dayOfWeek,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'min: $tempMin °C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      )
    ],
  );
}
