import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_apps/pages/home_page.dart';

void main() async{
  // Initializes Hive with a valid directory in your app files
  await Hive.initFlutter();
  // opening box like create a new table in sql
  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Apps',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
        appBarTheme: const AppBarTheme(
          color: Colors.teal,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 24)
        ),
        useMaterial3: true,
      ),
      home: const HomePage()
    );
  }
}
