import 'package:covid_19_tracker_app/instance/getx_controller_instance.dart';
import 'package:covid_19_tracker_app/models/all_covid_data_model.dart';
import 'package:covid_19_tracker_app/utils/navigation/custom_navigation.dart';
import 'package:covid_19_tracker_app/utils/text/text.dart';
import 'package:covid_19_tracker_app/view/all_covid_screen/components/covid_data_card.dart';
import 'package:covid_19_tracker_app/view/all_covid_screen/components/pie_chart.dart';
import 'package:covid_19_tracker_app/view/serch_country_screen/search_country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

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


  @override
  Widget build(BuildContext context) {
    AllCovidModel? allCovidModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).brightness == Brightness.light ?  Colors.deepPurple.shade100 : Colors.white,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              FutureBuilder(
                  future: all_covid_detail.get_world_covid_data(),
                  builder: (context, AsyncSnapshot<AllCovidModel> snapshot){
                    if(snapshot.hasData)
                    {
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

                            SizedBox(height: 20.h,),

                            algeriya_text(containt: "Top  5  Effected Country" , fontsize: 22.spMin,),

                            SizedBox(height: 20.h,),

                          ],
                        ),
                      );
                    }
                    else
                    {
                      return SpinKitCircle(
                        color: Colors.yellow,
                        size: 50.sp,
                        controller: animation,
                      );
                    }

                  }
              ),

              SizedBox(height: 8.h,),

              Container(
                height: 250.h,
                width: double.infinity,
                child: FutureBuilder(
                  future: country_detail.get_asc_sorted_list(),
                  builder: (context, snapshot){
                    if(snapshot.hasData)
                    {
                      return Obx(
                            () => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: EdgeInsets.all(
                                10.spMin,
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width  - 50.w,
                                color: Colors.grey,
                                child: Text("${snapshot.data!.value[index].country}"
                                    " ${snapshot.data!.value[index].effectedper}"),
                              ),
                            );
                          },),
                      );
                    }
                    else
                    {
                      return Center(child: CircularProgressIndicator(),);
                    }

                  },

                ),
              ),

              Container(
                height: 250.h,
                width: double.infinity,
                child: FutureBuilder(
                  future: country_detail.get_desc_sorted_list(),
                  builder: (context, snapshot){
                    if(snapshot.hasData)
                    {
                      return Obx(
                            () => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: EdgeInsets.all(
                                10.spMin,
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width  - 50.w,
                                color: Colors.grey,
                                child: Text("${snapshot.data!.value[index].country}"
                                    " ${snapshot.data!.value[index].effectedper}"),
                              ),
                            );
                          },),
                      );
                    }
                    else
                    {
                      return Center(child: CircularProgressIndicator(),);
                    }

                  },

                ),
              )
            ],

          ),
        ),
      )
    );
  }
}