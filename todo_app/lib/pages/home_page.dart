import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/const/colors.dart';
import 'package:todo_app/database/task_db.dart';
import 'package:todo_app/widget/dialog_box.dart';
import 'package:todo_app/widget/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TodoDataBase db = TodoDataBase();
  final myBox = Hive.box("myBox");

  TextEditingController taskController = TextEditingController();

  changeCheckedBox(bool value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];

      db.updateDatabase();
    });
  }

  taskDialogBox() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: taskController,
            onSave: () {
              saveTask();
            },
          );
        });
  }

  saveTask() {
    setState(() {
      db.todoList.add([taskController.text, false]);
      Navigator.pop(context);
      taskController.clear();
    });
    db.updateDatabase();
  }

  deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  void initState() {
    if (myBox.get("TODOLIST") == null) {
      db.demoData();
    } else {
      db.loadFromDatabase();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGClr,
      appBar: AppBar(
        title: const Text("ToDo"),
        centerTitle: true,
        backgroundColor: tdPClr,
        elevation: 0,
      ),
      body: db.todoList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/no-task.png",
                      height: 150, color: tdPClr.withOpacity(0.4)),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "No task here yet",
                    style:
                        TextStyle(fontSize: 25, color: tdPClr.withOpacity(0.4)),
                  )
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: db.todoList.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: db.todoList[index][0],
                  taskComplete: db.todoList[index][1],
                  onChanged: (value) {
                    changeCheckedBox(db.todoList[index][1], index);
                  },
                  onDeleted: () {
                    deleteTask(index);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: tdPClr,
          onPressed: () {
            taskDialogBox();
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
