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

// // ---------------------------- M E M O R I E S --------------------------------
// AppBar appBarThemeOne(context, String text, IconData icon) {
//   return AppBar(
//     backgroundColor: Colors.white,
//     elevation: 1,
//     toolbarHeight: 65,
//     centerTitle: true,
//     iconTheme: const IconThemeData(
//       color: Colors.brown,
//       size: 25,
//     ),
//     title: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           text,
//           style: GoogleFonts.playfairDisplay(
//             fontSize: 23,
//             color: Colors.brown,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1.2,
//           ),
//         ),
//         const SizedBox(width: 10),
//         Icon(
//           icon,
//         ),
//       ],
//     ),
//     actions: [
//       GestureDetector(
//         onTap: () {
//           Navigator.pushNamed(context, "/add_memory");
//         },
//         child: const Padding(
//           padding: EdgeInsets.all(15),
//           child: Icon(
//             Icons.add,
//           ),
//         ),
//       )
//     ],
//   );
// }

// //------------------------ DRAWER ITEMS -------------------------

// class DrawerItems {
//   String item_name;
//   IconData icn;
//   String route;

//   DrawerItems(
//       {required this.item_name, required this.icn, required this.route});
// }

// List<DrawerItems> drawerItems = [
//   DrawerItems(item_name: "Add Memory", icn: Icons.add, route: "/add_memory"),
//   DrawerItems(item_name: "Settings", icn: Icons.settings, route: "/settings"),
//   DrawerItems(item_name: "User Profile", icn: Icons.verified_user, route: "/profile"),
//   DrawerItems(item_name: "Log Out", icn: Icons.logout, route: "/"),
// ];

// // ----------------------- DRAWER THEME -------------------------
// Drawer drawerTheme(context, String name, String email) {
//   return Drawer(
//     width: MediaQuery.of(context).size.width * 0.75,
//     child: Column(
//       children: [
//         DrawerHeader(
//           duration: const Duration(microseconds: 50),
//           child: Column(
//             children: [
//               CircleAvatar(
//                 radius: MediaQuery.of(context).size.height * 0.07,
//                 backgroundColor: Colors.brown,
//                 child: const Icon(
//                   Icons.person,
//                   size: 50,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.005),
//               Text(
//                 name,
//                 style: GoogleFonts.rancho(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.brown,
//                   letterSpacing: 1.2,
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.005),
//               Text(
//                 email,
//                 style: GoogleFonts.rancho(
//                   fontSize: 12,
//                   color: Colors.brown,
//                   letterSpacing: 1.2,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: ListView(
//             children: drawerItems.map((item) => GestureDetector(
//               onTap: (){
//                 Navigator.pop(context);
//                 item.item_name != "Log Out" ? Navigator.pushNamed(context, item.route) : Container();
//               },
//               child: Column(
//                 children: [
//                   Container(
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 15,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 item.item_name,
//                                 style: GoogleFonts.rancho(
//                                   fontSize: 18,
//                                   color: Colors.brown,
//                                   letterSpacing: 1.2,
//                                 ),
//                               ),
//                               const SizedBox(width: 5),
//                               Icon(
//                                 item.icn,
//                                 size: 25,
//                                 color: Colors.brown,
//                               ),
//                             ],
//                           ),
//                           const Icon(
//                             Icons.arrow_forward_ios,
//                             color: Colors.brown,
//                             size: 15,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const Divider(height: 0)
//                 ],
//               ),
//             )).toList(),
//           ),
//         )
//       ],
//     ),
//   );
// }

// AppBar appBarThemeTwo(context, String text, IconData icon) {
//   return AppBar(
//     backgroundColor: Colors.white,
//     elevation: 1,
//     toolbarHeight: 65,
//     centerTitle: true,
//     iconTheme: const IconThemeData(
//       color: Colors.brown,
//       size: 22,
//     ),
//     leading: GestureDetector(
//       onTap: () {
//         Navigator.pop(context);
//       },
//       child: const Icon(
//         Icons.arrow_back_ios,
//       ),
//     ),
//     title: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Text(
//           text,
//           style: GoogleFonts.playfairDisplay(
//             fontSize: 23,
//             color: Colors.brown,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1.2,
//           ),
//         ),
//         const SizedBox(width: 10),
//         Padding(
//           padding: const EdgeInsets.only(top: 3),
//           child: Icon(
//             icon,
//           ),
//         ),
//       ],
//     ),
//   );
// }

// PopupMenuEntry popupMenuEntryTheme(
//     context, int val, String text, IconData icn, Color clr) {
//   return PopupMenuItem(
//     value: val,
//     child: Container(
//       width: MediaQuery.of(context).size.width * 0.35,
//       child: Row(
//         children: [
//           Icon(
//             icn,
//             color: clr,
//           ),
//           const SizedBox(width: 10),
//           Text(
//             text,
//             style: GoogleFonts.rancho(
//               fontSize: 18,
//               color: Colors.blue,
//               // fontWeight: FontWeight.bold,
//               letterSpacing: 1.2,
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }

// // ----------------------- D E L E T E - M E M O R Y ---------------------------
// Container containerTheme(String text, IconData icn) {
//   return Container(
//     decoration: BoxDecoration(
//         color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             text,
//             style: GoogleFonts.rancho(
//               fontSize: 18,
//               color: Colors.brown,
//               letterSpacing: 1.2,
//             ),
//           ),
//           const SizedBox(width: 10),
//           Icon(
//             icn,
//             color: Colors.brown,
//             size: 20,
//           ),
//         ],
//       ),
//     ),
//   );
// }

// //------------------- PROFILE CARDS ------------------------------
// Container profileCardTheme(context, String txt, IconData icn) {
//   return Container(
//     constraints: BoxConstraints(
//       maxWidth: MediaQuery.of(context).size.width * 0.9,
//       maxHeight: MediaQuery.of(context).size.height * 0.1,
//     ),
//     decoration: BoxDecoration(
//       color: Colors.white70,
//       borderRadius: BorderRadius.circular(10),
//       boxShadow: [
//         const BoxShadow(
//           color: Colors.black,
//         ),
//       ],
//     ),
//     child: Padding(
//       padding: const EdgeInsets.all(12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             txt,
//             style: GoogleFonts.rancho(
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               letterSpacing: 1.2,
//             ),
//           ),
//           Icon(
//             icn,
//             size: 30,
//             color: Colors.white,
//           )
//         ],
//       ),
//     ),
//   );
// }

// //---------------------------- CARD ROW --------------------------------
// Row cardRow(String txt_one, String txt_two) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text(
//         txt_one,
//         style: GoogleFonts.rancho(
//           fontSize: 18,
//           color: Colors.brown,
//           letterSpacing: 1.2,
//         ),
//       ),
//       const SizedBox(width: 5),
//       Text(
//         txt_two,
//         style: GoogleFonts.rancho(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Colors.brown,
//           letterSpacing: 1.2,
//         ),
//       ),
//     ],
//   );
// }
