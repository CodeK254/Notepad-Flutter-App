// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_hive/Model/notepaddata.dart';
import 'package:try_hive/controllers/todo_controller.dart';

class NotesEdit extends StatelessWidget {
  NotePadData npd;

  final noteController = Get.put(TodoController());
  final TextEditingController title = TextEditingController();
  final TextEditingController message = TextEditingController();

  NotesEdit({required this.npd});

  @override
  Widget build(BuildContext context) {
    noteController.takeData(npd, title, message);
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
                noteController.editNote(npd, title.text, message.text);
                Navigator.pop(context);
              },
              child: const Icon(
                TodoController.check,
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
            noteController.dateFormat(DateTime.now()),
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700],
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: title,
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
          TextFormField(
            controller: message,
            cursorColor: Colors.teal,
            cursorHeight: 20,
            maxLines: 8,
            keyboardType: TextInputType.multiline,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
            decoration: const InputDecoration(
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