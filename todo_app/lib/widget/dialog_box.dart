import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todo_app/const/colors.dart';

class DialogBox extends StatelessWidget {
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
  });
  final TextEditingController controller;

  VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: tdPClr, borderRadius: BorderRadius.circular(8)),
        height: 200,
        width: 300,
        child: Column(
          children: [
            TextField(
              controller: controller,
              style: TextStyle(color: tdBGClr, fontSize: 16),
              cursorColor: tdBGClr,
              decoration: const InputDecoration(
                  hintText: "add a new task",
                  hintStyle: TextStyle(color: tdBGClr),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: tdBGClr)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: tdBGClr)),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      child: Text(
                        "Add",
                        style: TextStyle(fontSize: 20, color: tdBGClr),
                      ),
                      onPressed: onSave),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 20, color: tdBGClr),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
