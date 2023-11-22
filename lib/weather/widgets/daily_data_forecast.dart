import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:allinoneproject/weather/model/weather_data_daily.dart';
import 'package:allinoneproject/weather/utils/custom_colors.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;

  const DailyDataForecast({Key? key, required this.weatherDataDaily})
      : super(key: key);

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Next Days",
            style: TextStyle(
              color: CustomColors.textColorBlack,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  getDay(weatherDataDaily.daily[index].dt),
                  style: const TextStyle(
                    color: CustomColors.textColorBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°",
                      style: const TextStyle(
                        color: CustomColors.textColorBlack,
                        fontSize: 14,
                      ),
                    ),
                    Image.asset(
                      "assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png",
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
              ),
              const Divider(
                color: CustomColors.dividerLine,
                height: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}
