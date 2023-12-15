import 'package:education/screen/one_notice_screen.dart';
import 'package:education/screen/routing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colegio Orion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "NunitoSans",
          useMaterial3: true,
          primaryColor: Colors.blue,
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.blue,
              selectionColor: Colors.blue[100],
              selectionHandleColor: Colors.blue)),
      home: const OneNoticeScreen(),
    );
  }
}
