import 'package:flutter/material.dart';
import 'package:post_api/screens/todolistscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple.shade200,
          foregroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black87),
          titleMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      home: MyHomeScreen(),
    );
  }
}
