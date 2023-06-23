import 'package:flutter/material.dart';
import 'package:try_hive/Screens/constants.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Add Todo"),
    );
  }
}