import 'package:flutter/material.dart';
import 'package:wheather_app/core/components/button/back_button.dart';
import 'package:wheather_app/core/components/alert_dialog/alert_dialog.dart';
import 'package:wheather_app/core/constants/constants.dart';
import 'package:wheather_app/core/feature/home/model/weather_model.dart';
import 'package:wheather_app/core/feature/home/services/weather_service.dart';
import 'package:wheather_app/core/feature/home/view/home_view.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key, this.cityName = ''}) : super(key: key);

  String cityName;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  WeatherResponse _weatherResponse = WeatherResponse();

  final DataService _dataService = DataService();
  bool showSpinner = false;

  final TextEditingController _textEditingController = TextEditingController();

  Future<WeatherResponse> search(String cityName) async {
    try {
      WeatherResponse response = await _dataService.getWeatherData(cityName);
      _weatherResponse = response;
      return _weatherResponse;
    } catch (e) {
      setState(() {
        showSpinner = false;
        _textEditingController.clear();
      });
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackArrowButton(),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: Constants().afternoon,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 4,
                  ),
                  child: searchCityForm(),
                ),
                const SizedBox(
                  height: 20,
                ),
                findButton(context),
                const SizedBox(
                  height: 20,
                ),
                showSpinner
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const LinearProgressIndicator(
                          backgroundColor: Colors.black38,
                          color: Colors.black,
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
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
        widget.cityName = val;
      },
    );
  }

  // find button
  TextButton findButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (widget.cityName.isEmpty) {
          showDialog(
            context: context,
            builder: (_) => const ErrorDialog(
              errorMesage: 'Please enter a city name.',
              errorTitle: 'Empty Input',
            ),
          );
        } else {
          setState(() {
            showSpinner = true;
          });
          FocusScope.of(context).unfocus();
          search(widget.cityName).then((value) => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        weatherResponse: _weatherResponse,
                      ),
                    )),
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
}