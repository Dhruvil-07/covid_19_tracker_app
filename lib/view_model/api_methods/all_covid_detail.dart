import 'dart:convert';
import 'package:covid_19_tracker_app/instance/api_instace.dart';
import 'package:covid_19_tracker_app/models/all_covid_data_model.dart';
import 'package:covid_19_tracker_app/view/all_covid_screen/all_covid_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class All_covid_detail extends GetxController
{
    final covid_data = AllCovidModel().obs;

    Future<AllCovidModel> get_world_covid_data() async
    {
       var response_data = await api_response.get_api(apiLink.worldStatesApi)
           .then((value){
              var decoded_data = jsonDecode(value);
              covid_data.value = AllCovidModel.fromJson(decoded_data);
       }).onError((error, stackTrace){ print(error); });

       return covid_data.value;
    }
}