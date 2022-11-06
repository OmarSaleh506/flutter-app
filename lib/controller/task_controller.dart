import 'package:get/get.dart';
import 'package:todo/models/task.dart';

class TaskController extends GetxController {
    final Rx<List<Task>> _myTask = Rx<List<Task>>([]);

  List<Task> get myTask => _myTask.value;

  void addTask(String newTaskTitle) {
    myTask.add(Task(name: newTaskTitle));
    // notifyListeners();
  }

  void updateTask(Task task) {
    task.doneChange();
    // notifyListeners();
  }

  void deleteTask(Task task) {
    myTask.remove(task);
    // notifyListeners();
  }
}
