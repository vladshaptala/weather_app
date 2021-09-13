import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.blueGrey[800],
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: Colors.white,
                  ),
                  hintText: 'Enter city name',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: Colors.black87,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  cityName = value;
                },
              ),
            ),
            MaterialButton(
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.pop(context, cityName);
                })
          ],
        ),
      ),
    );
  }
}
