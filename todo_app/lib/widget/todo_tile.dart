import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todo_app/const/colors.dart';

class TodoTile extends StatelessWidget {
  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskComplete,
      required this.onChanged, required this.onDeleted});
  final String taskName;
  final bool taskComplete;
  Function(bool?)? onChanged;
  VoidCallback onDeleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: tdPClr.withOpacity(0.5),
        leading: Transform.scale(
          scale: 1.3,
          child: Checkbox(
            splashRadius: 50,
            checkColor: Colors.white,
            activeColor: tdPClr,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            value: taskComplete,
            onChanged: onChanged,
          ),
        ),
        title: Text(
          taskName,
          style: TextStyle(
              decoration: taskComplete
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              letterSpacing: 1,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        trailing: Container(
          height: 45,
          width: 50,
          decoration: BoxDecoration(
              color: tdPClr, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            onPressed: onDeleted,
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
