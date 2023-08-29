import 'package:covid_19_tracker_app/instance/getx_controller_instance.dart';
import 'package:covid_19_tracker_app/utils/text/text.dart';
import 'package:covid_19_tracker_app/view/continents/components/country_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class effected extends StatelessWidget {
  const effected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //sort country list
    country_detail.country_data_for_sort.sort((a, b) => a.effectedper.compareTo(b.effectedper),);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).brightness == Brightness.light ?  Colors.deepPurple.shade300 : Colors.white,
          centerTitle: true,
          title: algeriya_text(containt: "Effected"),
          bottom: TabBar(
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                child: cario_text(containt: "Top 5 High Effected" ,fontcolor: Colors.black , fontsize: 16.spMin,),
              ),
              Tab(
                child: cario_text(containt: "Top 5 Low Effected" ,fontcolor: Colors.black , fontsize: 16.spMin,),
              ),
            ],
          )  ,
        ),
        body: TabBarView(
          children: [
            high_effected(),
            low_effected(),
          ],
        ),
      ),
    );
  }
}





class high_effected extends StatelessWidget {
  const high_effected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
      ),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index){
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: effecetd_country_card(
                 countryModel: country_detail.country_data_for_sort[country_detail.country_data_for_sort.length - index - 1],
               ),
             );
          },
      ),
    );
  }
}



class low_effected extends StatelessWidget {
  const low_effected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
      ),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: effecetd_country_card(
                countryModel: country_detail.country_data_for_sort[index],
            ),
          );
        },
      ),
    );
  }
}
