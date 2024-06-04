import 'package:location/location.dart';

class LocationService {
  late Location _location;
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  static final LocationService _locationService = LocationService._internal();
  LocationService._internal();

  factory LocationService() {
    return _locationService;
  }

  void init() {
    _location = Location();
  }

  LocationData get locationData => _locationData;

  void getLocation() async {
    _isLocationServiceEnabled();
    _locationPermissionGranted();
    _locationData =  await _location.getLocation();
  }

  void _isLocationServiceEnabled() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
  }

  void _locationPermissionGranted() async {
    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }
}
