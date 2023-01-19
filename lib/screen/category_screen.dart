import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/constant/app_colors.dart';
import 'package:live_tv/constant/app_font.dart';
import 'package:live_tv/constant/app_routes.dart';
import 'package:live_tv/controller/fire_base_controller.dart';
import 'package:live_tv/custom_widget/list_loading.dart';
import 'package:live_tv/custom_widget/no_data_found.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final controller = Get.isRegistered<FirebaseController>()
      ? Get.find<FirebaseController>()
      : Get.put(FirebaseController());

  @override
  void initState() {
    super.initState();
    controller.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Category',
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
        child: Obx(
          () => controller.isLoading.value
              ? const ListLoading()
              : controller.categoryList.isEmpty
                  ? const NoDatFound()
                  : ListView.builder(
                      itemCount: controller.categoryList.length,
                      itemBuilder: (context, index) {
                        var element = controller.categoryList[index];
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
                              Navigator.pushNamed(
                                  context, AppRoutes.languageScreen);
                            },
                            leading: CircleAvatar(
                              radius: 18,
                              child: Text(
                                element[0],
                                style: Font.subTitle2(),
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
                    ),
        ),
      ),
    );
  }
}
