import 'package:flutter/material.dart';
import 'package:wheather_app/components/back_button.dart';
import 'package:wheather_app/components/find_button.dart';
import 'package:wheather_app/components/search_city.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.0),
          elevation: 0,
          leading: const BackArrowButton(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SearchCityForm(),
              SizedBox(
                height: 20,
              ),
              FindButton(),
            ],
          ),
        ),
      ),
    );
  }
}
