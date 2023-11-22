import 'package:flutter/material.dart';
import 'package:allinoneproject/weather/model/weather_data_current.dart';
import 'package:allinoneproject/weather/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Temperature area
        temperatureAreaWidget(),
        const SizedBox(height: 20),
        // More details - wind speed, humidity, clouds
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WeatherDetailItem(
              icon: "assets/icons/windspeed.png",
              value: "${weatherDataCurrent.current.windSpeed}km/h",
            ),
            WeatherDetailItem(
              icon: "assets/icons/clouds.png",
              value: "${weatherDataCurrent.current.clouds}%",
            ),
            WeatherDetailItem(
              icon: "assets/icons/humidity.png",
              value: "${weatherDataCurrent.current.humidity}%",
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WeatherDetailValue(
                value: "${weatherDataCurrent.current.windSpeed}km/h"),
            WeatherDetailValue(value: "${weatherDataCurrent.current.clouds}%"),
            WeatherDetailValue(
                value: "${weatherDataCurrent.current.humidity}%"),
          ],
        )
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (weatherDataCurrent.current.weather != null &&
            weatherDataCurrent.current.weather!.isNotEmpty)
          WeatherIcon(
            icon:
                "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          ),
        const VerticalDivider(color: CustomColors.dividerLine, width: 1),
        if (weatherDataCurrent.current.weather != null &&
            weatherDataCurrent.current.weather!.isNotEmpty)
          TemperatureDetails(
            temperature: weatherDataCurrent.current.temp!.toInt(),
            description:
                weatherDataCurrent.current.weather![0].description ?? '',
          ),
      ],
    );
  }
}

class WeatherDetailItem extends StatelessWidget {
  final String icon;
  final String value;

  const WeatherDetailItem({Key? key, required this.icon, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CustomColors.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(icon),
    );
  }
}

class WeatherDetailValue extends StatelessWidget {
  final String value;

  const WeatherDetailValue({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 60,
      child: Text(
        value,
        style: const TextStyle(fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class WeatherIcon extends StatelessWidget {
  final String icon;

  const WeatherIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      height: 80,
      width: 80,
    );
  }
}

class TemperatureDetails extends StatelessWidget {
  final int temperature;
  final String description;

  const TemperatureDetails(
      {Key? key, required this.temperature, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "$temperature°",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 68,
            color: CustomColors.textColorBlack,
          ),
        ),
        const TextSpan(text: " "),
        TextSpan(
          text: description,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ]),
    );
  }
}
