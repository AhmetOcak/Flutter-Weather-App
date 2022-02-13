import 'package:flutter/material.dart';

import 'package:wheather_app/feature/home/model/weather_model.dart';
import 'package:wheather_app/feature/home/view/home_view.dart';
import 'package:wheather_app/feature/loading_screen/views/loading_view.dart';
import 'package:wheather_app/feature/search_city/view/search_city_view.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/home': (context) => HomeScreen(
              weatherResponse: WeatherResponse(),
            ),
        '/search': (context) => const SearchScreen(),
      },
    ),
  );
}

// background images from Vecteezy.com