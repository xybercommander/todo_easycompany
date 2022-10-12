import 'package:flutter/cupertino.dart';

class TodoProvider extends ChangeNotifier {
  List<dynamic> _todoTasks = [];
  List<dynamic> get todoTasks => _todoTasks;

  void setTasks(List<dynamic> tasks) {
    _todoTasks = tasks;
    notifyListeners();
  }

  void addTask(Map<String, dynamic> task) {
    _todoTasks.add(task);
    notifyListeners();
  }

  void clearTasks() {
    _todoTasks.clear();
    notifyListeners();
  }
}