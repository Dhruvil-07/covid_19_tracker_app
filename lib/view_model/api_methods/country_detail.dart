import 'dart:convert';
import 'package:covid_19_tracker_app/instance/api_instace.dart';
import 'package:covid_19_tracker_app/models/country_data_model.dart';
import 'package:get/get.dart';

class Country_detail extends GetxController
{
   List<CountryModel> country_data = [];
   RxList<CountryModel> country_data_copy = <CountryModel>[].obs;
   RxList<CountryModel> sorted_data = <CountryModel>[].obs;
   RxList<CountryModel> sorted_data_asc = <CountryModel>[].obs;
   RxList<CountryModel> sorted_data_desc = <CountryModel>[].obs;


   //get all data
   Future<RxList<CountryModel>> get_country_data() async
   {
      country_data = [];
      var reponse_data = await api_response.get_api(apiLink.countriesList)
          .then((value){
            var decoded_data = jsonDecode(value);
            List.from(decoded_data).map((e){
             country_data.add(CountryModel.fromMap(e));
            }).toList();
          }).onError((error, stackTrace){ print(error); })
          .whenComplete((){
            store_dublicate_data();
          });
     return country_data_copy;
   }



   //dublicate list for serching
   void store_dublicate_data()
   {
     country_data_copy.value = country_data;
   }

   //assending sort data
   Future<RxList<CountryModel>> get_asc_sorted_list() async
   {
       sorted_data = await get_country_data();
       sorted_data.value.sort((a, b) => a.effectedper.compareTo(b.effectedper),);
       for(int i = 0 ; i < 5 ; i++)
         {
            sorted_data_asc.value.add(sorted_data.value[i]);
         }
       return sorted_data_asc;
   }


   //desending sort data
   Future<RxList<CountryModel>> get_desc_sorted_list() async
   {
     sorted_data = await get_country_data();
     sorted_data.value.sort((a, b) => b.effectedper.compareTo(a.effectedper),);
     for(int i = 1; i <= 5  ; i++)
     {
       sorted_data_desc.value.add(sorted_data.value[i]);
     }
     return sorted_data_desc;
   }



   //method of serching
  void found_country(var val)
  {
     List<CountryModel> result = [];

     if(val.isEmpty)
       {
          result = country_data;
       }
     else
       {
          result = country_data.where((element){
             return element.country.toString().toUpperCase().contains(val.toString().toUpperCase());
          }).toList();
       }
     country_data_copy.value = result;
     print(country_data_copy.length);
  }

}