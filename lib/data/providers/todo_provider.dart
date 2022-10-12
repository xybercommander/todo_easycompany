import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _todoTasks = [];
  List<Map<String, dynamic>> get todoTasks => _todoTasks;

  void addTask(Map<String, dynamic> task) {
    _todoTasks.add(task);
    notifyListeners();
  }
}