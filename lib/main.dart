import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:try_hive/model/notepaddata.dart';
import 'package:try_hive/model/todolistdata.dart';
import 'package:try_hive/screens/data_manipulation/input.dart';
import 'package:try_hive/screens/auth/login.dart';
import 'package:try_hive/screens/auth/register.dart';
import 'package:try_hive/screens/data_manipulation/search_page.dart';
import 'package:try_hive/screens/profile.dart';
import 'package:try_hive/screens/settings/settings.dart';
import 'package:try_hive/screens/widgets/bottom_nav.dart';
import 'package:try_hive/controllers/theme_controller.dart';
// import 'package:try_hive/services/fingerprint.dart';
import 'package:try_hive/services/theme/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await AuthService.requestAuthentication();
  ThemeController themeController = Get.put(ThemeController());
  await Hive.initFlutter();
  Hive.registerAdapter(NotePadDataAdapter());
  Hive.registerAdapter(TodoListDataAdapter());
  await Hive.openBox<NotePadData>("note_pad_data");
  await Hive.openBox<TodoListData>("todo_list_data");

  // Listen to theme changes
  final value = CustomColors().stream;
  value.listen((event) {});

  //Listen for font changes
  final fontFamily = CustomFonts().stream;
  fontFamily.listen((event) {});

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]
  );

  runApp(
    Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeController.lightMode.value ? ThemeData.light() : ThemeData.dark(),
        routes: {
          "/": (context) => HomeScreen(),
          "/login": (context) => const Login(),
          "/register": (context) => const Register(),
          "/input": (context) => const NotesInput(),
          "/user_profile":(context) => const UserProfile(),
          "/settings":(context) => SettingsScreen(),
          "/search": (context) => SearchScreen(),
        }
      ),
    ),
  );
}