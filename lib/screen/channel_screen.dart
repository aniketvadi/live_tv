import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/config/app_routes.dart';
import 'package:live_tv/constant/app_colors.dart';
import 'package:live_tv/constant/app_font.dart';
import 'package:live_tv/controller/fire_base_controller.dart';
import 'package:live_tv/custom_widget/list_loading.dart';
import 'package:live_tv/custom_widget/no_data_found.dart';
import 'package:live_tv/services/mobile_ad_helper.dart';

class ChannelScreen extends StatefulWidget {
  const ChannelScreen({super.key});

  @override
  State<ChannelScreen> createState() => ChannelScreenState();
}

class ChannelScreenState extends State<ChannelScreen> {
  final controller = Get.isRegistered<FirebaseController>()
      ? Get.find<FirebaseController>()
      : Get.put(FirebaseController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Channel',
          style: Font.title2(),
        ),
      ),
      bottomNavigationBar: AdHelper.bannerAdWidget(),
      body: WillPopScope(
        onWillPop: () async {
          AdHelper.showIntersrtitialAd();
          return true;
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 61, 57, 82),
              Color.fromARGB(255, 43, 40, 68),
            ],
          )),
          child: Obx(
            () => controller.isLoading.value
                ? const ListLoading()
                : controller.channelList.isEmpty
                    ? const NoDatFound()
                    : ListView.separated(
                        itemCount: controller.channelList.length,
                        separatorBuilder: (context, index) {
                          var element = controller.channelList[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 2,
                                    spreadRadius: -1,
                                  )
                                ]),
                            child: ListTile(
                              onTap: () {
                                controller.getSchedual(channel: element);
                                try {
                                  AdHelper.showRewardedAd();
                                  Get.toNamed(AppRoutes.schedualScreen);
                                } catch (e) {
                                  Get.toNamed(AppRoutes.schedualScreen);
                                }
                              },
                              leading: CircleAvatar(
                                radius: 18,
                                child: Text(
                                  element[0],
                                  style: Font.subTitle2(color: Colors.blue),
                                ),
                              ),
                              title: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  element,
                                  style: Font.subTitle1(),
                                ),
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: AppColor.white,
                                size: 26,
                              ),
                            ),
                          );
                        },
                        itemBuilder: (context, index) {
                          if (index % 3 == 0) {
                            return AdHelper.bannerAdWidget();
                          }
                          return const SizedBox();
                        },
                      ),
          ),
        ),
      ),
    );
  }
}
