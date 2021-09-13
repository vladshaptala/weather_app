import 'package:flutter/material.dart';
import 'package:weather_app/models/WeatherForecast.dart';

import 'forecast_view.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const BottomListView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '7-day weather forecast'.toUpperCase(),
          style: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        Container(
          padding: EdgeInsets.only(left: 16.0),
          height: 100.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2.7,
              color: Colors.black45,
              child: forecastCard(snapshot, index),
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 8,
            ),
            itemCount: snapshot.data!.list.length,
          ),
        )
      ],
    );
  }
}
