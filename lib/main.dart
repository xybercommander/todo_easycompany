import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_easycompany/data/providers/todo_provider.dart';
import 'package:todo_easycompany/views/add_todo.dart';
import 'package:todo_easycompany/views/splash_screen.dart';
import 'package:todo_easycompany/views/todo_list.dart';

void main() async {  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoProvider(),),        
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'RobotoSlab'
      ),
      home: SplashScreen(),
    );
  }
}