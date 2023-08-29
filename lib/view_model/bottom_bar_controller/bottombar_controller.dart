import 'package:covid_19_tracker_app/view/all_covid_screen/all_covid_screen.dart';
import 'package:covid_19_tracker_app/view/continents/continents.dart';
import 'package:covid_19_tracker_app/view/effected/efffected.dart';
import 'package:covid_19_tracker_app/view/serch_country_screen/search_country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottombar_controller extends GetxController
{
   RxInt current_index = 0.obs;
   RxList<Widget> pages = [ all_covid_screen() , effected() , continents() ].obs;

   void change_page(int index)
   {
      current_index.value = index;
   }
}