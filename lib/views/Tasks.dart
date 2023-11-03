
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taskified/consts/textstyle.dart';

Widget taskCard(Function()? onTap, QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTap,
    child: Container(
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
      )
    )
  );
}