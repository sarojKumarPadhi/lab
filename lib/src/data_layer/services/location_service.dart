import 'package:geocoding/geocoding.dart' as geo_coding;
import 'package:location/location.dart';

class LocationService {
  Stream<LocationData> getPositionStream() {
    return Location.instance.onLocationChanged;
  }

  Future<LocationData> getCurrentLocation() async {
    return await Location.instance.getLocation();
  }

  Future<String> getAddressName(double latitude, double longitude) async {
    List<geo_coding.Placemark> placemarks =
        await geo_coding.placemarkFromCoordinates(latitude, longitude);

    return "${placemarks[0].street ?? ""} ${placemarks[0].locality ?? ""} ${placemarks[0].postalCode ?? ""}";
  }
}
