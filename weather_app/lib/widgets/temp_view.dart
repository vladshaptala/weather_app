import 'package:flutter/material.dart';
import 'package:weather_app/models/WeatherForecast.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var weatherList = snapshot.data!.list;
    var icon = weatherList[0].getIconUrl();
    var temp = weatherList[0].temp.day.toStringAsFixed(1);
    var desc = weatherList[0].weather[0].description.toUpperCase();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Image.network(icon),
          SizedBox(
            width: 10.0,
          ),
          Column(
            children: [
              Text(
                '$temp °C',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                ),
              ),
              Text(
                '$desc',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
