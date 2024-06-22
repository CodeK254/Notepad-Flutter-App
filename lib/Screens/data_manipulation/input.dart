import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:try_hive/Model/boxes.dart';
import 'package:try_hive/Model/notepaddata.dart';
import 'package:try_hive/controllers/todo_controller.dart';

class NotesInput extends StatefulWidget {
  const NotesInput({super.key});

  @override
  State<NotesInput> createState() => _NotesInputState();
}

class _NotesInputState extends State<NotesInput> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _message = TextEditingController();
  final todoController = Get.put(TodoController());

  static const IconData check = IconData(0xe156, fontFamily: 'MaterialIcons');

  void addNote(String title, String note){
    final addnote = NotePadData()
      ..title = title
      ..note = note
      ..createdAt = DateTime.now();

    final _mybox = Boxes.getNotePadData();

    _mybox.add(addnote);
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
        title: const Text(
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
                addNote(_title.text, _message.text);
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
            todoController.dateFormat(DateTime.now()),
            style: TextStyle(
              fontSize: 16,
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
            decoration: const InputDecoration(
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
          SizedBox(
            height: MediaQuery.of(context).size.height * .75,
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              controller: _message,
              cursorColor: Colors.teal,
              cursorHeight: 20,
              scribbleEnabled: !true,
              scrollPhysics: const ClampingScrollPhysics(),
              maxLength: 1000,
              maxLines: 90,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1000),
              ],
              keyboardType: TextInputType.multiline,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
              decoration: const InputDecoration(
                hintText: "Note something down...",
                hintStyle: TextStyle(
                  fontFamily: "Rancho",
                  fontSize: 18,
                  color: Colors.black38,
                  letterSpacing: 2,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}