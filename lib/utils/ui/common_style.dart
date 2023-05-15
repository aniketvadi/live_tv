import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonStyle {

  static InputDecoration getTextFormFiledDecorationForMessageFiled({
    required String hintText,
  }) {
    InputDecoration inputDecoration;
    inputDecoration = InputDecoration(
      contentPadding: const EdgeInsets.only(
        top: 16.0,
        bottom: 16.0,
      ),
      prefixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Icon(
              Icons.message,
              size: 30.0,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
      hintText: hintText,
      hintStyle: const TextStyle(letterSpacing: 1.1),
      counterText: '',
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        borderSide: BorderSide(
          color: Get.theme.primaryColor,
          width: 1.8,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.8,
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.8,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.8,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.8,
        ),
      ),
    );
    return inputDecoration;
  }

  static InputDecoration getCommonTextFormFiledDecoration({
    required String hintText,
    required IconData iconData,
    required Widget suffixIcon,
    required VoidCallback onSuffixIconPresses,
  }) {
    InputDecoration inputDecoration;
    inputDecoration = InputDecoration(
      suffixIcon: IconButton(icon: suffixIcon, onPressed: onSuffixIconPresses),
      contentPadding: const EdgeInsets.only(
        top: 16.0,
        bottom: 16.0,
      ),
      prefixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Icon(
              iconData,
              size: 30.0,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
      hintText: hintText,
      hintStyle: const TextStyle(letterSpacing: 1.1),
      counterText: '',
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        borderSide: BorderSide(
          color: Get.theme.primaryColor,
          width: 1.8,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.8,
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.8,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.8,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.8,
        ),
      ),
    );
    return inputDecoration;
  }
}
