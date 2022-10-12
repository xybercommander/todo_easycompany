import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_easycompany/data/helper/shared_preferences.dart';
import 'package:todo_easycompany/data/providers/todo_provider.dart';
import 'package:todo_easycompany/views/todo_list.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int priority = 0; // 0 -> Low / 1 -> Medium / 2 -> High
  DateTime setDate = DateTime.now();
  DateTime toBeCompletedOn = DateTime.now();
  bool dateChosen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 48, left: 16, right: 16),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_rounded, size: 40,)
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: taskController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,                
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(                  
                    border: InputBorder.none,
                    hintText: 'Add Task',
                    hintStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontFamily: 'RobotoSlab'
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context, 
                      builder: (context) {
                        return Container(
                          height: 380,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Container(
                                height: 300,
                                width: MediaQuery.of(context).size.width,
                                child: CupertinoDatePicker(
                                  onDateTimeChanged: (DateTime pickedDate) {
                                    setState(() {
                                      dateChosen = true;
                                      toBeCompletedOn = pickedDate;
                                    });
                                  },
                                  minimumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
                                  mode: CupertinoDatePickerMode.date,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    dateChosen = true;
                                  });
                                  Navigator.pop(context);
                                },
                                color: Colors.black,
                                child: Text("Done", style: TextStyle(color: Colors.white),),
                              )
                            ],
                          ),
                        );
                      }
                    );
                  },
                  child: Column(  
                    crossAxisAlignment: CrossAxisAlignment.start,                  
                    children: [
                      Text("Choose Date ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[600]),),
                      Row(
                        children: [
                          Text(
                            "${toBeCompletedOn.day} - ${toBeCompletedOn.month} - ${toBeCompletedOn.year}",
                            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8,),
                          Icon(Icons.date_range, color: Colors.grey[700], size: 20,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Choose Priority", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[600]),),
              ),
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          priority = 0;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          color: priority == 0 ? Colors.green : Colors.green[100],
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: Text(
                            "Low !",
                            style: TextStyle(
                              color: priority == 0 ? Colors.white : Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          priority = 1;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          color: priority == 1 ? Colors.yellow[800] : Colors.yellow[100],
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: Text(
                            "Medium !!",
                            style: TextStyle(
                              color: priority == 1 ? Colors.white : Colors.yellow[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          priority = 2;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          color: priority == 2 ? Colors.redAccent : Colors.red[100],
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: Text(
                            "High !!!",
                            style: TextStyle(
                              color: priority == 2 ? Colors.white : Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Write Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[600]),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(                  
                    border: InputBorder.none,
                    hintText: 'Description...',
                    hintStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: MaterialButton(
                    onPressed: () async {
                      Map<String, dynamic> task = {
                        "task": taskController.text,
                        "setDate": setDate.toString(),
                        "toBeCompletedOn": toBeCompletedOn.toString(),
                        "priority": priority.toString(),
                        "description": descriptionController.text,
                        "completed": 0 // 0 -> No / 1 -> Yes
                      };
                      Provider.of<TodoProvider>(context, listen: false).addTask(task);
                      Provider.of<TodoProvider>(context, listen: false).sortTaskByPriority();

                      List<dynamic> todos = await Provider.of<TodoProvider>(context, listen: false).todoTasks;
                      String jsonTodosStringified = jsonEncode(todos);
                      SharedPref().saveTasksSharedPreference(jsonTodosStringified);

                      Navigator.pop(context);
                    },
                    color: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: Text("Add Task", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}