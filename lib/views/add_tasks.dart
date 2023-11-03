import 'package:flutter/material.dart';
import 'package:taskified/consts/textstyle.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal[200],
          title: Text("Add Task", style: ourStyle(
              size: 24,
              color: Colors.black
          ),
            textAlign: TextAlign.center,
          )),
      );
  }
}
