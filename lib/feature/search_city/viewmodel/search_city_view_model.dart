import 'package:flutter/material.dart';
import 'package:wheather_app/core/components/alert_dialog/alert_dialog.dart';
import 'package:wheather_app/feature/home/model/weather_model.dart';
import 'package:wheather_app/feature/home/services/weather_service.dart';
import 'package:wheather_app/feature/home/view/home_view.dart';

class SearchCityViewModel {
  static WeatherResponse _weatherResponse = WeatherResponse();
  final DataService _dataService = DataService();
  static String cityName = '';
  static bool showSpinner = false;
  final TextEditingController _textEditingController = TextEditingController();

  Future<WeatherResponse> search(BuildContext context) async {
    try {
      WeatherResponse response = await _dataService.getWeatherData(cityName);
      _weatherResponse = response;
      return _weatherResponse;
    } catch (e) {
      showSpinner = false;
      cityName = '';
      return Future.error(showDialog(
          context: context,
          builder: (context) {
            return const ErrorDialog(
              errorMesage:
                  'We could not find the city you entered. please check the city name.',
              errorTitle: 'City not found',
            );
          }));
    }
  }

  TextField searchCityForm() {
    return TextField(
      controller: _textEditingController,
      cursorColor: Colors.black,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      decoration: const InputDecoration(
        hintText: "Enter city name",
        hintStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
      onChanged: (val) {
        cityName = val;
      },
    );
  }

  TextButton findButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (cityName == "") {
          showDialog(
            context: context,
            builder: (_) => const ErrorDialog(
              errorMesage: 'Please enter a city name.',
              errorTitle: 'Empty Input',
            ),
          );
        } else {
          showSpinner = true;
          FocusScope.of(context).unfocus();
          SearchCityViewModel().search(context).then((value) => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        weatherResponse: _weatherResponse,
                      ),
                    )),
                    showSpinner = false,
              });
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.black,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 15.0,
          ),
        ),
      ),
      child: const Text(
        'Find',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  SizedBox spinner(BuildContext context) {
    return showSpinner
        ? SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: const LinearProgressIndicator(
              backgroundColor: Colors.black38,
              color: Colors.black,
            ),
          )
        : const SizedBox(
            height: 0,
          );
  }
}
