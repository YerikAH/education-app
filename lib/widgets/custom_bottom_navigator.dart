// ignore_for_file: must_be_immutable

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
            icon: Icon(Icons.link_rounded), label: "Enlaces"),
      ],
    );
  }
}
