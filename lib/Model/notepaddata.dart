import 'package:hive/hive.dart';

part 'notepaddata.g.dart';

@HiveType(typeId: 0)
class NotePadData extends HiveObject{
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? note;

  @HiveField(2)
  DateTime createdAt = DateTime.now();
}

