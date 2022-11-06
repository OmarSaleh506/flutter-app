// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo/screen/add_task.dart';
import '../controller/task_controller.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    final TaskController _taskController = Get.find<TaskController>();

    String? newTaskTitle;
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        child: TasksList(_taskController.myTask),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTask((newTaskTitle) {
                setState(() {
                  _taskController.myTask.add(Task(name: newTaskTitle));
                  Navigator.pop(context);
                });
              }),
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
