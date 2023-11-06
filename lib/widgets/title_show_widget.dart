import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class TitleShowWidget extends StatelessWidget {
  String title;
  String button;
  TitleShowWidget({super.key, required this.title, required this.button});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 150.0,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: kBrandBlack,
              ),
              onPressed: () {},
              child: Text(
                button,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ))
        ],
      ),
    );
  }
}
