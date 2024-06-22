import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_hive/controllers/theme_controller.dart';

ThemeController themeController = Get.put(ThemeController());
class CustomColors{
  static final StreamController<bool> _controller = StreamController<bool>();
  CustomColors(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      textColor.value = themeController.lightMode.value ? Colors.black : Colors.white;
      lightTextColor.value = themeController.lightMode.value ? Colors.grey[800]! : Colors.grey[200]!;
      backgroundColor.value = themeController.lightMode.value ? Colors.white : Colors.black;
      grey.value = Colors.grey;
      lightGrey.value = themeController.lightMode.value ? Colors.grey.shade100 : Colors.grey.shade900;
    });
  }
  
  static Rx<Color> textColor = themeController.lightMode.value ? Colors.black.obs : Colors.white.obs;
  static Rx<Color> lightTextColor = themeController.lightMode.value ? Colors.grey[800]!.obs : Colors.grey[200]!.obs;
  static Rx<Color> backgroundColor = themeController.lightMode.value ? Colors.white.obs : Colors.black.obs;
  static Rx<Color> grey = Colors.grey.obs;
  static Rx<Color> lightGrey = themeController.lightMode.value ? Colors.grey.shade100.obs : Colors.grey.shade900.obs;

  static void changeFile(bool value){
    _controller.sink.add(value);
  }

  Stream<bool> get stream => _controller.stream;
}