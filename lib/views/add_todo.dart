import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back_rounded, size: 40,),
            TextField(
              controller: taskController,
              // decoration: ,
            ),
            GestureDetector(
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
                            onPressed: () => Navigator.pop(context),
                            color: Colors.black,
                            child: Text("Done", style: TextStyle(color: Colors.white),),
                          )
                        ],
                      ),
                    );
                  }
                );
              },
              child: Row(
                children: [
                  Container(
                    child: dateChosen 
                      ? Text(toBeCompletedOn.toString())
                      : Text("Choose Date")
                  ),
                  Icon(Icons.arrow_drop_down_outlined),
                ],
              ),
            ),
            Text("Choose Priority"),
            ListTile(  
              title: const Text('Low'),  
              leading: Radio(  
                value: 0,  
                groupValue: priority,  
                onChanged: (int? value) { 
                  setState(() {  
                    priority = value!;
                  });
                },  
              ),  
            ),
            ListTile(  
              title: const Text('Medium'),  
              leading: Radio(  
                value: 1,  
                groupValue: priority,  
                onChanged: (int? value) { 
                  setState(() {  
                    priority = value!;
                  });
                },  
              ),  
            ),
            ListTile(  
              title: const Text('High'),  
              leading: Radio(  
                value: 2,  
                groupValue: priority,  
                onChanged: (int? value) { 
                  setState(() {  
                    priority = value!;
                  });
                },  
              ),  
            ),
            Text("Write Description"),
            TextField(
              controller: descriptionController,
              // decoration: ,
            ),
            MaterialButton(
              onPressed: () {
                Map<String, dynamic> task = {
                  "task": taskController.text,
                  "setDate": setDate,
                  "toBeCompletedOn": toBeCompletedOn,
                  "priority": priority,
                  "description": descriptionController.text
                };
                print(task);
              },
              color: Colors.black,
              child: Text("Add Task", style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}