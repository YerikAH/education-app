import 'package:education/screen/home_screen.dart';
import 'package:education/screen/notice_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "NunitoSans",
          useMaterial3: true,
          primaryColor: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
