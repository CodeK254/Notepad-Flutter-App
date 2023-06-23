import 'package:hive/hive.dart';
import 'package:try_hive/Model/notepaddata.dart';

class Boxes{
  static Box<NotePadData> getNotePadData() =>
    Hive.box<NotePadData>("note_pad_data");
}