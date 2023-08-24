import 'package:covid_19_tracker_app/utils/theme/dark_theme.dart';
import 'package:covid_19_tracker_app/utils/theme/light_theme.dart';
import 'package:covid_19_tracker_app/view/splase_screen/splase_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()
{
   runApp(my_covid_19_tracker());
}

class my_covid_19_tracker extends StatelessWidget {
  const my_covid_19_tracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        home: splase_screen(),
        debugShowCheckedModeBanner: false,
        theme: light_theme(),
        darkTheme: dark_theme(),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
