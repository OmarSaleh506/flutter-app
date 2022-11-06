// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/screen/home.dart';

class AddTask extends StatelessWidget {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  final Function addTaskCallback;

  AddTask(this.addTaskCallback);

  String? newTaskTitle;

  String? newDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Task')),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: Obx(
                  () => TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                        labelText: 'Enter Title', border: OutlineInputBorder()),
                    onChanged: (newTitle) {
                      newTaskTitle = newTitle;
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.purple.shade100;
                      return Theme.of(context).primaryColor;
                    })),
                    child: Text(
                      'Add Task',
                      style: GoogleFonts.roboto(fontSize: 18),
                    ),
                    onPressed: () {
                      addTaskCallback(newTaskTitle);
                    },
                  ))
            ],
          )),
    );
  }
}
