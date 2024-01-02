// ignore_for_file: must_be_immutable

import 'package:education/model/rol_model.dart';
import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class CardCourseWidget extends StatefulWidget {
  String title;
  String text;
  String date;
  String hour;
  String rol;
  CardCourseWidget(
      {super.key,
      required this.title,
      required this.text,
      required this.date,
      required this.hour,
      required this.rol});

  @override
  State<CardCourseWidget> createState() => _CardCourseWidgetState();
}

class _CardCourseWidgetState extends State<CardCourseWidget> {
  RolModel rolModel = RolModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.0,
      margin: const EdgeInsets.only(right: 20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: rolModel.selectColorByRol(widget.rol)[0],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 70,
              height: 70,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(255.0),
                color: kBrandWhite,
              ),
              child: Image.asset(
                rolModel.selectImageByRol(widget.rol),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 55.0,
                  child: Badge(
                    backgroundColor: rolModel.selectColorByRol(widget.rol)[1],
                    label: Text(widget.date, overflow: TextOverflow.ellipsis),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                SizedBox(
                  width: 55.0,
                  child: Badge(
                    backgroundColor: rolModel.selectColorByRol(widget.rol)[1],
                    label: Text(
                      widget.hour,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w800, color: kBrandWhite),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          widget.text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: kBrandWhite,
          ),
        )
      ]),
    );
  }
}
