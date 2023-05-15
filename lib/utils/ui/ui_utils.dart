import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiUtils {

  static dynamic errorSnackBar({
    required String message,
  }) {
    ScaffoldMessenger.of(Get.context!).clearSnackBars();
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red.shade600,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(milliseconds: 1500),
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 14.0,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  static dynamic successSnackBar({
    required String message,
  }) {
    ScaffoldMessenger.of(Get.context!).clearSnackBars();
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green.shade600,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(milliseconds: 1500),
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 14.0,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
