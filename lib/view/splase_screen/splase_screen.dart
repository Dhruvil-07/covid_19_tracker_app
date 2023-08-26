import 'dart:async';

import 'package:covid_19_tracker_app/utils/navigation/custom_navigation.dart';
import 'package:covid_19_tracker_app/utils/text/text.dart';
import 'package:covid_19_tracker_app/view/all_covid_screen/all_covid_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class splase_screen extends StatefulWidget {
  const splase_screen({Key? key}) : super(key: key);

  @override
  State<splase_screen> createState() => _splase_screenState();
}

class _splase_screenState extends State<splase_screen> with TickerProviderStateMixin {

  late AnimationController animation =
  AnimationController(vsync: this , duration: Duration(seconds: 5))..repeat();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
       Navigator.pushReplacement(context, cust_transactinon(child: all_covid_screen()));
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SizedBox(
         height: double.infinity,
         width: double.infinity,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [

             SizedBox(height: 10.h,),

             algeriya_text(containt: "Covid 19 Tracker" ,
               fontsize: 30.spMin,
             ),

             SizedBox(height: 100.h,),

             AnimatedBuilder(
                 animation: animation,
                 child: Padding(
                   padding:EdgeInsets.symmetric(
                     horizontal: 20.w,
                   ),
                   child: Container(
                     height: 200.h,
                     width: 200.w,
                     child: Image.asset("assets/images/virus.png",
                         fit: BoxFit.fill,
                       ),
                   ),
                 ),
                 builder: (context, child){
                   return Transform.rotate(
                       angle: animation.value * 0.2 * math.pi,
                       child: child,
                   );
                 },
             ),


             SizedBox(height: 100.h,),

             cario_text(containt: "--------- Powered By ----------"),
             SizedBox(height: 10.h,),
             algeriya_text(containt: "Shah Co. Pvt LTM", fontsize: 30.spMin,)
             

             
           ],
         ),
       )
    );
  }
}
