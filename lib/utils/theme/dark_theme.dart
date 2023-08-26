import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData dark_theme()
{
   return ThemeData(
     brightness: Brightness.dark,
     scaffoldBackgroundColor: Colors.black,


     cardTheme: CardTheme().copyWith(
       color: Colors.deepPurple.shade300,
       elevation: 10.0,
       shadowColor: Colors.white,
       shape: OutlineInputBorder(
         borderRadius: BorderRadius.circular(20.spMin),
           borderSide: BorderSide(color: Colors.white)
       )
     ),


   );
}