import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";
import "package:screenshot/screenshot.dart";
import "package:try_hive/model/boxes.dart";
import "package:try_hive/model/notepaddata.dart";
import "package:try_hive/model/todolistdata.dart";

class TodoController extends GetxController with GetTickerProviderStateMixin{
  final mybox = TodoBoxes.getTodoListData();
  final notesBox = Boxes.getNotePadData();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final listKey = GlobalKey<AnimatedListState>(); 
  final changed = false.obs;
  final todisplay = 0.obs;
  final selected = <NotePadData>[].obs;
  final ScreenshotController screenshotController = ScreenshotController();
  RxBool loading = false.obs;

  void addToSelected(NotePadData data){
    List<NotePadData> found = selected.where((p0) => p0.key == data.key).toList();
    if(found.isEmpty){
      selected.add(data);
    } else {
      selected.removeWhere((element) => element.key == data.key);
    }
  }

  bool isPresent(int key){
    List<NotePadData> data = selected.where((p0) => p0.key == key).toList();
    return data.isEmpty;
  }

  void deleteSelected(){
    mybox.delete(3);
    for(NotePadData data in selected){
      notesBox.delete(data.key);
    }
    selected.value = [];
  }

  void addTodo(String todo, bool done){
    TodoListData todoListData = TodoListData();
    todoListData.createdAt = DateTime.now();
    todoListData.todo = todo;
    todoListData.done = done;
    mybox.add(
      todoListData
    );
  }

  String dateFormat(DateTime dateTime){
    String dateFormat = DateFormat.yMMMMd("en_US").format(dateTime);
    return dateFormat;
  }

  void removeItem(List<TodoListData> data, int index) async {
    await Future.delayed(const Duration(seconds: 1));
    data[index].delete();
  }

  static const IconData check = IconData(0xe156, fontFamily: 'MaterialIcons');

  final notedata = <NotePadData>[].obs;
  final todos = <TodoListData>[].obs;

  void setNotes(){
    notedata.value = notesBox.values.toList();
  }

  void setTodos(){
    todos.value = mybox.values.toList();
  }

  Animation? swipeRightAnimation;
  AnimationController? swipeRightAnimationController;

  @override
  void onInit() {
    swipeRightAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    swipeRightAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(10, 0),
    ).animate(CurvedAnimation(parent: swipeRightAnimationController!, curve: Curves.easeOut));

    // swipeRightAnimationController!..reset()..forward();
    setNotes();
    setTodos();
    super.onInit();
  }
}