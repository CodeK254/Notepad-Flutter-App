import 'package:flutter/material.dart';
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
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(10, 0),
      ).animate(CurvedAnimation(parent: todoController.swipeRightAnimationController!, curve: Curves.easeOut)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.1,
              maxWidth: MediaQuery.of(context).size.width * 0.95,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        todoController.dateFormat(todos[index].createdAt),
                        style: TextStyle(
                          fontFamily: "Rancho",
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          todos[index].todo.toString(),
                          style: TextStyle(
                            fontFamily: "Rancho",
                            fontSize: 18,
                            color: Colors.grey.shade800,
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }
}