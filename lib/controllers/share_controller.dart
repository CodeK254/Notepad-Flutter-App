import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_hive/screens/widgets/text.dart';

class ShareController extends GetxController{
  void shareImage(Widget content, {bool? hasCancel, String label = "Okay", String cancel = "Cancel", void Function()? onPressed, void Function()? onCancel}) async {
    Get.dialog(
    AlertDialog(
      title: const CustomText(
        text: "Alert!!!", 
        fontSize: 18, 
        textColor: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: "Ubuntu",
      ),
      content: content,
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: hasCancel ?? false,
                child: TextButton(
                  onPressed: onCancel,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: cancel, 
                      fontSize: 16,
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Ubuntu",
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
              TextButton(
                onPressed: onPressed ?? () => Get.back(),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: label, 
                    fontSize: 16,
                    textColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Ubuntu",
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    barrierDismissible: false,
  );
  }
}