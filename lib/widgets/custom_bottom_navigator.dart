import 'package:education/screen/calendar_screen.dart';
import 'package:education/screen/home_screen.dart';
import 'package:education/screen/login_screen.dart';
import 'package:education/screen/notice_screen.dart';
import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigator extends StatelessWidget {
  Function onItemTapped;
  int selectedIndex;
  CustomBottomNavigator(
      {super.key, required this.onItemTapped, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.blue,
      backgroundColor: kBrandWhite,
      unselectedItemColor: Colors.black38,
      currentIndex: selectedIndex,
      onTap: (idx) => onItemTapped(idx),
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
