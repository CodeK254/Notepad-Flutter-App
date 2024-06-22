import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController{
  RxBool lightMode = true.obs;
  void initiateSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isLightMode = sharedPreferences.getBool("is_light_mode");
    if(isLightMode == null || isLightMode){
      lightMode.value = true;
    } else {
      lightMode.value = false;
    }
  }

  @override
  void onInit() {
    initiateSharedPreferences();
    super.onInit();
  }
}