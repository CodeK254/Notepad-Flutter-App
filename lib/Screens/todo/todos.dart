import 'package:flutter/material.dart';
import 'package:try_hive/Screens/constants.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  navigate(){
    Navigator.pushNamed(context, "/add_todo");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Todo List"),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          navigate();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}