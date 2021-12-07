import 'package:flutter/material.dart';
import 'package:wheather_app/components/back_button.dart';
import 'package:wheather_app/components/error_dialog.dart';
import 'package:wheather_app/constants/constants.dart';
import 'package:wheather_app/models/weather_model.dart';
import 'package:wheather_app/services/weather_service.dart';
import 'package:wheather_app/views/home_screen.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({this.cityName = ''});

  String cityName;
  
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  WeatherResponse _weatherResponse = WeatherResponse();

  final DataService _dataService = DataService();
  bool showSpinner = false;

  TextEditingController _textEditingController = TextEditingController();

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
            return ErrorDialog(
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
                  child: SearchCityForm(),
                ),
                const SizedBox(
                  height: 20,
                ),
                FindButton(context),
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

  TextField SearchCityForm() {
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
  TextButton FindButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (widget.cityName.isEmpty) {
          showDialog(
            context: context,
            builder: (_) => ErrorDialog(
              errorMesage: 'Please enter a city name.',
              errorTitle: 'Blank Empty',
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
