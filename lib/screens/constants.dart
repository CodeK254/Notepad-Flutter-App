import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_hive/services/theme/colors.dart';
// import 'package:google_fonts/google_fonts.dart';

//------------- Register and Login Screen ------------------

InputDecoration inputDecorTheme(String label) {
  return InputDecoration(
    label: Text(
      label,
      style: const TextStyle(
        color: Colors.brown,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.brown,
      ),
    ),
  );
}

TextButton textButtonTheme() {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      backgroundColor: Colors.brown,
    ),
    child: const Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        "REGISTER",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          letterSpacing: 1.2,
        ),
      ),
    ),
  );
}

GestureDetector navAlternative(context, String route, String text) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacementNamed(context, "/$route");
    },
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.brown,
          letterSpacing: 1.2,
        ),
      ),
    ),
  );
}

List<Map> drawerItems = [
  {"label": "My todos", "url": "/todo_list"},
  {"label": "Profile", "url": "/user_profile"},
  {"label": "Settings", "url": "/user_settings"},
];

// App-Bar Custom

AppBar myAppBar(String title){
  return AppBar(
    toolbarHeight: 70,
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.brown[900],
      size: 25,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: GestureDetector(
          onTap: (){
            Get.toNamed("/search");
          },
          child: const Icon(
            Icons.search,
            color: Colors.black,
            size: 25,
          ),
        ),
      )
    ],
    title: Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        title,
        style: TextStyle(
          fontFamily: CustomFonts.fontFamily.value,
          fontSize: 30,
          letterSpacing: 1.2,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

FloatingActionButton FAB(context, Function func){
  return FloatingActionButton(
    backgroundColor: Colors.black,
    onPressed: (){
      func;
    },
    child: const Icon(
      Icons.add,
      color: Colors.white,
      size: 30,
    ),
  );
}