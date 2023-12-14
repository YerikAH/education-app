// ignore_for_file: must_be_immutable

import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class CardCalendarWidget extends StatelessWidget {
  String title;
  String time;
  String teacher;
  CardCalendarWidget(
      {Key? key,
      required this.title,
      required this.time,
      required this.teacher})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 7.0),
      width: double.infinity,
      padding: const EdgeInsets.only(
          bottom: 5.0, left: 20.0, right: 20.0, top: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.blue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 80.0,
                  height: 80.0,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(255.0)),
                  child: Image.asset("assets/atomo.png")),
              const SizedBox(
                width: 25.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18.0,
                        color: kBrandWhite,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    teacher,
                    style: const TextStyle(
                        fontSize: 16.0,
                        color: kBrandWhite,
                        fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
          Text(
            time,
            textAlign: TextAlign.right,
            style: const TextStyle(
                fontSize: 16.0,
                color: kBrandWhite,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
