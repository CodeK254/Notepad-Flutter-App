// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:try_hive/controllers/edit_note_controller.dart';
import 'package:try_hive/model/notepaddata.dart';
import 'package:try_hive/controllers/todo_controller.dart';
import 'package:try_hive/services/theme/colors.dart';

class NotesEdit extends StatefulWidget {
  NotePadData npd;


  NotesEdit({super.key, required this.npd});

  @override
  State<NotesEdit> createState() => _NotesEditState();
}

class _NotesEditState extends State<NotesEdit> {
  // final noteController = Get.put(TodoController());
  final noteController = Get.put(EditNoteController());

  final TextEditingController title = TextEditingController();

  final TextEditingController message = TextEditingController();
  @override
  void initState() {
    noteController.takeData(widget.npd, title, message);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: CustomColors.lightGrey.value,
        appBar: AppBar(
          toolbarHeight: 65,
          backgroundColor: CustomColors.backgroundColor.value,
          elevation: 0,
          leading: GestureDetector(
            onTap: (){
              if(noteController.speaking.value){
                noteController.pauseReading();
              }
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
              fontFamily: CustomFonts.fontFamily.value,
              fontSize: 32,
              color: CustomColors.textColor.value,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                onTap: (){
                  if(noteController.speaking.value){
                    noteController.pauseReading();
                  }
                  noteController.editNote(widget.npd, title.text, message.text);
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
                color: CustomColors.lightTextColor.value.withOpacity(.9),
                letterSpacing: 1.2,
                fontFamily: CustomFonts.fontFamily.value,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: title,
              cursorColor: Colors.greenAccent,
              textCapitalization: TextCapitalization.words,
              cursorHeight: 30,
              keyboardType: TextInputType.text,
              style: TextStyle(
                fontSize: 20,
                color: CustomColors.textColor.value,
                fontWeight: FontWeight.bold
              ),
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: TextStyle(
                  fontFamily: CustomFonts.fontFamily.value,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.lightTextColor.value,
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
                controller: message,
                cursorColor: Colors.teal,
                cursorHeight: 20,
                scribbleEnabled: !true,
                textCapitalization: TextCapitalization.sentences,
                scrollPhysics: const ClampingScrollPhysics(),
                maxLines: 90,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1500),
                ],
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  fontSize: 15,
                  color: CustomColors.textColor.value,
                ),
                decoration: InputDecoration(
                  hintText: "Note something down...",
                  hintStyle: TextStyle(
                    fontFamily: CustomFonts.fontFamily.value,
                    fontSize: 18,
                    color: CustomColors.lightTextColor.value.withOpacity(.75),
                    letterSpacing: 2,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(!noteController.speaking.value){
              noteController.readText("Title: ${title.text}, Message: ${message.text}");
            } else {
              noteController.pauseReading();
            }
          },
          backgroundColor: CustomColors.backgroundColor.value.withOpacity(.8),
          child: Obx(
            () => Icon(
              !noteController.speaking.value ? CupertinoIcons.speaker_2 : CupertinoIcons.speaker_slash,
              size: 25,
              color: CustomColors.textColor.value,
            ),
          ),
        ),
      ),
    );
  }
}