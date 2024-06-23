import 'package:hive/hive.dart';
import 'package:try_hive/model/notepaddata.dart';
import 'package:try_hive/model/todolistdata.dart';

class Boxes{
  static Box<NotePadData> getNotePadData() =>
    Hive.box<NotePadData>("note_pad_data");
}

class TodoBoxes{
  static Box<TodoListData> getTodoListData() =>
    Hive.box<TodoListData>("todo_list_data");
}