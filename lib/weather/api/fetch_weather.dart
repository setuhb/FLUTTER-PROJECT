import 'dart:convert';

import 'package:allinoneproject/weather/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:allinoneproject/weather/model/weather_data_current.dart';
import 'package:allinoneproject/weather/model/weather_data_daily.dart';
import 'package:allinoneproject/weather/model/weather_data_hourly.dart';
import 'package:allinoneproject/weather/utils/api_url.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  // processing the data from response -> to json
  Future<WeatherData> processData(double lat, double lon) async {
    try {
      var response = await http.get(Uri.parse(apiURL(lat, lon)));

      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        weatherData = WeatherData(
          WeatherDataCurrent.fromJson(jsonString),
          WeatherDataHourly.fromJson(jsonString),
          WeatherDataDaily.fromJson(jsonString),
        );

        return weatherData!;
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error processing weather data: $e');
    }
  }
}
