import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_hive/Model/notepaddata.dart';
import 'package:try_hive/Model/todolistdata.dart';
import 'package:try_hive/Screens/data_manipulation/edit.dart';
import 'package:try_hive/Screens/widgets/todo_display.dart';
import 'package:try_hive/controllers/bottom_nav_controller.dart';
import 'package:try_hive/controllers/todo_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final bottomNavController = Get.put(BottomNavController());
  final controller = Get.put(TodoController());

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              child: const Tooltip(
                                message: "Back",
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: Colors.black,
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
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: "Search here...",
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                suffixIcon: const Icon(
                                  Icons.search,
                                  size: 25,
                                  color: Colors.black,
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
                            color: Colors.grey.shade700,
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
                                  child: const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      "Notes",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  onTap: (){
                                    bottomNavController.searchIn.value = bottomNavController.searchFilter.indexOf(bottomNavController.searchFilter.first);
                                  },
                                ),
                                DropdownMenuItem(
                                  value: bottomNavController.searchFilter.indexOf(bottomNavController.searchFilter.last),
                                  child: const Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 30, 5),
                                    child: Text(
                                      "Todo",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
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
                SizedBox(
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
                            controller.addToSelected(controller.notedata[index]);
                          },
                          child: Container(
                            color: controller.isPresent(controller.notedata[index].key) ? Colors.transparent : Colors.red.shade200,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width * 0.85,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(3),
                                  boxShadow: [
                                    const BoxShadow(
                                      offset: Offset(-4, -4),
                                      color: Colors.white,
                                      blurRadius: 15,
                                    ),
                                    BoxShadow(
                                      offset: const Offset(4, 4),
                                      color: Colors.grey.shade400,
                                      blurRadius: 15,
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
                                        style: const TextStyle(
                                          fontFamily: "Rancho",
                                          fontSize: 20,
                                          letterSpacing: 1.2,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      controller.notedata[index].title != "" ? Text(
                                        controller.notedata[index].note.toString(),
                                        style: TextStyle(
                                          fontFamily: "Rancho",
                                          fontSize: 18,
                                          letterSpacing: 1.2,
                                          color: Colors.grey[800],
                                        ),
                                      ) : Container(),
                                      const SizedBox(height: 7),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          controller.dateFormat(controller.notedata[index].createdAt),
                                          style: TextStyle(
                                            fontFamily: "Rancho", 
                                            fontSize: 13,
                                            letterSpacing: 1.2,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
    );
  }
}