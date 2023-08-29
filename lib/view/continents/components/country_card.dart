import 'package:covid_19_tracker_app/models/country_data_model.dart';
import 'package:covid_19_tracker_app/utils/navigation/custom_navigation.dart';
import 'package:covid_19_tracker_app/utils/text/text.dart';
import 'package:covid_19_tracker_app/view/country_detail_screen/country_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class effecetd_country_card extends StatelessWidget {
 final  CountryModel countryModel;
  const effecetd_country_card({ required this.countryModel , Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, cust_transactinon(child: country_detail_screen(countryModel: countryModel,)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade100,
          borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        ),
        height: 200.h,
        child: Padding(
          padding:EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 4.h,
          ),
          child: Column(
            children: [

              Row(
                children: [

                  Expanded(
                    child: Container(
                      child: Image.network(countryModel.countryInfo.flag ,
                       height: 80.h,
                        width: 100.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  SizedBox(width: 20.w,),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: cario_text(containt: "Contry" , fontsize: 18.spMin,)),
                            Expanded(child: SingleChildScrollView(child: cario_text(containt: countryModel.country) , scrollDirection: Axis.horizontal,)),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: cario_text(containt: "Continent" , fontsize: 18.spMin,)),
                            Expanded(child: SingleChildScrollView(child: cario_text(containt: countryModel.continent) , scrollDirection: Axis.horizontal,)),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: cario_text(containt: "Effected" , fontsize: 18.spMin,)),
                            Expanded(child: SingleChildScrollView(child: cario_text(containt: "${countryModel.effectedper.toStringAsFixed(2)} %") , scrollDirection: Axis.horizontal,)),
                          ],
                        ),

                      ],
                    ),
                  )
                ],
              ),

              SizedBox(height: 10.h,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Column(
                      children: [
                        cario_text(containt: "Cases" , fontsize: 18.spMin,),
                        cario_text(containt: countryModel.cases.toString() , fontsize: 18.spMin,),
                      ],
                    ),
                    SizedBox(width: 20.w,),
                    Column(
                      children: [
                        cario_text(containt: "Recovred" , fontsize: 18.spMin,),
                        cario_text(containt: countryModel.recovered.toString()  , fontsize: 18.spMin,),
                      ],
                    ),
                    SizedBox(width: 20.w,),
                    Column(
                      children: [
                        cario_text(containt: " Active" , fontsize: 18.spMin,),
                        cario_text(containt: countryModel.active.toString()  , fontsize: 18.spMin,),
                      ],
                    ),
                    SizedBox(width: 20.w,),
                    Column(
                      children: [
                        cario_text(containt: "Death" , fontsize: 18.spMin,),
                        cario_text(containt: countryModel.deaths.toString()  , fontsize: 18.spMin,),
                      ],
                    ),

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
