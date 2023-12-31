import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:try_hive/Model/notepaddata.dart';
import 'package:try_hive/Model/todolistdata.dart';
import 'package:try_hive/Screens/data_manipulation/input.dart';
import 'package:try_hive/Screens/auth/login.dart';
import 'package:try_hive/Screens/auth/register.dart';
import 'package:try_hive/Screens/data_manipulation/search_page.dart';
import 'package:try_hive/Screens/profile.dart';
import 'package:try_hive/Screens/settings.dart';
import 'package:try_hive/Screens/widgets/bottom_nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NotePadDataAdapter());
  Hive.registerAdapter(TodoListDataAdapter());
  await Hive.openBox<NotePadData>("note_pad_data");
  await Hive.openBox<TodoListData>("todo_list_data");

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      routes: {
        "/": (context) => HomeScreen(),
        "/login": (context) => const Login(),
        "/register": (context) => const Register(),
        "/input": (context) => const NotesInput(),
        "/user_profile":(context) => const UserProfile(),
        "/user_settings":(context) => const UserSettings(),
        "/search": (context) => SearchScreen(),
      }
    ),
  );
}