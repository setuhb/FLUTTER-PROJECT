import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:allinoneproject/weather/controller/global_controller.dart';
import 'package:allinoneproject/weather/utils/custom_colors.dart';
import 'package:allinoneproject/weather/widgets/comfort_level.dart';
import 'package:allinoneproject/weather/widgets/current_weather_widget.dart';
import 'package:allinoneproject/weather/widgets/daily_data_forecast.dart';
import 'package:allinoneproject/weather/widgets/header_widget.dart';
import 'package:allinoneproject/weather/widgets/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => _buildContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return globalController.isLoading.value
        ? _buildLoadingState()
        : _buildWeatherContent();
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/clouds.png",
            height: 200,
            width: 200,
          ),
          const SizedBox(height: 20),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherContent() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeaderWidget(),
            const SizedBox(height: 20),
            CurrentWeatherWidget(
              weatherDataCurrent:
                  globalController.getData().getCurrentWeather(),
            ),
            const SizedBox(height: 20),
            HourlyDataWidget(
              weatherDataHourly: globalController.getData().getHourlyWeather(),
            ),
            DailyDataForecast(
              weatherDataDaily: globalController.getData().getDailyWeather(),
            ),
            const Divider(color: CustomColors.dividerLine),
            const SizedBox(height: 10),
            ComfortLevel(
              weatherDataCurrent:
                  globalController.getData().getCurrentWeather(),
            ),
          ],
        ),
      ),
    );
  }
}
