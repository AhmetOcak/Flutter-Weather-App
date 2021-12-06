import 'package:flutter/material.dart';
import 'package:wheather_app/components/back_button.dart';
import 'package:wheather_app/components/find_button.dart';
import 'package:wheather_app/components/search_city.dart';
import 'package:wheather_app/constants/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
                const SearchCityForm(),
                const SizedBox(
                  height: 20,
                ),
                FindButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
