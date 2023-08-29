import 'package:covid_19_tracker_app/instance/getx_controller_instance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class entrance_page_of_app extends StatelessWidget {
  const entrance_page_of_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx(() => bottombar_controller.pages[bottombar_controller.current_index.value]),

      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: bottombar_controller.current_index.value,
          backgroundColor: Colors.deepPurple.shade300,
          selectedItemColor: Colors.black,
          showSelectedLabels: true,
          unselectedItemColor: Colors.black.withOpacity(0.4),
          showUnselectedLabels: false,
          onTap: (value) => bottombar_controller.change_page(value),
          items: [

            BottomNavigationBarItem(
              icon: Icon(Icons.all_inclusive_outlined),
              label: "All Detail"
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: "Effected"
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.data_array),
              label: "Continent"
            ),

          ],
        ),
      ),
    );
  }
}
