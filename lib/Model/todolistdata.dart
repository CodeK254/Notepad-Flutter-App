import 'package:hive/hive.dart';

part 'todolistdata.g.dart';

@HiveType(typeId: 1)
class TodoListData extends HiveObject{
  @HiveField(0)
  String? todo;

  @HiveField(1)
  bool? done;

  @HiveField(2)
  DateTime createdAt = DateTime.now();
}