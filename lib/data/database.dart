import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  final _myBox = Hive.box("MyBox");

  List toDoList = [];

  // This method will run if this app is opend for first time.
  void createInitialData() {
    toDoList = [
      ["Build App", false],
      ["Do Workout", false],
      ["Drink Chaha", false]
    ];
  }

  // Load data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // Update database

  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
