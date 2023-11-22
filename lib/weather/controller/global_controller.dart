import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:allinoneproject/weather/api/fetch_weather.dart';
import 'package:allinoneproject/weather/model/weather_data.dart';

class GlobalController extends GetxController {
  final _isLoading = true.obs;
  final _latitude = 0.0.obs;
  final _longitude = 0.0.obs;
  final _currentIndex = 0.obs;

  RxBool get isLoading => _isLoading;
  RxDouble get latitude => _latitude;
  RxDouble get longitude => _longitude;

  final weatherData = WeatherData().obs;

  WeatherData getData() => weatherData.value;

  @override
  void onInit() {
    checkLocationStatus();
    super.onInit();
  }

  Future<void> checkLocationStatus() async {
    try {
      final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        _askToEnableLocationService();
        return;
      }

      final locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.deniedForever) {
        _showLocationPermissionError("Location permissions are denied forever");
        return;
      } else if (locationPermission == LocationPermission.denied) {
        await _requestLocationPermission();
      }

      await getLocation();
    } catch (e) {
      _handleError(e.toString());
    }
  }

  Future<void> _requestLocationPermission() async {
    final locationPermission = await Geolocator.requestPermission();
    if (locationPermission == LocationPermission.denied) {
      _showLocationPermissionError("Location permissions are denied");
    }
  }

  Future<void> getLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _latitude.value = position.latitude;
      _longitude.value = position.longitude;

      final fetchedData = await FetchWeatherAPI().processData(
        position.latitude,
        position.longitude,
      );
      weatherData.value = fetchedData;
      _isLoading.value = false;
    } catch (e) {
      _handleError(e.toString());
    }
  }

  void _askToEnableLocationService() {
    _showSnackbar(
      title: 'Location Services',
      message: 'Please enable location services to use this app.',
    );
  }

  void _showLocationPermissionError(String message) {
    _showSnackbar(
      title: 'Location Permission',
      message: message,
    );
  }

  void _handleError(String errorMessage) {
    _showSnackbar(
      title: 'Error',
      message: errorMessage,
    );
  }

  void _showSnackbar({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
    );
  }

  RxInt getIndex() => _currentIndex;
}
