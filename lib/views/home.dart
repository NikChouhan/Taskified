import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taskified/consts/textstyle.dart';
import 'package:taskified/views/add_tasks.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask()));
        },
        backgroundColor: Colors.teal[50],
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
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
