import 'package:covid_19_tracker_app/models/country_data_model.dart';
import 'package:covid_19_tracker_app/utils/navigation/custom_navigation.dart';
import 'package:covid_19_tracker_app/utils/text/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class country_detail_screen extends StatelessWidget {
  country_detail_screen({required this.countryModel , Key? key}) : super(key: key);

  CountryModel countryModel;

  @override
  Widget build(BuildContext context) {
    var height = 400.h;
    var profile_height =  70.sp;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.deepPurple.shade100 : Colors.white,
        title: algeriya_text(containt: countryModel.country , fontsize: 24.spMin),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back , color: Colors.black,),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 150.h,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [

            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light ?  Colors.deepPurple.shade100  : Colors.black.withOpacity(0.7),
                border: Border.all( color:  Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white)
              ),
              height: height ,

              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: profile_height,),
                    reusablerow(context, "Country" ,countryModel.country.toString()),
                    divider(context),
                    reusablerow(context, "Country Population" ,countryModel.population.toString()),
                    divider(context),
                    reusablerow(context, "Total Cases" ,countryModel.cases.toString()),
                    divider(context),
                    reusablerow(context, "Total Active Cases" ,countryModel.active.toString()),
                    divider(context),
                    reusablerow(context, "Total Recovred Cases" ,countryModel.recovered.toString()),
                    divider(context),
                    reusablerow(context, "Total Death" ,countryModel.deaths.toString()),
                  ],
                ),
              ),
            ),


          //country flag
          Positioned(
            bottom: height - profile_height / 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
              ),
              height: 80.h,
              width: 150.w,
              child: Image.network(countryModel.countryInfo.flag ,
                fit: BoxFit.fill,
              ),
            )
          )

          ],
        ),
      ),
    );
  }
}




//resuable row for details
Widget reusablerow(BuildContext context , String lable , String data)
{
   return Padding(
     padding: EdgeInsets.symmetric(horizontal: 16.w , vertical: 8.h),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [

         Expanded(child: cario_text(containt: lable ,  fontcolor: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white) , flex: 2),
         Expanded(child: cario_text(containt: data ,  fontcolor: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white) ,),

       ],
     ),
   );
}


//reuasble divider
Widget divider(BuildContext context)
{
   return Divider(height: 2.h, thickness: 1.0, color: Theme.of(context).brightness == Brightness.light ? Colors.black.withOpacity(0.3) : Colors.white,);
}