import 'package:education/screen/calendar_screen.dart';
import 'package:education/screen/home_screen.dart';
import 'package:education/screen/login_screen.dart';
import 'package:education/screen/notice_screen.dart';
import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigator extends StatefulWidget {
  const CustomBottomNavigator({super.key});

  @override
  State<CustomBottomNavigator> createState() => _CustomBottomNavigatorState();
}

class _CustomBottomNavigatorState extends State<CustomBottomNavigator> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    CalendarScreen(),
    const NoticeScreen(),
    LoginScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => _widgetOptions[_selectedIndex]));
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.blue,
      backgroundColor: kBrandWhite,
      unselectedItemColor: Colors.black38,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), label: "Inicio"),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined), label: "Calendario"),
        BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined), label: "Compañeros"),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined), label: "Ajustes"),
      ],
    );
  }
}
