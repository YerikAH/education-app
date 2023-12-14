// ignore_for_file: must_be_immutable

import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class CardNavigationWidget extends StatelessWidget {
  Color color;
  String text;
  IconData icon;
  bool? isPage;
  CardNavigationWidget(
      {Key? key,
      required this.color,
      required this.text,
      required this.icon,
      this.isPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: kBrandWhite,
            foregroundColor: kBrandBlack,
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18.0,
              color: color,
            ),
            const SizedBox(
              width: 20.0,
            ),
            SizedBox(
              width: screenSize.width - 180,
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold, color: color),
              ),
            ),
            isPage == null
                ? Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: color,
                  )
                : const SizedBox(
                    width: 10.0,
                  )
          ],
        ),
      ),
    );
  }
}
