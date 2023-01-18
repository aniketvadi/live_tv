import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/constant/app_colors.dart';
import 'package:live_tv/constant/app_font.dart';
import 'package:live_tv/constant/app_routes.dart';
import 'package:live_tv/controller/fire_base_controller.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
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
          'Language',
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
        child: Obx(() => controller.languageList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                itemCount: controller.languageList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 5.0,
                    childAspectRatio: 1.2),
                itemBuilder: (context, index) {
                  var element = controller.languageList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(10),
                      elevation: 3.0,
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {
                          controller.getChannelBylanguage(lang: element);
                          Navigator.pushNamed(context, AppRoutes.channelScreen);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                                radius: 40,
                                // backgroundColor:
                                //     Color.fromARGB(255, 13, 12, 29),
                                child: Text(
                                  element[0],
                                  style: Font.title1(),
                                )),
                            Text(
                              element,
                              style: Font.text(
                                  size: 18,
                                  weight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
      ),
    );
  }
}
