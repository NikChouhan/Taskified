import 'package:flutter/material.dart';
import 'package:taskified/consts/textstyle.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        leading: const Icon(Icons.task_alt_rounded, color: Colors.black),
        title: Text("Taskified", style: ourStyle(
          size: 24,
          color: Colors.black
        ),
          textAlign: TextAlign.center,
        )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 50,
            itemBuilder: (context, index){
          return Container(
            margin: const EdgeInsets.only(bottom: 6.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
            color: Colors.teal[50]),
              child: ListTile(
                title: Text("Task Heading",
                  style: ourStyle(color: Colors.green[900], size: 20),
                  ),
                subtitle: Text("Task Description",
                  style: ourStyle(color: Colors.lightBlue[30], size: 16),
                ),
                leading: Icon(Icons.check_box_rounded, size: 30,
                              color: Colors.teal[700],),
          ));
        }),
      )
    );
  }
}
