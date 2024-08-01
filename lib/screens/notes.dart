import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:try_hive/model/boxes.dart';
import 'package:try_hive/model/notepaddata.dart';
import 'package:try_hive/screens/data_manipulation/edit.dart';
import 'package:try_hive/controllers/theme_controller.dart';
import 'package:try_hive/controllers/todo_controller.dart';
import 'package:try_hive/services/theme/colors.dart';

class NotesDisplayWidget extends StatelessWidget {
  NotesDisplayWidget({super.key, required this.todoController});
  final controller = Get.put(TodoController());
  final ThemeController themeController = Get.put(ThemeController());
  final TodoController notesController = Get.put(TodoController());

  final TodoController todoController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: notesController.loading.value ? .55 : 1,
          child: SizedBox(
            child: ValueListenableBuilder<Box<NotePadData>>(
              valueListenable: Boxes.getNotePadData().listenable(),
              builder: (context, box, _){
                final notedata = box.values.toList();
                return notedata.isNotEmpty ? ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    ...List.generate(notedata.length, (index) => GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NotesEdit(npd: notedata[index]))
                        );
                      },
                      onLongPress: (){
                        controller.addToSelected(notedata[index]);
                      },
                      child: Container(
                        color: controller.isPresent(notedata[index].key) ? Colors.transparent : Colors.red.shade200,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Obx(
                            () => Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * 0.85,
                              ),
                              decoration: BoxDecoration(
                                color: CustomColors.lightGrey.value,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(-2, -2),
                                    color: CustomColors.upperShadow.value,
                                    blurRadius: 5,
                                  ),
                                  BoxShadow(
                                    offset: const Offset(2, 2),
                                    color: CustomColors.lowerShadow.value,
                                    blurRadius: 5,
                                  ),
                                ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          notedata[index].title != "" ? notedata[index].title.toString() : notedata[index].note.toString(),
                                          style: TextStyle(
                                            fontFamily: CustomFonts.fontFamily.value,
                                            fontSize: 20,
                                            letterSpacing: 1.2,
                                            fontWeight: FontWeight.bold,
                                            color: CustomColors.textColor.value,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Visibility(
                                      visible: notedata[index].title != "",
                                      child: Text(
                                        notedata[index].note.toString().split("\n").first.trimRight(),
                                        style: TextStyle(
                                          fontFamily: CustomFonts.fontFamily.value,
                                          fontSize: 18,
                                          letterSpacing: 1.2,
                                          color: CustomColors.lightTextColor.value,
                                        ),
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        todoController.dateFormat(notedata[index].createdAt),
                                        style: TextStyle(
                                          fontFamily: CustomFonts.fontFamily.value,
                                          fontSize: 13,
                                          letterSpacing: 1.2,
                                          color: CustomColors.grey.value.withOpacity(.75),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
                  ],
                ) : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "No notes to display, click the button below to make your first note.",
                      style: TextStyle(
                        fontSize: 18,
                        color: CustomColors.textColor.value,
                        fontFamily: CustomFonts.fontFamily.value,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
            ),
          ),
        ),
        Visibility(
          visible: notesController.loading.value,
          child: Center(
            child: CircularProgressIndicator(
              color: CustomColors.backgroundColor.value == Colors.black ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}