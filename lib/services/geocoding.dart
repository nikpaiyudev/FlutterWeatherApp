import 'package:geocoding/geocoding.dart';
import 'package:weatherapp/models/geocoding.dart';

class GeoCodingService {
  Future<Geocoding> getLocationAddressBasedOnLatAndLong(
      double lat, double long) async {
    List<dynamic> placemarks = await placemarkFromCoordinates(lat, long);
    return Geocoding.fromJson(placemarks[0]);
  }
}
