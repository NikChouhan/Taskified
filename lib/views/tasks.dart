import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taskified/consts/textstyle.dart';

Widget taskCard({required String title, required String taskDesc}) {
  return InkWell(
      child: Container(
          margin: const EdgeInsets.only(bottom: 6.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.teal[50]),
          child: taskLayout(title, taskDesc)));
}

ListTile taskLayout(String title, String taskDesc) {
  return ListTile(
          title: Text(
            title,
            style: ourStyle(color: Colors.green[900], size: 20),
          ),
          subtitle: Text(
            taskDesc,
            style: ourStyle(color: Colors.lightBlue[30], size: 16),
          ),
          leading: Icon(
            Icons.check_box_rounded,
            size: 30,
            color: Colors.teal[700],
          ),
        );
}
