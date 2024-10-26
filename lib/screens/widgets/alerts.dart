import 'package:try_hive/screens/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_hive/services/theme/colors.dart';

void showAlertDialog(Widget content, {bool? hasCancel, String label = "Alert!!!", String buttonName = "Okay", String cancel = "Cancel", void Function()? onPressed, void Function()? onCancel, bool? isDismissible}){
  Get.dialog(
    AlertDialog(
      title: CustomText(
        text: label, 
        fontSize: 18, 
        textColor: CustomColors.textColor.value,
        fontWeight: FontWeight.bold,
        fontFamily: "Ubuntu",
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          content,
          Row(
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
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomText(
                      text: cancel, 
                      fontSize: 16,
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: CustomFonts.fontFamily.value,
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
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomText(
                    text: buttonName, 
                    fontSize: 16,
                    textColor: Colors.white,
                    fontWeight: FontWeight.bold,
                      fontFamily: CustomFonts.fontFamily.value,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    barrierDismissible: false,
  );
}