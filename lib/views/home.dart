import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taskified/consts/textstyle.dart';
import 'package:taskified/views/add_tasks.dart';
import 'package:taskified/views/tasks.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final fireStore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AddTask()));
          },
          backgroundColor: Colors.teal[50],
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
            backgroundColor: Colors.teal[200],
            leading: const Icon(Icons.task_alt_rounded, color: Colors.black),
            title: Text(
              "Taskified",
              style: ourStyle(size: 24, color: Colors.black),
              textAlign: TextAlign.center,
            )),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<QuerySnapshot>(
                stream: fireStore.collection("tasks").snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  var dat = snapshot.data;
                  if (snapshot.hasData && snapshot.data != null) {
                    return Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: StreamBuilder<QuerySnapshot>(
                            stream: fireStore.collection('tasks').snapshots(),
                            builder: (context, snapshot) {
                              if (dat == null) {
                                return const Text("No data");
                              } else {
                                return ListView(
                                  children: dat!.docs
                                      .map<Widget>((DocumentSnapshot document) {
                                    Map<String, dynamic> data = document.data()!
                                        as Map<String, dynamic>;
                                    return Container(
                                        height: 60,
                                        margin:
                                            const EdgeInsets.only(bottom: 1.0),
                                        child: taskLayout(data['taskName'],
                                            data['taskDesc']));
                                  }).toList(),
                                );
                              }
                            }));
                  }
                  return const Text(
                      "No data exist. Press the '+' button to add tasks!");
                })));
  }
}
