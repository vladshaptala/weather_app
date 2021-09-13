import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/WeatherForecast.dart';
import 'package:weather_app/screens/city_page.dart';
import 'package:weather_app/widgets/bottom_list_view.dart';
import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/detail_view.dart';
import 'package:weather_app/widgets/temp_view.dart';

class WeatherForecastPage extends StatefulWidget {
  const WeatherForecastPage({Key? key}) : super(key: key);

  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().fetchWeatherForecast(isCity: false);
    forecastObject
        .then((weather) => print('Type:${weather.list[0].weather[0].main}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text('Weather'),
          actions: [
            IconButton(
              onPressed: () async {
                var tappedCity = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CityPage();
                    },
                  ),
                );
                if (tappedCity != '') {
                  _cityName = tappedCity;
                  setState(() {
                    forecastObject = WeatherApi().fetchWeatherForecast(
                        cityName: _cityName, isCity: true);
                  });
                }
              },
              icon: Icon(Icons.location_city),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  forecastObject =
                      WeatherApi().fetchWeatherForecast(isCity: false);
                });
              },
              icon: Icon(Icons.my_location),
            )
          ]),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 50.0),
                      CityView(snapshot: snapshot),
                      SizedBox(height: 50.0),
                      TempView(snapshot: snapshot),
                      SizedBox(height: 50.0),
                      DetailView(snapshot: snapshot),
                      SizedBox(height: 50.0),
                      BottomListView(snapshot: snapshot)
                    ],
                  );
                } else if (snapshot.hasError) {
                  //throw Exception('Error response');
                  return Center(
                    child: Text(
                      'City not found. Please try again!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[800],
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
