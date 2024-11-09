import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_planner/screens/home_page.dart';
import 'package:task_planner/screens/notes/home_page.dart';
import 'package:task_planner/screens/profile/profile_page.dart';
import 'package:task_planner/theme/colors/light_colors.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:iconsax/iconsax.dart'; // <------------ import iconsax

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:
          LightColors.kLightYellow, // navigation bar color
      statusBarColor: Color.fromARGB(255, 40, 40, 40)));

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner

      title: 'FloatingNavBar',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FloatingNavBar(
        resizeToAvoidBottomInset: false,
        color: const Color.fromARGB(193, 40, 40, 40),
        selectedIconColor: Colors.white,
        unselectedIconColor: Colors.white.withOpacity(0.4),
        items: [
          FloatingNavBarItem(
              iconData: Iconsax.calendar, page: HomePage(), title: 'Home'),
          FloatingNavBarItem(
              iconData: Iconsax.note, page: HomeScreen(), title: 'Doctors'),
          FloatingNavBarItem(
              iconData: Iconsax.personalcard,
              page: PageProfil(),
              title: 'Reminders'),
        ],
        horizontalPadding: 50.0,
        hapticFeedback: true,
        showTitle: false,
      ),
    );
  }
}
