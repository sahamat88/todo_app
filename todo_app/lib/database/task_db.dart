import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  final myBox = Hive.box("myBox");

  List todoList = [];

  demoData() {
     todoList = [
      ["Welcome to Task!", false],
      [" I want to build my own business.", false],
      [" I want to be my own boss.", false],
    ];
  }

  loadFromDatabase() {
    todoList = myBox.get("TODOLIST");
  }

  updateDatabase() {
    myBox.put("TODOLIST", todoList);
  }
}
