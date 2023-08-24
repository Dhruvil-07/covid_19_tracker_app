import 'package:covid_19_tracker_app/utils/text/text.dart';
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
  AnimationController(vsync: this , duration: Duration(seconds: 3))..repeat();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SizedBox(
         height: double.infinity,
         width: double.infinity,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [

             AnimatedBuilder(
                 animation: animation,
                 child: Container(
                     height: 300.h,
                     width: MediaQuery.sizeOf(context).width,
                     child: Image.asset("assets/images/virus.png" ,
                       fit:  BoxFit.fitHeight,
                     )
                 ),
                 builder: (context, child){
                   return Transform.rotate(
                       angle: animation.value * 0.2 * math.pi,
                       child: child,
                   );
                 },
             ),

             SizedBox(height: 100.h,),
             
             algeriya_text(containt: "Covid 19 Tracker" ,
             fontsize: 30.spMin,
             ),
             
           ],
         ),
       )
    );
  }
}
