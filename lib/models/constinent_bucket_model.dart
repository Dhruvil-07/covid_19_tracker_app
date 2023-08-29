import 'package:covid_19_tracker_app/models/country_data_model.dart';
import 'package:flutter/material.dart';

class ConstinentBucket
{
   final List<CountryModel> country_list;
   final String Constinent;

   ConstinentBucket({ required this.Constinent , required this.country_list });

   ConstinentBucket.forcontinet(List<CountryModel> all_country_data , this.Constinent) :
         country_list = all_country_data.where((element) => element.continent.toUpperCase().contains(Constinent.toUpperCase())).toList();

   //get total amunt for each bucket
   double get totalcases
   {

      double sum = 0;

      for(final i in country_list)
      {
         sum += i.cases;
      }

      return sum;
   }
}