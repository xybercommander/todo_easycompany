import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo_easycompany/data/helper/shared_preferences.dart';
import 'package:todo_easycompany/data/providers/todo_provider.dart';
import 'package:todo_easycompany/views/todo_list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

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
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TodoList()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: Lottie.asset("assets/animations/cat.json")
            ),
            SizedBox(height: 12,),
            Text("Loading your Tasks", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}