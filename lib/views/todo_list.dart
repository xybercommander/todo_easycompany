import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_easycompany/data/providers/todo_provider.dart';
import 'package:todo_easycompany/data/providers/user_provider.dart';
import 'package:todo_easycompany/views/add_todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<TodoProvider, UserProvider>(
        builder: (context, TodoProvider todoProvider, UserProvider userProvider, _) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: todoProvider.todoTasks.length + 1,
              itemBuilder: (context, index) {
                if(index == 0) {
                  return Container(
                    child: Text(
                      "Hi ${userProvider.name}!\nThese are your Todos",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  return ListTile(
                    title: Text(todoProvider.todoTasks[index - 1]['task']),
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