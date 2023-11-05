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
                child: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter the Title"),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                child: const TextField(
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
                    onPressed: () {},
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
