import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/controller/global_controller.dart';
import 'package:weather_forecast/utils/custom_colors.dart';
import 'package:weather_forecast/widgets/comfort_level.dart';
import 'package:weather_forecast/widgets/current_weather_widget.dart';
import 'package:weather_forecast/widgets/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(
                    color: CustomColors.textColorBlack,
                  ),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const HeaderWidget(),
                      CurrenWeatherWidget(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        color: CustomColors.dividerLine,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ComfortLevel(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
