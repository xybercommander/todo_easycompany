import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:todo_easycompany/data/helper/shared_preferences.dart';

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

  void completeTask(int index) {
    Map<String, dynamic> task = _todoTasks.elementAt(index);
    task['completed'] = 1;
    SharedPref().saveTasksSharedPreference(jsonEncode(_todoTasks));
    notifyListeners();
  }

  void unCompleteTask(int index) {
    Map<String, dynamic> task = _todoTasks.elementAt(index);
    task['completed'] = 0;
    SharedPref().saveTasksSharedPreference(jsonEncode(_todoTasks));
    notifyListeners();
  }

  void sortTaskByPriority() {
    _todoTasks.sort(((a, b) => int.parse(b['priority'].toString()).compareTo(int.parse(a['priority'].toString()))));    
    notifyListeners();
  }

  void removeTask(int index) {
    _todoTasks.removeAt(index);
    notifyListeners();
  }

  void clearTasks() {
    _todoTasks.clear();
    notifyListeners();
  }
}