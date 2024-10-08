import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:try_hive/controllers/settings_controller.dart';
import 'package:try_hive/controllers/theme_controller.dart';
import 'package:try_hive/screens/widgets/custom_spacing.dart';
import 'package:try_hive/screens/widgets/space.dart';
import 'package:try_hive/services/theme/colors.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final SettingsController settingsController = Get.put(SettingsController());
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: CustomColors.lightGrey.value,
        appBar: AppBar(
          title: Text(
            "Preferences",
            style: TextStyle(
              fontSize: 40,
              fontFamily: CustomFonts.fontFamily.value,
              fontWeight: FontWeight.bold,
              color: CustomColors.textColor.value,
            ),
          ),
          backgroundColor: CustomColors.backgroundColor.value,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Enable light theme:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.textColor.value,
                        fontFamily: CustomFonts.fontFamily.value,
                      ),
                    ),
                    Obx(
                      () => CupertinoSwitch(
                        value: themeController.lightMode.value,
                        thumbColor: CustomColors.textColor.value,
                        trackColor: CustomColors.lightGrey.value.withOpacity(.75),
                        onChanged: (value) async {
                          themeController.lightMode.value = value;
                          themeController.toggleTheme();
                        }
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Obx(
                  () => DropdownMenu(
                    width: MediaQuery.of(context).size.width * .95,
                    menuHeight: MediaQuery.of(context).size.height *.5,
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.textColor.value,
                      fontFamily: themeController.fontFamily.value,
                    ),
                    initialSelection: themeController.fontFamily.value,
                    onSelected: (value){
                      themeController.fontFamily.value = value!;
                      themeController.setFontFamily(themeController.fontFamily.value);
                    },
                    dropdownMenuEntries: [
                      ...List.generate(
                        settingsController.fonts.length,
                        (index) => DropdownMenuEntry(
                          value: settingsController.fonts[index], 
                          label: settingsController.fonts[index], 
                        ),
                      ),
                    ]
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width * .95,
                  decoration: BoxDecoration(
                    color: CustomColors.lightGrey.value,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      width: 1,
                      color: CustomColors.textColor.value,
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Obx(
                      () => Text(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: themeController.fontFamily.value,
                          color: CustomColors.textColor.value,
                        ),
                      ),
                    ),
                  ),
                ),
                const CustomSpacing(height: .065),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: horizontalSpace(context, .45),
                      height: verticalSpace(context, .33),
                      child: const Image(
                        image: AssetImage("assets/New Product.png"),
                      ),
                    ).animate(
                      effects: [
                        const FadeEffect(
                          begin: 0,
                          end: 1,
                          duration: Duration(milliseconds: 1500),
                          delay: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: horizontalSpace(context, .45),
                      height: verticalSpace(context, .3),
                      child: const Image(
                        image: AssetImage("assets/New Product.png"),
                      ),
                    ).animate(
                      effects: [
                        const FadeEffect(
                          begin: 0,
                          end: 1,
                          duration: Duration(milliseconds: 1000),
                          delay: Duration(milliseconds: 1000),
                          curve: Curves.easeIn,
                        ),
                      ]
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}