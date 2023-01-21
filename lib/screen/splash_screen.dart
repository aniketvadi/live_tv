import 'package:flutter/material.dart';
import 'package:live_tv/constant/app_colors.dart';
import 'package:live_tv/constant/app_font.dart';
import 'package:live_tv/constant/app_routes.dart';
import 'package:live_tv/constant/img_path.dart';
import 'package:live_tv/services/mobile_ad_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> animation;
  late Animation<double> textAnimation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    textAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    controller.addListener(() async {
      if (controller.isCompleted) {
        await AdHelper.initializeAdMobDataAPI();
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.homeScreen, (route) => false);
      }
    });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          // Center(child: Image.asset(Img.logo,width: 120,))
          ScaleTransition(
            scale: animation,
            child: Center(
                child: Image.asset(
              Img.logo,
              width: 120,
            )),
          ),
          Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: SizeTransition(
                sizeFactor: textAnimation,
                child: Center(
                    child: Text(
                  'Live TV',
                  style: Font.title1(color: AppColor.black),
                )),
              ))
        ],
      ),
    );
  }
}
