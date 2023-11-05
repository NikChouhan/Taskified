import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskified/consts/textstyle.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleCont = TextEditingController();
  TextEditingController descCont = TextEditingController();

  addTaskToFirebase() {}

  Future _addTasks({required String taskName, required String taskDesc}) async {
    DocumentReference docRef =
        await FirebaseFirestore.instance.collection('tasks').add(
      {
        'taskName': taskName,
        'taskDesc': taskDesc,
      },
    );
    String taskId = docRef.id;
    await FirebaseFirestore.instance.collection('tasks').doc(taskId).update(
      {'id': taskId},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal[200],
          title: Text(
            "Add Task",
            style: ourStyle(size: 24, color: Colors.black),
            textAlign: TextAlign.center,
          )),
      body: Container(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: titleCont,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter the Title"),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                child: TextField(
                  controller: descCont,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter the content",
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.teal.shade50;
                        }
                        return Colors.teal.shade200;
                      },
                    )),
                    onPressed: () {
                      final taskName = titleCont.text;
                      final taskDesc = descCont.text;
                      _addTasks(taskName: taskName, taskDesc: taskDesc);

                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: Text(
                      "Add Task",
                      style: GoogleFonts.roboto(fontSize: 15),
                    ),
                  )),
            ],
          )),
    );
  }
}
