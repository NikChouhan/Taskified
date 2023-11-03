import 'package:cloud_firestore/cloud_firestore.dart';
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
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Tasks").snapshots(),
          builder: (context, AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            return const Text("No data exist. Press the '+' button to add tasks!");
          },
        )
      )
    );
  }
}
