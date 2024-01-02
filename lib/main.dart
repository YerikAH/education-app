import 'package:education/preferences/preferences.dart';
import 'package:education/providers/user_provider.dart';
import 'package:education/screen/login_screen.dart';
import 'package:education/screen/routing_screen.dart';
import 'package:education/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => UserProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Service service = Service();
  Preferences preferences = Preferences();
  bool login = false;

  void isLogin() async {
    String id = await preferences.returnValue();
    Map<dynamic, dynamic> data = await service.getUser(id);
    if (data["status"] == 200) {
      setState(() => login = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    isLogin();
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
      home: login ? const RoutingScreen() : const LoginScreen(),
    );
  }
}
