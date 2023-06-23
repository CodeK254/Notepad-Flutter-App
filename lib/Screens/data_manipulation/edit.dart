// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:try_hive/Model/boxes.dart';
import 'package:try_hive/Model/notepaddata.dart';

class NotesEdit extends StatefulWidget {
  NotePadData npd;

  NotesEdit({required this.npd});

  @override
  State<NotesEdit> createState() => _NotesEditState();
}

class _NotesEditState extends State<NotesEdit> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _message = TextEditingController();

  void takeData(){
    _title.text = widget.npd.title.toString();
    _message.text = widget.npd.note.toString();
    print(widget.npd.key);
  }

  static const IconData check = IconData(0xe156, fontFamily: 'MaterialIcons');

  void editNote(String title, String note){
    final editnote = NotePadData()
      ..title = title
      ..note = note
      ..createdAt = DateTime.now();

    final _mybox = Boxes.getNotePadData();

    _mybox.put(widget.npd.key, editnote);
  }
  
  @override
  void initState(){
    super.initState();
    takeData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 23,
            color: Colors.greenAccent,
          ),
        ),
        title: Text(
          "note",
          style: TextStyle(
            fontFamily: "Rancho",
            fontSize: 32,
            color: Colors.black,
            letterSpacing: 1.2,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: GestureDetector(
              onTap: (){
                editNote(_title.text, _message.text);
                Navigator.pop(context);
              },
              child: const Icon(
                check,
                color: Colors.green,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        children: [
          Text(
            DateTime.now().toString().substring(0, 19),
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700],
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _title,
            cursorColor: Colors.greenAccent,
            cursorHeight: 30,
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
            decoration: InputDecoration(
              hintText: "Title",
              hintStyle: TextStyle(
                fontFamily: "Rancho",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 2,
              ),
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _message,
            cursorColor: Colors.teal,
            cursorHeight: 20,
            maxLines: 8,
            keyboardType: TextInputType.multiline,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              hintText: "Note something down",
              hintStyle: TextStyle(
                fontFamily: "Rancho",
                fontSize: 18,
                color: Colors.black38,
                letterSpacing: 2,
              ),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}