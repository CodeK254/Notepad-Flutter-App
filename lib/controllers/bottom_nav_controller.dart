import 'package:get/get.dart';

class BottomNavController extends GetxController{
  final toDisplay = 0.obs;
  final searchIn = 0.obs;

  List<String> searchFilter = ["Notes", "Todos"];
}