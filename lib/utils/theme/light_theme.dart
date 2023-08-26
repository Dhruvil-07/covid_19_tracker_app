import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData light_theme()
{
   return ThemeData(
     brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,

     cardTheme: CardTheme().copyWith(
        color: Colors.deepPurple.shade200,
       elevation: 10.0,
       shadowColor: Colors.black,
         shape: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20.spMin),
           borderSide: BorderSide(color: Colors.black),
         )
     ),

   );
}
