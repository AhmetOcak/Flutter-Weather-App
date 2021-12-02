import 'package:flutter/material.dart';
import 'package:wheather_app/components/weather_info_section.dart';

class WeatherDataScreen extends StatelessWidget {
  const WeatherDataScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40.0),
      padding: const EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width / 1,
      height: MediaQuery.of(context).size.height / 4,
      child: Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        color: const Color.fromRGBO(255, 255, 255, 0.1),
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherInfo(
                    title: 'feels like',
                  ),
                  WeatherInfo(
                    title: 'wind speed',
                  ),
                  WeatherInfo(
                    title: 'pressure',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherInfo(
                    title: 'sunrise',
                  ),
                  WeatherInfo(
                    title: 'humidity',
                  ),
                  WeatherInfo(
                    title: 'sunset',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
