import 'package:flutter/material.dart';
import 'package:sayaaratukum/screens/home/home.dart';
import 'package:sayaaratukum/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeApp.light,
      darkTheme: ThemeApp.dark,
      home: const  HomeScreen(),
    );
  }
}
