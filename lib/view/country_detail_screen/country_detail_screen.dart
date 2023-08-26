import 'package:covid_19_tracker_app/models/country_data_model.dart';
import 'package:flutter/material.dart';

class country_detail_screen extends StatelessWidget {
  country_detail_screen({required this.countryModel , Key? key}) : super(key: key);

  CountryModel countryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(countryModel.country),
      ),
    );
  }
}
