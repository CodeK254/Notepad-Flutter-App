import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_hive/Screens/constants.dart';
import 'package:try_hive/Screens/notes.dart';
import 'package:try_hive/Screens/todo/todos.dart';
import 'package:try_hive/controllers/bottom_nav_controller.dart';
import 'package:try_hive/controllers/todo_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final bottomNavController = Get.put(BottomNavController());
  final todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.grey.shade100,
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage("assets/launcher.png"),
                  ),
                ),
              ),
              ...List.generate(
                drawerItems.length,
                (index) => Column(
                  children: [
                    ListTile(
                      onTap: (){
                        Navigator.pushNamed(context, drawerItems[index]["url"]);
                      },
                      tileColor: Colors.white,
                      title: Text(
                        drawerItems[index]["label"],
                        style: TextStyle(
                          fontFamily: "Rancho",
                          fontSize: 20,
                          color: Colors.grey[700],
                          letterSpacing: 1.2,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[900],
                        size: 13,
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: bottomNavController.toDisplay.value == 0 ? AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.brown[900],
            size: 25,
          ),
          title: const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "NotePad",
              style: TextStyle(
                fontFamily: "Rancho",
                fontSize: 32,
                letterSpacing: 1.2,
                color: Colors.black,
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
                  Get.toNamed("/search");
                },
                child: const Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ) : myAppBar("Todo List"),
        body: bottomNavController.toDisplay.value == 0 ? NotesDisplayWidget(todoController: todoController) : TodoDisplayWidget(),
        bottomNavigationBar: BottomNavigationBarTheme(
          data: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: IconThemeData(
              size: 28,
              color: Colors.black,
            ),
            unselectedIconTheme: IconThemeData(
              size: 25,
              color: Colors.grey,
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
          backgroundColor: Colors.black,
          onPressed: (){
            if(bottomNavController.toDisplay.value == 0){
              Get.toNamed("/input");
            } else {
              showDialogBox(context);
            }
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
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
            fontSize: 16,
            color: Colors.grey.shade700,
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
                keyboardAppearance: Brightness.dark,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 3),
                  hintText: "Type your todo here...",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
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
                    fontSize: 15,
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  if(todoController.formKey.currentState!.validate()){
                    todoController.addItem(todoController.mybox.values.toList().length);
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
                    fontSize: 15,
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