import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_hive/screens/widgets/space.dart';
import 'package:try_hive/screens/widgets/text.dart';
import 'package:try_hive/services/theme/colors.dart';

void showAlertDialog(BuildContext context, Widget content, {bool? hasCancel, String label = "Okay", String cancel = "Cancel", void Function()? onPressed, void Function()? onCancel, bool? isDismissible}) async {
  Get.dialog(
    AlertDialog(
      title: CustomText(
        text: "Alert!!!", 
        fontSize: 18, 
        textColor: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: CustomFonts.fontFamily.value,
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
                  child: CustomText(
                    text: cancel, 
                    fontSize: 16,
                    textColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: CustomFonts.fontFamily.value,
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
                  padding: const EdgeInsets.all(0),
                  maximumSize: Size(
                    horizontalSpace(context, 1),
                    20,
                  ),
                  minimumSize: Size(
                    horizontalSpace(context, 1),
                    20,
                  ),
                ),
                child: CustomText(
                  text: label, 
                  fontSize: 16,
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: CustomFonts.fontFamily.value,
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
    barrierDismissible: isDismissible ?? false,
  );
}