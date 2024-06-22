import 'package:flutter/material.dart';
import 'package:try_hive/services/theme/colors.dart';
import '../../Model/todolistdata.dart';
import '../../controllers/todo_controller.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({
    super.key,
    required this.todos,
    required this.index,
    required this.todoController,
  });

  final List<TodoListData> todos;
  final TodoController todoController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.1,
            maxWidth: MediaQuery.of(context).size.width * 0.95,
          ),
          decoration: BoxDecoration(
            color: CustomColors.lightGrey.value,
            borderRadius: BorderRadius.circular(3),
            boxShadow: [
              BoxShadow(
                offset: const Offset(-4, -4),
                color: CustomColors.backgroundColor.value,
                blurRadius: 15,
              ),
              BoxShadow(
                offset: const Offset(4, 4),
                color: CustomColors.grey.value.withOpacity(.7),
                blurRadius: 15,
              ),
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todoController.dateFormat(todos[index].createdAt),
                      style: TextStyle(
                        fontFamily: "Rancho",
                        fontSize: 14,
                        color: CustomColors.grey.value.withOpacity(.75),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                        todos[index].todo.toString(),
                        style: TextStyle(
                          fontFamily: "Rancho",
                          fontSize: 20,
                          color: CustomColors.lightTextColor.value,
                        ),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: Checkbox(
                    value: todos[index].done,
                    onChanged: (val){
                      todos[index].done = val;
                      todoController.removeItem(todos, index);
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}