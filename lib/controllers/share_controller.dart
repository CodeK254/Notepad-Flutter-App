import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:try_hive/controllers/todo_controller.dart';
import 'package:try_hive/services/share/share_files.dart';

class ShareController extends GetxController{
  Future<void> shareImage(TodoController notepadController) async {
    try{
      Uint8List? image = await notepadController.screenshotController.capture();
      await ShareFiles.shareImage(image!);
      Get.back();
    } catch(e){
      Get.back();
      Get.snackbar(
        "Error!!!",
        e.toString(),
      );
    }
  }
}