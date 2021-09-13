import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  // late double latitude;
  // late double longitude;

  Future<Position> getCurrentLocation() async {
    try {
      late bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Fluttertoast.showToast(msg: 'Please keep your location on');
      }
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Fluttertoast.showToast(msg: 'Location permission is denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Fluttertoast.showToast(msg: 'Location permission is denied forever');
        await Geolocator.openAppSettings();
      }

      final GeolocatorPlatform _geolocatorPlatform =
          GeolocatorPlatform.instance;
      Position position = await _geolocatorPlatform.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // latitude = position.latitude;
      // longitude = position.longitude;
      return position;
    } catch (e) {
      throw 'Something went wrong $e';
    }
  }
}
