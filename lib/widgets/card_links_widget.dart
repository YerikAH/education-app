// ignore_for_file: must_be_immutable

import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardLinksWidget extends StatelessWidget {
  IconData icon;
  Color color;
  String text;
  Uri url;
  CardLinksWidget(
      {Key? key,
      required this.url,
      required this.icon,
      required this.color,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          launchUrl(url, mode: LaunchMode.externalApplication);
        },
        style: ElevatedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 243, 243, 243),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            foregroundColor: Colors.blue[100]),
        child: ListTile(
          leading: Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(255),
            ),
            child: Icon(
              icon,
              size: 15,
              color: kBrandWhite,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_rounded,
          ),
          title: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: kBrandBlack, fontWeight: FontWeight.w700),
          ),
        ));
  }
}
