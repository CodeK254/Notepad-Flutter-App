import 'package:flutter/material.dart';
import "package:flutter_tts/flutter_tts.dart";
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:try_hive/model/boxes.dart';
import 'package:try_hive/model/notepaddata.dart';

class EditNoteController extends GetxController{
  FlutterTts flutterTts = FlutterTts();
  final notesBox = Boxes.getNotePadData();
  RxBool speaking = false.obs;
  void readText(String text) async {
    try{
      await flutterTts.speak(text);
      speaking.value = true;
    } catch(e){
      Get.snackbar(
        "Error!!!",
        e.toString(),
      );
    }
  }

  void pauseReading() async {
    await flutterTts.pause();
    speaking.value = false;
  }

  void takeData(NotePadData npd, TextEditingController title, TextEditingController message){
    title.text = npd.title.toString();
    message.text = npd.note.toString();
  }

  void editNote(NotePadData npd, String title, String note){
    final editnote = NotePadData()
      ..title = title
      ..note = note
      ..createdAt = DateTime.now();

    notesBox.put(npd.key, editnote);
  }

  String dateFormat(DateTime dateTime){
    String dateFormat = DateFormat.yMMMMd("en_US").format(dateTime);
    return dateFormat;
  }
}