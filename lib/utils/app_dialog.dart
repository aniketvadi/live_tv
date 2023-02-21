import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

appLoading({String msg = 'Loading...'}) {
  Get.defaultDialog(
      title: '',
      middleText: '',
      content: Column(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            height: 15,
          ),
          Text(
            msg,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ));
}
