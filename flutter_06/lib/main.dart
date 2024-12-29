import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import './bai_1/ex1.dart';
// import './bai_2/ex2.dart';
// import 'bai_3/ex3.dart';

import 'screens/todo_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreen(),
    );
  }
}
