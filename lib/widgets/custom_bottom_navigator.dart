import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigator extends StatelessWidget {
  const CustomBottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.blue,
      backgroundColor: kBrandWhite,
      unselectedItemColor: Colors.black38,
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
