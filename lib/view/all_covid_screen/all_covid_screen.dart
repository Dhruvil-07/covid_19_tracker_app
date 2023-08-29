import 'package:covid_19_tracker_app/instance/getx_controller_instance.dart';
import 'package:covid_19_tracker_app/models/all_covid_data_model.dart';
import 'package:covid_19_tracker_app/models/country_data_model.dart';
import 'package:covid_19_tracker_app/utils/navigation/custom_navigation.dart';
import 'package:covid_19_tracker_app/utils/text/text.dart';
import 'package:covid_19_tracker_app/view/all_covid_screen/components/covid_data_card.dart';
import 'package:covid_19_tracker_app/view/all_covid_screen/components/pie_chart.dart';
import 'package:covid_19_tracker_app/view/serch_country_screen/search_country.dart';
import 'package:covid_19_tracker_app/view_model/api_methods/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class all_covid_screen extends StatefulWidget {
  const all_covid_screen({Key? key}) : super(key: key);

  @override
  State<all_covid_screen> createState() => _all_covid_screenState();
}

class _all_covid_screenState extends State<all_covid_screen> with TickerProviderStateMixin{

  late AnimationController animation =
  AnimationController(vsync: this , duration: Duration(seconds: 3))..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  //for high and low efected
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   country_detail.get_country_data().whenComplete(() {
     country_detail.country_data_for_sort = [];
     country_detail.country_data_for_sort = country_detail.country_data;
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    AllCovidModel? allCovidModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).brightness == Brightness.light ?  Colors.deepPurple.shade300 : Colors.white,
        centerTitle: true,
        title: algeriya_text(containt: "Covid 19 Tracker"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, cust_transactinon(child: search_country_screen()));
          }, icon: Icon(Icons.search_rounded ,
              size: 24.spMin,
              color : Theme.of(context).brightness == Brightness.light ?  Colors.black : Colors.white
          ),
          ),
        ],
      ),

      body: SafeArea(
        child: FutureBuilder(
                  future: all_covid_detail.get_world_covid_data(),
                  builder: (context, AsyncSnapshot<AllCovidModel> snapshot){
                    if(snapshot.hasData)
                    {
                      //add spicific model
                      allCovidModel = snapshot.data;
                      print(allCovidModel);


                      return SingleChildScrollView(
                        child: Column(
                          children: [

                            SizedBox(height: 30.h,),

                            //piechart
                            pie_chart(
                              total_cases: snapshot.data!.cases.toString(),
                              total_recovered: snapshot.data!.recovered.toString(),
                              total_death: snapshot.data!.deaths.toString(),
                            ),

                            SizedBox(height: 40.h,),

                            //Covis data card
                            covid_data_card(
                              allCovidModel: allCovidModel!,
                            ),
                          ],
                        ),
                      );
                    }
                    else
                    {
                      return SpinKitCircle(
                        color: Colors.yellow,
                        size: 100.sp,
                        controller: animation,
                      );
                    }

                  }
              ),
      ),
    );
  }
}
