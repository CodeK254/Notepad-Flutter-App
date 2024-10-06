import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:try_hive/model/boxes.dart';
import 'package:try_hive/model/notepaddata.dart';
import 'package:try_hive/controllers/todo_controller.dart';
import 'package:try_hive/services/theme/colors.dart';

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

    final mybox = Boxes.getNotePadData();

    mybox.add(addnote);
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
                color: CustomColors.lightTextColor.value.withOpacity(.9),
                letterSpacing: 1.2,
                fontFamily: CustomFonts.fontFamily.value,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _title,
              cursorColor: Colors.greenAccent,
              cursorHeight: 30,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.text,
              style: TextStyle(
                fontSize: 20,
                color: CustomColors.textColor.value,
                fontWeight: FontWeight.bold
              ),
              decoration: InputDecoration(
                hintText: "Title...",
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
                controller: _message,
                cursorColor: Colors.teal,
                cursorHeight: 20,
                scribbleEnabled: !true,
                scrollPhysics: const ClampingScrollPhysics(),
                textCapitalization: TextCapitalization.sentences,
                maxLength: 1000,
                maxLines: 90,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1000),
                ],
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  fontSize: 16,
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
      ),
    );
  }
}