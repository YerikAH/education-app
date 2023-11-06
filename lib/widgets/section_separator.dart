import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class SectionSeparator extends StatelessWidget {
  String title;
  String text;
  String button;
  SectionSeparator(
      {super.key,
      required this.title,
      required this.text,
      required this.button});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 0.5,
          color: Colors.black12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          color: kBrandBlack,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(text,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal))
                  ],
                ),
              ),
              SizedBox(
                width: 110.0,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: kBrandWhite,
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(button,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 0.5,
          color: Colors.black12,
        )
      ]),
    );
  }
}
