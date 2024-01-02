// ignore_for_file: must_be_immutable

import 'package:education/helpers/helpers.dart';
import 'package:education/screen/one_notice_screen.dart';
import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class CardNoticeWidget extends StatelessWidget {
  String title;
  String text;
  String categoria;
  String id;
  String date;
  CardNoticeWidget(
      {Key? key,
      required this.text,
      required this.title,
      required this.categoria,
      required this.date,
      required this.id})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    Helpers helper = Helpers();
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OneNoticeScreen(
                        id: id,
                        titleNav: title,
                      )));
        },
        style: TextButton.styleFrom(
            backgroundColor: kBrandWhite,
            foregroundColor: kBrandBlack,
            shadowColor: Colors.blue[50],
            padding: const EdgeInsets.all(0),
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        child: Row(
          children: [
            Container(
              width: 10.0,
              height: 20.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(255),
                    bottomRight: Radius.circular(255)),
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            const Icon(
              Icons.calendar_month,
              size: 18.0,
            ),
            SizedBox(
              width: screenSize.width - 150,
              child: Container(
                padding: const EdgeInsets.only(
                    bottom: 20.0, top: 20.0, left: 10.0, right: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: kBrandBlack),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      helper.removeHtmlTag(text),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          color: kBrandGray,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      date,
                      style:
                          const TextStyle(fontSize: 12.0, color: kBrandBlack),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
