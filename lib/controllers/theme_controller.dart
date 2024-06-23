import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:try_hive/services/theme/colors.dart';

class ThemeController extends GetxController{
  RxBool lightMode = true.obs;
  RxString fontFamily = "Rancho".obs;
  Future<void> initiateSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isLightMode = sharedPreferences.getBool("is_light_mode");
    String? font = sharedPreferences.getString("font_family");
    if(isLightMode == null || isLightMode){
      lightMode.value = true;
    } else {
      lightMode.value = false;
    }
    if(font == null){
      fontFamily.value = "Rancho";
    } else {
      fontFamily.value = font;
    }
    CustomColors.changeFile(lightMode.value);
  }

  Future<void> setSharedPreferences(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool("is_light_mode", value);
  }

  Future<void> setFontFamily(String font) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("font_family", font);
    initiateSharedPreferences();
  }

  @override
  void onInit() {
    initiateSharedPreferences();
    super.onInit();
  }

  void toggleTheme() async {
    await initiateSharedPreferences();
    await setSharedPreferences(!lightMode.value);
    await initiateSharedPreferences();
  }
}