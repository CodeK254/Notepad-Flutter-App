import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController{
  RxBool lightMode = true.obs;
  Future<void> initiateSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isLightMode = sharedPreferences.getBool("is_light_mode");
    if(isLightMode == null || isLightMode){
      lightMode.value = true;
    } else {
      lightMode.value = false;
    }
  }

  Future<void> setSharedPreferences(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool("is_light_mode", value);
  }

  @override
  void onInit() {
    initiateSharedPreferences();
    super.onInit();
  }

  void toggleTheme() async {
    await initiateSharedPreferences();
    await setSharedPreferences(!lightMode.value);
  }
}