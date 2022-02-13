
import 'package:flutter/material.dart';
import 'package:wheather_app/core/constants/constants.dart';
import 'package:wheather_app/feature/search_city/model/back_button.dart';
import 'package:wheather_app/feature/search_city/viewmodel/search_city_view_model.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                  child: SearchCityViewModel().searchCityForm(),
                ),
                const SizedBox(
                  height: 20,
                ),
                SearchCityViewModel().findButton(context),
                const SizedBox(
                  height: 20,
                ),
                SearchCityViewModel().spinner(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
