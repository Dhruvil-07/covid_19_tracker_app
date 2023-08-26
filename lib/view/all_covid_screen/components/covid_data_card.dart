import 'package:covid_19_tracker_app/models/all_covid_data_model.dart';
import 'package:covid_19_tracker_app/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class covid_data_card extends StatelessWidget {
  covid_data_card({ required this.allCovidModel , Key? key}) : super(key: key);

   AllCovidModel allCovidModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 4.h,
      ),
      child: Card(
        elevation: 5.0,
        shadowColor: Colors.black,
        child: SingleChildScrollView(
          child: Column(
                children: [

                  row(context , "Total Cases" , allCovidModel.cases.toString()),
                  row(context , "Total Recovred" , allCovidModel.recovered.toString()),
                  row(context , "Total Death" , allCovidModel.deaths.toString()),
                  row(context , "Total Cases Per Millions" , allCovidModel.casesPerOneMillion.toString()),
                  row(context , "Active Cases Per Millions" , allCovidModel.activePerOneMillion.toString()),
                  row(context , "Recovered Per Millions" , allCovidModel.recoveredPerOneMillion.toString()),
                  row(context , "Death Per Millions" , allCovidModel.deathsPerOneMillion.toString()),
                  row(context , "Total Affected Contry" , allCovidModel.affectedCountries.toString()),


                ],
              ),
        ),
      ),
    );
  }
}




//Reusable row
Widget row(BuildContext context , String label , String val)
{
   return Column(
     children: [
       Padding(
         padding: EdgeInsets.symmetric(
           horizontal: 16.w,
           vertical: 2.h,
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Expanded(child: cario_text(containt: label , fontsize: 16.spMin ,  fontcolor: Colors.black,) , flex: 2,),
             Expanded(child: cario_text(containt: val.toString() , fontsize: 16.spMin, fontcolor: Colors.black,)),
           ],
         ),
       ),

       SizedBox(height: 4.h,),

       Divider(),
     ],
   );
}