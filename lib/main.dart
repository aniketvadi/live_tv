import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:live_tv/constant/app_routes.dart';
import 'package:live_tv/screen/home_screen.dart';
import 'package:live_tv/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live TV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        // textTheme: GoogleFonts.latoTextTheme(
        //     Theme
        //         .of(context)
        //         .textThmee
        // )
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: AppRoutes.splashScreen,
      routes: {
        AppRoutes.splashScreen: (context) => const SplashScreen(),
        AppRoutes.homeScreen: (context) => const HomePageScreen(),
      },
    );
  }
}
