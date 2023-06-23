Rimport 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:try_hive/Model/boxes.dart';
import 'package:try_hive/Model/notepaddata.dart';
import 'package:try_hive/Screens/constants.dart';
import 'package:try_hive/Screens/data_manipulation/edit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchKey = TextEditingController();
  int? selected;

  void deleteItem(int index){
    final _mybox = Boxes.getNotePadData();

    _mybox.delete(index);
  }

  navigate(){
    Navigator.pushNamed(context, "/input");
  }
  // List data = [];

  // List first = Boxes.getNotePadData() as List;

  // Future<void> _findNote(String searchKey)async {
  //   if(searchKey.isEmpty){
  //     setState((){
  //       data = first;
  //     });
  //   }
  //   else{
  //     setState(() {
  //       data = first
  //         .where((dt)=>dt[1].toLowerCase().contains(searchKey.toLowerCase())).toList();
  //     });
  //   }
  // }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage("assets/launcher.png"),
                  ),
                ),
              ),
            ),
            ...List.generate(
              drawerItems.length,
              (index) => Column(
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, drawerItems[index]["url"]);
                    },
                    tileColor: Colors.white,
                    title: Text(
                      drawerItems[index]["label"],
                      style: TextStyle(
                        fontFamily: "Rancho",
                        fontSize: 20,
                        color: Colors.grey[700],
                        letterSpacing: 1.2,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[900],
                      size: 13,
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.brown[900],
          size: 25,
        ),
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "NotePad",
            style: TextStyle(
              fontFamily: "Rancho",
              fontSize: 32,
              letterSpacing: 1.2,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: selected != null ? GestureDetector(
              onTap: (){
                deleteItem(selected!);
                setState(() {
                  selected = null;
                });
              },
              child: Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              ),
            ) : Container(), 
          )
        ],
      ),
      body: ValueListenableBuilder<Box<NotePadData>>(
        valueListenable: Boxes.getNotePadData().listenable(),
        builder: (context, box, _){
          final notedata = box.values.toList();

          return ListView(
            // padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.85,                    
                    ),
                    child: TextFormField(
                      controller: _searchKey,
                      cursorHeight: 20,
                      cursorColor: Colors.tealAccent,
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                        hintStyle: TextStyle(
                          fontFamily: "Rancho",
                          color: Colors.black,
                          letterSpacing: 2,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        filled: true,
                        fillColor: Colors.grey[300],
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 15,
                          color: Colors.black54,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ...List.generate(notedata.length, (index) => GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotesEdit(npd: notedata[index]))
                  );
                },
                onLongPress: (){
                  setState(() {
                    selected == null ? selected = notedata[index].key : selected = null;
                  });
                },
                child: Padding(
                  padding: selected == null || selected != index ? const EdgeInsets.only(top: 20, left:10, right: 10) : const EdgeInsets.only(top: 20),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.85,
                    ),
                    decoration: BoxDecoration(
                      color: selected != notedata[index].key ? Colors.primaries[Random().nextInt(Colors.primaries.length)].shade100 : Colors.red,
                      borderRadius: selected != notedata[index].key ? BorderRadius.circular(20) : BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notedata[index].title != "" ? notedata[index].title.toString() : notedata[index].note.toString(),
                            style: TextStyle(
                              fontFamily: "Rancho",
                              fontSize: 20,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 10),
                          notedata[index].title != "" ? Text(
                            notedata[index].note.toString(),
                            style: TextStyle(
                              fontFamily: "Rancho",
                              fontSize: 18,
                              letterSpacing: 1.2,
                              color: Colors.grey[800],
                            ),
                          ) : Container(),
                          const SizedBox(height: 7),
                          Text(
                            notedata[index].createdAt.toString().substring(0, 19),
                            style: TextStyle(
                              fontFamily: "Rancho", 
                              fontSize: 12,
                              letterSpacing: 1.2,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          navigate();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      // FutureBuilder(
      //   future: _findNote(_searchKey.text),
      //   builder: (context, snapshot) {
      //     if(!snapshot.hasData || snapshot.hasError){
      //       return Center(
      //         child: CircularProgressIndicator(
      //           color: Colors.blue,
      //         ),
      //       );
      //     } else {
      //       return ListView(
      //         padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Center(
      //               child: Container(
      //                 width: MediaQuery.of(context).size.width * 0.85,
      //                 child: TextFormField(
      //                   controller: _searchKey,
      //                   cursorHeight: 20,
      //                   cursorColor: Colors.tealAccent,
      //                   keyboardType: TextInputType.url,
      //                   decoration: InputDecoration(
      //                     contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      //                     hintStyle: GoogleFonts.rancho(
      //                       color: Colors.black,
      //                       letterSpacing: 2,
      //                       fontSize: 15,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                     filled: true,
      //                     fillColor: Colors.grey[300],
      //                     prefixIcon: const Icon(
      //                       Icons.search,
      //                       size: 15,
      //                       color: Colors.black54,
      //                     ),
      //                     enabledBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(30),
      //                       borderSide: BorderSide.none,
      //                     ),
      //                     border: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(30),
      //                       borderSide: BorderSide.none,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           ...List.generate(data.length, (index) => GestureDetector(
      //             onTap: (){
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => NotesEdit(npd: data[index]))
      //               );
      //             },
      //             onLongPress: (){
      //               setState(() {
      //                 selected == null ? selected = data[index].key : selected = null;
      //               });
      //             },
      //             child: Padding(
      //               padding: const EdgeInsets.only(top: 20),
      //               child: Container(
      //                 constraints: BoxConstraints(
      //                   maxWidth: MediaQuery.of(context).size.width,
      //                 ),
      //                 decoration: BoxDecoration(
      //                   color: selected != data[index].key ? Colors.primaries[Random().nextInt(Colors.primaries.length)].shade100 : Colors.red[200],
      //                   borderRadius: BorderRadius.circular(20),
      //                 ),
      //                 child: Padding(
      //                   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         data[index].title != "" ? data[index].title.toString() : data[index].note.toString(),
      //                         style: GoogleFonts.rancho(
      //                           fontSize: 20,
      //                           letterSpacing: 1.2,
      //                           fontWeight: FontWeight.bold
      //                         ),
      //                       ),
      //                       const SizedBox(height: 10),
      //                       data[index].title != "" ? Text(
      //                         data[index].note.toString(),
      //                         style: GoogleFonts.rancho(
      //                           fontSize: 18,
      //                           letterSpacing: 1.2,
      //                           color: Colors.grey[800],
      //                         ),
      //                       ) : Container(),
      //                       const SizedBox(height: 7),
      //                       Text(
      //                         data[index].createdAt.toString().substring(0, 19),
      //                         style: GoogleFonts.rancho(
      //                           fontSize: 12,
      //                           letterSpacing: 1.2,
      //                           color: Colors.grey[600],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ))
      //         ],
      //       );
      //     }
      //   }
      // ),
    );
  }
}