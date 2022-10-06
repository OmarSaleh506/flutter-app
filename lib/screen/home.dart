import 'package:flutter/material.dart';
import 'package:todo/screen/add_task.dart';
import '../moodels/task.dart';
import '../widgets/tasks_list.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
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
        child: TasksList(tasks),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTask((newTaskTitle) {
                setState(() {
                  tasks.add(Task(name: newTaskTitle));
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
