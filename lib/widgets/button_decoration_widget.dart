// ignore_for_file: must_be_immutable

import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class ButtonDecorationWidget extends StatelessWidget {
  IconData icon;
  String text;
  ButtonDecorationWidget({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[50],
          foregroundColor: Colors.blue[100],
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        onPressed: () {},
        child: Row(children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            text,
            style: const TextStyle(
                color: kBrandBlack,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          )
        ]),
      ),
    );
  }
}
