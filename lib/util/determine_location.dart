import 'package:geolocator/geolocator.dart';

Future<Position> getUserLocation() async {
  bool isLocationServiceEnabled;
  LocationPermission permisson;

  isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!isLocationServiceEnabled) {
    return Future.error('Location Services are not enabled');
  }

  permisson = await Geolocator.checkPermission();
  if (permisson == LocationPermission.denied) {
    permisson = await Geolocator.requestPermission();
    if (permisson == LocationPermission.denied) {
      return Future.error('Location Permission denied by user');
    }
  }

  if (permisson == LocationPermission.deniedForever) {
    return Future.error('Location Permissions need to setup in user settings');
  }

  return Geolocator.getCurrentPosition();
}
