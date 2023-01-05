// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:live_tv/constant/app_colors.dart';
import 'package:live_tv/constant/app_font.dart';
import 'package:get/get.dart';
import 'package:live_tv/constant/app_routes.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Live TV',
          style: Font.title2(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 61, 57, 82),
            Color.fromARGB(255, 43, 40, 68),
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                commonButton(
                    title: 'Share',
                    icon: Icon(
                      Icons.share,
                      size: 40,
                      color: AppColor.white,
                    )),
                commonButton(
                    title: 'Rate',
                    icon: Icon(
                      Icons.star,
                      size: 40,
                      color: AppColor.white,
                    )),
                commonButton(
                    title: 'Privacy',
                    icon: Icon(
                      Icons.security,
                      size: 40,
                      color: AppColor.white,
                    )),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Material(
              color: AppColor.primary,
              elevation: 4.0,
              shadowColor: AppColor.white,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.categoryScreen);
                },
                child: Container(
                  width: Get.width * 0.3,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text(
                    'Start',
                    style: Font.button1(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget commonButton({required String title, required Widget icon}) {
    return Material(
      color: AppColor.primary,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      shadowColor: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: Get.width * 0.25,
          width: Get.width * 0.25,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              Text(
                title,
                style: Font.subTitle1(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
