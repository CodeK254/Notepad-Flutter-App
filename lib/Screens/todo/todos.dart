import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:try_hive/Model/boxes.dart';
import 'package:try_hive/Model/todolistdata.dart';
import 'package:try_hive/controllers/todo_controller.dart';

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
        return AnimatedList(
          key: todoController.listKey,
          initialItemCount: todos.length,
          itemBuilder: (context, index, animation){
            return TodoListWidget(todos: todos, index: index, todoController: todoController);
          },
        );
      }
    );
  }
}