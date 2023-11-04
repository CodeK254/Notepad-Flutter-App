# Notepad App

A Notepad Android application with todo-list additional function. Simple to use UI made all with flutter.

## Notepad
<div id="notepad">
<span>
<img src="assets/app/notepad.png" height="700" width="360">
<img src="assets/app/edit_note.png" height="700" width="360">
</span>
<hr/>
<span>
<img src="assets/app/edit_note.png" height="700" width="360">
<img src="assets/app/search_in_notepad.png" height="700" width="360"> 
</span>
</div>

## Todolist
<div id="notepad">
<span>
<img src="assets/app/todolist.png" height="700" width="360">
<img src="assets/app/add_todo.png" height="700" width="360">
</span>
</div>
<hr/>
<div id="notepad2">
<span>
<img src="assets/app/search_in_todo.png" height="700" width="360">
<img src="assets/app/search.png" height="700" width="360">
</span>
</div>

### Dependencies
***
Here are the dependencies used in the development and success of the v1.0.0 of this application.
```
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  google_fonts: ^3.0.1
  fluttertoast: ^8.2.2
  shared_preferences: ^2.2.2
  flutter_native_splash: 
  flutter_launcher_icons: 
  # build_runner: ^2.4.6
  get: ^4.6.6
  flutter_animate: ^4.2.0+1
  date_format: ^2.0.7
  intl: ^0.18.1
```

### Hice Local Storage
***

Use of hive local storage, and configuration to enhance hive-objects storage.
Code is as given below.
```
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
```

and a model to fetch objects from the box.

```
import 'package:hive/hive.dart';
import 'package:try_hive/Model/notepaddata.dart';

class Boxes{
  static Box<NotePadData> getNotePadData() =>
    Hive.box<NotePadData>("note_pad_data");
}
```