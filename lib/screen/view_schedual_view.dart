import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/constant/app_colors.dart';
import 'package:live_tv/constant/app_font.dart';
import 'package:live_tv/controller/fire_base_controller.dart';
import 'package:timelines/timelines.dart';

class SchedualView extends StatefulWidget {
  const SchedualView({super.key});

  @override
  State<SchedualView> createState() => _SchedualViewState();
}

class _SchedualViewState extends State<SchedualView> {
  final controller = Get.isRegistered<FirebaseController>()
      ? Get.find<FirebaseController>()
      : Get.put(FirebaseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Schedual',
          style: Font.subTitle2(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Obx(
          () => controller.schedualList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      timeTableWidget(context),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget timeTableWidget(BuildContext context) {
    return Obx(
      () => Container(
        alignment: Alignment.centerLeft,
        child: FixedTimeline.tileBuilder(
          theme: TimelineTheme.of(context).copyWith(
              nodePosition: 0.2,
              indicatorPosition: 0.1,
              connectorTheme: const ConnectorThemeData(
                  color: Colors.black54, thickness: 1.2),
              indicatorTheme:
                  const IndicatorThemeData(color: Colors.black54, size: 8)),
          builder: TimelineTileBuilder.connectedFromStyle(
            contentsAlign: ContentsAlign.basic,
            itemCount: controller.schedualList.length,
            connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
            indicatorStyleBuilder: (context, index) =>
                index == 0 ? IndicatorStyle.dot : IndicatorStyle.outlined,
            oppositeContentsBuilder: (context, index) {
              var element = controller.schedualList[index];
              return Container(
                margin: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(
                    element.key ?? '',
                    style: Font.subTitle3(),
                  ),
                ),
              );
            },
            contentsBuilder: (context, index) {
              var data = controller.schedualList[index];
              return Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name ?? '',
                      style: Font.subTitle1(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        data.type ?? '',
                        style: Font.subTitle3(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      data.otheDetail ?? '',
                      style: Font.bodyText1(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
