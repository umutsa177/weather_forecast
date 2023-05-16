import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_forecast/model/weather_data_current.dart';
import 'package:weather_forecast/utils/custom_colors.dart';
import '../controller/global_controller.dart';

class ComfortLevel extends StatelessWidget {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  final WeatherDataCurrent weatherDataCurrent;
  ComfortLevel({Key? key, required this.weatherDataCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: const Text(
            "Comfort Level",
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: globalController
                      .getData()
                      .getCurrentWeather()
                      .current
                      .main!
                      .humidity!
                      .toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      handlerSize: 0,
                      trackWidth: 12,
                      progressBarWidth: 12,
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: "Humidity",
                      bottomLabelStyle: const TextStyle(
                        letterSpacing: 0.1,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor:
                          CustomColors.firstGradientColor.withAlpha(100),
                      progressBarColors: [
                        CustomColors.firstGradientColor,
                        CustomColors.secondGradientColor,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
