import 'package:flutter/material.dart';
import 'package:live_tv/constant/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ListLoading extends StatelessWidget {
  const ListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: AppColor.primary,
            highlightColor: AppColor.secondary,
            child: Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
      ),
    );
  }
}
