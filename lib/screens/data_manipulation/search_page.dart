import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_hive/model/notepaddata.dart';
import 'package:try_hive/model/todolistdata.dart';
import 'package:try_hive/screens/data_manipulation/edit.dart';
import 'package:try_hive/screens/widgets/todo_display.dart';
import 'package:try_hive/controllers/bottom_nav_controller.dart';
import 'package:try_hive/controllers/todo_controller.dart';
import 'package:try_hive/services/theme/colors.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final bottomNavController = Get.put(BottomNavController());
  final controller = Get.put(TodoController());

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: CustomColors.lightGrey.value,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Tooltip(
                                  message: "Back",
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: CustomColors.textColor.value,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 9,
                              child: TextFormField(
                                controller: search,
                                maxLines: 1,
                                onChanged: (val){
                                  if(bottomNavController.searchIn.value == 0){
                                    List<NotePadData> data = controller.notesBox.values.toList();
                                    controller.notedata.value = data.where((element) => element.note!.toLowerCase().contains(val.toLowerCase()) || element.title.toString().toLowerCase().contains(val.toLowerCase())).toList();
                                  } else {
                                    List<TodoListData> data = controller.mybox.values.toList();
                                    controller.todos.value = data.where((element) => element.todo!.toLowerCase().contains(val.toLowerCase())).toList();
                                  }
                                },
                                style: TextStyle(
                                  fontSize: 16,
                                  color: CustomColors.textColor.value,
                                ),
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: CustomColors.backgroundColor.value,
                                    ),
                                  ),
                                  hintText: "Search here...",
                                  focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: CustomColors.lightTextColor.value,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    size: 25,
                                    color: CustomColors.textColor.value,
                                  )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Search in:",
                            style: TextStyle(
                              fontSize: 14,
                              color: CustomColors.lightTextColor.value.withOpacity(.7),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Obx(
                              () => DropdownButton<int>(
                                value: bottomNavController.searchIn.value,
                                items: [
                                  DropdownMenuItem(
                                    value: bottomNavController.searchFilter.indexOf(bottomNavController.searchFilter.first),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Notes",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColors.textColor.value,
                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      bottomNavController.searchIn.value = bottomNavController.searchFilter.indexOf(bottomNavController.searchFilter.first);
                                    },
                                  ),
                                  DropdownMenuItem(
                                    value: bottomNavController.searchFilter.indexOf(bottomNavController.searchFilter.last),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 5, 30, 5),
                                      child: Text(
                                        "Todo",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColors.textColor.value,
                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      bottomNavController.searchIn.value = bottomNavController.searchFilter.indexOf(bottomNavController.searchFilter.last);
                                    },
                                  ),
                                ], 
                                onChanged: (val){
                                  bottomNavController.searchIn.value = val!;
                                },
                                onTap: (){
                                  
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    color: CustomColors.lightGrey.value,
                    height: MediaQuery.of(context).size.height,
                    child: Obx(
                      () => bottomNavController.searchIn.value == 0 ? ListView(
                        children: [
                          ...List.generate(controller.notedata.length, (index) => GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NotesEdit(npd: controller.notedata[index]))
                              );
                            },
                            onLongPress: (){
                              // controller.addToSelected(controller.notedata[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
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
                                      Text(
                                        controller.notedata[index].title != "" ? controller.notedata[index].title.toString() : controller.notedata[index].note.toString(),
                                        style: TextStyle(
                                          fontFamily: CustomFonts.fontFamily.value,
                                          fontSize: 20,
                                          color: CustomColors.textColor.value,
                                          letterSpacing: 1.2,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      controller.notedata[index].title != "" ? Text(
                                        controller.notedata[index].note.toString(),
                                        style: TextStyle(
                                          fontFamily: CustomFonts.fontFamily.value,
                                          fontSize: 18,
                                          letterSpacing: 1.2,
                                          color: CustomColors.lightTextColor.value.withOpacity(.8),
                                        ),
                                      ) : Container(),
                                      const SizedBox(height: 7),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          controller.dateFormat(controller.notedata[index].createdAt),
                                          style: TextStyle(
                                            fontFamily: CustomFonts.fontFamily.value,
                                            fontSize: 13,
                                            letterSpacing: 1.2,
                                            color: CustomColors.grey.value,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ) : ListView.builder(
                        itemCount: controller.todos.length,
                        itemBuilder: (context, index){
                          return TodoListWidget(todos: controller.todos, index: index, todoController: controller);
                        }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}