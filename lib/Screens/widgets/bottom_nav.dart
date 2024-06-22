import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_hive/Screens/notes.dart';
import 'package:try_hive/Screens/todo/todos.dart';
import 'package:try_hive/controllers/bottom_nav_controller.dart';
import 'package:try_hive/controllers/theme_controller.dart';
import 'package:try_hive/controllers/todo_controller.dart';
import 'package:try_hive/services/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final BottomNavController bottomNavController = Get.put(BottomNavController());
  final TodoController todoController = Get.put(TodoController());
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: CustomColors.lightGrey.value,
        appBar: bottomNavController.toDisplay.value == 0 ? AppBar(
          toolbarHeight: 70,
          backgroundColor: CustomColors.backgroundColor.value,
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
                color: CustomColors.textColor.value,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Visibility(
              visible: todoController.selected.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: GestureDetector(
                  onTap: (){
                   todoController.deleteSelected();
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 25,
                  ),
                ), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: (){
                  themeController.toggleTheme();
                },
                child: Obx(
                  () => Icon(
                    themeController.lightMode.value ? Icons.dark_mode : Icons.light_mode,
                    size: 25,
                    color: CustomColors.textColor.value,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed("/search");
                },
                child: Icon(
                  Icons.search,
                  size: 25,
                  color: CustomColors.textColor.value,
                ),
              ),
            ),
          ],
        ) : AppBar(
          toolbarHeight: 70,
          backgroundColor: CustomColors.backgroundColor.value,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.brown[900],
            size: 25,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GestureDetector(
                onTap: (){
                  themeController.toggleTheme();
                },
                child: Obx(
                  () => Icon(
                    themeController.lightMode.value ? Icons.dark_mode : Icons.light_mode,
                    color: CustomColors.textColor.value,
                    size: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed("/search");
                },
                child: Icon(
                  Icons.search,
                  color: CustomColors.textColor.value,
                  size: 25,
                ),
              ),
            ),
          ],
          title: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Todo List",
              style: TextStyle(
                fontFamily: "Rancho",
                fontSize: 30,
                letterSpacing: 1.2,
                color: CustomColors.textColor.value,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: bottomNavController.toDisplay.value == 0 ? NotesDisplayWidget(todoController: todoController) : TodoDisplayWidget(),
        bottomNavigationBar: BottomNavigationBarTheme(
          data: BottomNavigationBarThemeData(
            backgroundColor: CustomColors.backgroundColor.value,
            selectedItemColor: CustomColors.textColor.value,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: CustomColors.grey.value,
            selectedIconTheme: IconThemeData(
              size: 28,
              color: CustomColors.textColor.value,
            ),
            unselectedIconTheme: IconThemeData(
              size: 25,
              color: CustomColors.grey.value,
            ),
            selectedLabelStyle: TextStyle(
              fontFamily: "Rancho",
              fontSize: 18,
              color: CustomColors.grey.value.withOpacity(.8),
            ),
          ), 
          child: BottomNavigationBar(
            currentIndex: bottomNavController.toDisplay.value,
            onTap: (val){
              bottomNavController.toDisplay.value = val;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notes,
                ),
                label: "Notes",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.today,
                ),
                label: "Todos",
              ),
            ]
          )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          // mini: true,
          backgroundColor: CustomColors.textColor.value,
          onPressed: (){
            if(bottomNavController.toDisplay.value == 0){
              Get.toNamed("/input");
            } else {
              showDialogBox(context);
            }
          },
          child: Icon(
            Icons.add,
            color: CustomColors.backgroundColor.value,
            size: 30,
          ),
        ),
      ),
    );
  }
  
  void showDialogBox(BuildContext context) {
    TextEditingController todo = TextEditingController();
    Get.dialog(
      AlertDialog(
        title: Text(
          "New Todo",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Rancho",
            color: CustomColors.textColor.value,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: todoController.formKey,
              child: TextFormField(
                validator: (val){
                  return val!.isEmpty ? "Input field cannot be blank" : null;
                },
                controller: todo,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                keyboardAppearance: Brightness.dark,
                style: TextStyle(
                  fontSize: 16,
                  color: CustomColors.lightTextColor.value,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 3),
                  hintText: "Type your todo here...",
                  hintStyle: TextStyle(
                    color: CustomColors.grey.value.withOpacity(.8),
                    fontSize: 14,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.lightTextColor.value.withOpacity(.6),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.lightTextColor.value.withOpacity(.6),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red.shade200,
                ),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 18,
                    fontFamily: "Rancho",
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  if(todoController.formKey.currentState!.validate()){
                    todoController.addTodo(todo.text, false);
                  }
                  Navigator.pop(context);
                }, 
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue.shade300,
                ),
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 18,
                    fontFamily: "Rancho",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}