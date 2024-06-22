import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:try_hive/Model/boxes.dart';
import 'package:try_hive/Model/todolistdata.dart';
import 'package:try_hive/controllers/todo_controller.dart';
import 'package:try_hive/services/theme/colors.dart';

import '../widgets/todo_display.dart';

class TodoDisplayWidget extends StatelessWidget {
  TodoDisplayWidget({super.key});

  final todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<TodoListData>>(
      valueListenable: TodoBoxes.getTodoListData().listenable(), 
      builder: (context, box, _){
        final todos = box.values.toList();
        return todos.isNotEmpty ? ListView.builder(
          key: todoController.listKey,
          itemCount: todos.length,
          itemBuilder: (context, index){
            return TodoListWidget(todos: todos, index: index, todoController: todoController);
          },
        ) : Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "No todos added yet, click the button below to make your first todo.",
              style: TextStyle(
                fontSize: 18,
                color: CustomColors.textColor.value,
                fontFamily: "Rancho",
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    );
  }
}