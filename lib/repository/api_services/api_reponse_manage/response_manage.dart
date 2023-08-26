import 'dart:io';
import 'package:covid_19_tracker_app/data/excaption/app_excaption.dart';
import 'package:covid_19_tracker_app/repository/api_services/api_methos_abstract/api_abstract_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


//manage api response

class Api_Response extends Api_abstract_methods
{

  //response manage function
  dynamic respons_manage(http.Response response)
  {
    switch(response.statusCode)
    {
      case 200 :
        return response.body;
        break;
      case 404 :
        throw UrlExcaption("Invalid Url");
      default:
        throw InternetExcaption("No internate");
    }
  }


  //global var for apis response
  var apiResponse;


  //get api method override
  @override
  Future<dynamic> get_api(String url) async {
     try{
       var response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
       apiResponse = respons_manage(response);
       return apiResponse;
     }on SocketException
     {
       throw InternetExcaption("No Internate");
     }on UrlExcaption
     {
       throw UrlExcaption("Invalid Url");
     }
  }

}