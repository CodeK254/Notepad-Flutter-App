import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class ShareFiles{
  static Future<void> shareText(String text) async {
    try{
      ShareResult shareResult = await Share.share(
        text, 
        subject: "codekarma1003@gmail.com",
      );
      if(shareResult.status != ShareResultStatus.success){
        Get.snackbar(
          "Failed!!!",
          "Unable to share the file",
        );
      }
    } catch(e){
      Get.snackbar(
        "Error!!!",
        "$e"
      );
    }
  }

  static Future<void> requestPermission() async {
    PermissionStatus permissionStatus = await Permission.storage.status;
    if(permissionStatus == PermissionStatus.granted || permissionStatus == PermissionStatus.limited)
    {} else {
      await Permission.storage.request();
      requestPermission();
    }
  }

  static shareImage(Uint8List imageBytes) async {
    requestPermission();
    String name = DateTime.now().millisecondsSinceEpoch.toString();
    try{
      File file = await File("/storage/emulated/0/Download/$name.jpg").create();
      await file.writeAsBytes(imageBytes);
      ShareResult shareResult = await Share.shareXFiles(
        [
          XFile("/storage/emulated/0/Download/$name.jpg"),
        ],
        subject: "Shared from Notepad KE",
        text: "Shared from Notepad KE"
      );
      print(shareResult.status);
      if(shareResult.status != ShareResultStatus.success){
        Get.snackbar(
          "Failed!!!",
          "Unable to share the file",
        );
      } else {
        Get.snackbar(
          "Success!!!",
          "File shared successfully.",
        );
      }
    } catch(e){
      Get.snackbar(
        "Error!!!",
        "$e"
      );
    }
  }
}