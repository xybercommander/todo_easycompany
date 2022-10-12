import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_easycompany/data/helper/shared_preferences.dart';
import 'package:todo_easycompany/data/providers/todo_provider.dart';
import 'package:todo_easycompany/views/add_todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  getTasks() async {
    String? myTasks = await SharedPref().getTasksSharedPreference();
    var decodedTasks = jsonDecode(myTasks!);
    Provider.of<TodoProvider>(context, listen: false).setTasks(decodedTasks);
    setState(() {});
  }

  @override
  void initState() {    
    super.initState();
    getTasks();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoProvider>(
        builder: (context, TodoProvider todoProvider, _) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: todoProvider.todoTasks.length + 1,
              itemBuilder: (context, index) {
                if(index == 0) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Hi! These are your Todos",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  );
                } else {                  
                  // return ListTile(
                  //   title: Text(todoProvider.todoTasks[index - 1]['task']),
                  // );
                  return Stack(
                    children: [
                      Container(                        
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: BoxDecoration(
                          color: int.parse(todoProvider.todoTasks[index - 1]['priority'].toString()) == 0
                              ? Colors.green
                              : int.parse(todoProvider.todoTasks[index - 1]['priority'].toString()) == 1
                                  ? Colors.yellow[800]
                                  : Colors.redAccent,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        padding: EdgeInsets.only(right: 16),
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: todoProvider.todoTasks[index - 1]['completed'] == 0 ? false : true,
                              onChanged: (val) {
                                if(todoProvider.todoTasks[index - 1]['completed'] == 0) {
                                  todoProvider.completeTask(index - 1);
                                } else {
                                  todoProvider.unCompleteTask(index - 1);
                                }
                              },
                              fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return Colors.black;
                                }
                                return Colors.black;
                              })
                            ),
                            Text(
                              todoProvider.todoTasks[index - 1]['task'],                          
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: todoProvider.todoTasks[index - 1]['completed'] == 0
                                ? TextDecoration.none
                                : TextDecoration.lineThrough
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: int.parse(todoProvider.todoTasks[index - 1]['priority'].toString()) == 0
                                  ? Text("!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),)
                                  : int.parse(todoProvider.todoTasks[index - 1]['priority'].toString()) == 1
                                      ? Text("! !", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.yellow[800]),)
                                      : Text("! ! !", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.redAccent),)
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }             
              }
            ),
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodo()));
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}