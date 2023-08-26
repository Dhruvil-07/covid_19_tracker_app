import 'package:covid_19_tracker_app/instance/getx_controller_instance.dart';
import 'package:covid_19_tracker_app/models/country_data_model.dart';
import 'package:covid_19_tracker_app/utils/navigation/custom_navigation.dart';
import 'package:covid_19_tracker_app/utils/text/text.dart';
import 'package:covid_19_tracker_app/view/country_detail_screen/country_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class search_country_screen extends StatefulWidget {
  const search_country_screen({Key? key}) : super(key: key);

  @override
  State<search_country_screen> createState() => _search_country_screenState();
}

class _search_country_screenState extends State<search_country_screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back , color:  Theme.of(context).brightness == Brightness.light  ? Colors.black : Colors.black,),
        ),
      ),


      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [

            SizedBox(height: 16.h,),

            //serch button
            Padding(
              padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical:  8.h,
           ),
              child: TextField(
                onChanged: (value){
                  country_detail.found_country(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.sp),
                    borderSide: BorderSide(color : Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
                  ),
                  hintText: "Search Country"
              ),
                cursorColor: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
            ),
            ),

            FutureBuilder(
              future: country_detail.get_country_data(),
              builder: (context,AsyncSnapshot<List<CountryModel>> snapshot){
                if(snapshot.hasData)
                  {
                    return Obx(
                      () => Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: country_detail.country_data_copy.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              child: ListTile(
                                onTap: (){
                                  Navigator.push(context,
                                      cust_transactinon(child: country_detail_screen(countryModel: country_detail.country_data_copy.value[index] ,)));
                                },
                                leading: Image.network(country_detail.country_data_copy.value[index].countryInfo.flag,
                                  height: 60.h, width: 60.w,
                                ),
                                title:  Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                                  child: cario_text(containt: country_detail.country_data_copy.value[index].country),
                                ),
                                subtitle:  Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Row(
                                    children: [
                                      Expanded(child: cario_text(containt: country_detail.country_data_copy.value[index].continent.toString() , fontsize: 14.spMin, fontcolor: Colors.grey.shade500,)),
                                      Expanded(child: cario_text(containt: country_detail.country_data_copy.value[index].cases.toString() , fontsize: 14.spMin, fontcolor: Colors.grey.shade500)),
                                    ],
                                  )
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                else
                  {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index){
                          return Shimmer.fromColors(
                            child: ListTile(
                              leading:  Container(height: 50 , width: 50, color: Colors.white,),
                              title:  Container(
                                width: 100,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              subtitle:  Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                            ),
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                          );
                        },
                      ),
                    );

                  }
              }
            )


          ],
        ),
      ),
    );
  }
}

//data
/* */



//shimmer
/*
           */