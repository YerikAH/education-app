import 'package:education/screen/calendar_screen.dart';
import 'package:education/screen/home_screen.dart';
import 'package:education/screen/links_screen.dart';
import 'package:education/screen/login_screen.dart';
import 'package:education/widgets/custom_bottom_navigator.dart';
import 'package:flutter/material.dart';

class RoutingScreen extends StatefulWidget {
  const RoutingScreen({Key? key}) : super(key: key);
  @override
  State<RoutingScreen> createState() => _RoutingScreenState();
}

class _RoutingScreenState extends State<RoutingScreen> {
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const CalendarScreen(),
    const LinksScreen(),
    LoginScreen()
  ];
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: CustomBottomNavigator(
          onItemTapped: onItemTapped, selectedIndex: selectedIndex),
    );
  }
}
