import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_hive/controllers/theme_controller.dart';

ThemeController themeController = Get.put(ThemeController());
class CustomColors{
  static final StreamController<bool> _controller = StreamController<bool>();
  CustomColors(){
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      textColor.value = themeController.lightMode.value ? Colors.black : Colors.white;
      lightTextColor.value = themeController.lightMode.value ? Colors.grey[800]! : Colors.grey[200]!;
      backgroundColor.value = themeController.lightMode.value ? Colors.white : Colors.black;
      grey.value = Colors.grey;
      lightGrey.value = themeController.lightMode.value ? Colors.grey.shade100 : Colors.grey.shade900;
      upperShadow = themeController.lightMode.value ? Colors.white.obs : Colors.grey.shade700.obs;
      lowerShadow = themeController.lightMode.value ? Colors.grey.shade300.obs : Colors.black.obs;
    });
  }
  
  static Rx<Color> textColor = themeController.lightMode.value ? Colors.black.obs : Colors.white.obs;
  static Rx<Color> lightTextColor = themeController.lightMode.value ? Colors.grey[800]!.obs : Colors.grey[200]!.obs;
  static Rx<Color> backgroundColor = themeController.lightMode.value ? Colors.white.obs : Colors.black.obs;
  static Rx<Color> grey = Colors.grey.obs;
  static Rx<Color> lightGrey = themeController.lightMode.value ? Colors.grey.shade100.obs : Colors.grey.shade900.obs;
  static Rx<Color> upperShadow = themeController.lightMode.value ? Colors.white.obs : Colors.grey.shade700.obs;
  static Rx<Color> lowerShadow = themeController.lightMode.value ? Colors.grey.shade300.obs : Colors.black.obs;

  static void changeFile(bool value){
    _controller.sink.add(value);
  }

  Stream<bool> get stream => _controller.stream;
}

class CustomFonts{
  static final StreamController<String> _controller = StreamController<String>();

  CustomFonts(){
    Timer.periodic(const Duration(milliseconds: 500), (timer){
      fontFamily.value = themeController.fontFamily.value;
    });
  }

  static RxString fontFamily = "Rancho".obs;

  static void changeFile(String font){
    _controller.sink.add(font);
  }

  Stream<String> get stream => _controller.stream;
}