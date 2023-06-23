import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:try_hive/Model/notepaddata.dart';
import 'package:try_hive/Screens/data_manipulation/input.dart';
import 'package:try_hive/Screens/auth/login.dart';
import 'package:try_hive/Screens/auth/register.dart';
import 'package:try_hive/Screens/notes.dart';
import 'package:try_hive/Screens/profile.dart';
import 'package:try_hive/Screens/settings.dart';
import 'package:try_hive/Screens/todo/add_todo.dart';
import 'package:try_hive/Screens/todo/todos.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NotePadDataAdapter());
  await Hive.openBox<NotePadData>("note_pad_data");

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      routes: {
        "/": (context) => const HomeScreen(),
        "/login": (context) => const Login(),
        "/register": (context) => const Register(),
        "/input": (context) => const NotesInput(),
        "/user_profile":(context) => const UserProfile(),
        "/user_settings":(context) => const UserSettings(),
        "/todo_list":(context) => const TodosPage(),
        "/add_todo":(context) => const AddTodo(),
      }
    ),
  );
}