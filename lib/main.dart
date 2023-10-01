import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_to_do/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //init hive async
  await Hive.initFlutter();
  // Open box
  await Hive.openBox("MyBox");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
