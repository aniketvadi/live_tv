import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:live_tv/config/app_pages.dart';
import 'package:live_tv/config/app_routes.dart';
import 'package:live_tv/constant/app_colors.dart';

// ignore: depend_on_referenced_packages
import 'package:live_tv/constant/firebase_option.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: FireBaseOption.option,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Live TV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blueGrey,
        useMaterial3: true,
        colorSchemeSeed: Colors.blueGrey,
        // textTheme: GoogleFonts.latoTextTheme(
        //     Theme
        //         .of(context)
        //         .textThmee
        // )
        scaffoldBackgroundColor: AppColor.primary,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.primary,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.list,
    );
  }
}
