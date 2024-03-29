// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_tv/config/app_routes.dart';
import 'package:live_tv/constant/app_colors.dart';
import 'package:live_tv/constant/app_constant.dart';
import 'package:live_tv/constant/app_font.dart';
import 'package:get/get.dart';
import 'package:live_tv/services/mobile_ad_helper.dart';
import 'package:share_plus/share_plus.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Live TV',
          style: Font.title2(),
        ),
      ),
      bottomNavigationBar: AdHelper.bannerAdWidget(),
      body: WillPopScope(
        onWillPop: () => _showExitDialog(),
        child: Container(
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
              AdHelper.nativeAdWidget(),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  commonButton(
                      title: 'Share',
                      onTap: () async {
                        await Share.share(AppUrl.appLink);
                      },
                      icon: const Icon(
                        Icons.share,
                        size: 30,
                        color: Colors.orange,
                      )),
                  // commonButton(
                  //     title: 'Rate',
                  //     onTap: () async {
                  //       _urlLauncher(AppUrl.appLink);
                  //     },
                  //     icon: Icon(
                  //       Icons.star,
                  //       size: 30,
                  //       color: AppColor.white,
                  //     )),
                  commonButton(
                      title: 'Privacy',
                      onTap: () {
                        _showPrivacyDialog();
                      },
                      icon: const Icon(
                        Icons.security,
                        size: 30,
                        color: Colors.purple,
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
                  onTap: () async {
                    try {
                      AdHelper.showIntersrtitialAd();
                      Get.toNamed(AppRoutes.categoryScreen);
                    } catch (e) {
                      Get.toNamed(AppRoutes.categoryScreen);
                    }

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => NativeCodeTest()));
                  },
                  child: Container(
                    width: Get.width * 0.3,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
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
      ),
    );
  }

  Widget commonButton(
      {required String title,
      required Widget icon,
      required Function() onTap}) {
    return Material(
      // color: AppColor.primary,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      shadowColor: Colors.white,
      child: InkWell(
        onTap: onTap,
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
                style: Font.subTitle2(color: AppColor.black),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showPrivacyDialog() async {
    Get.defaultDialog(
      title: 'Privacy Policy',
      middleText: AppUrl.privacy,
      middleTextStyle: Font.subTitle3(color: AppColor.black),
      textConfirm: 'OK',
      confirmTextColor: AppColor.white,
      onConfirm: () {
        Get.back();
      },
    );
  }

  _showExitDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        title: Text(
          'Exit !',
          style: Font.subTitle2(color: AppColor.black),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text(
                'Yes',
                style: Font.button1(color: Colors.red),
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'No',
                style: Font.button1(color: Colors.teal),
              ))
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are You Sure to Want Exit ?',
              style: Font.subTitle3(color: AppColor.black),
            )
          ],
        ),
      ),
    );
  }
}
