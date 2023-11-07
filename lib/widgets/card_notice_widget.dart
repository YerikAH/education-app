import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class CardNoticeWidget extends StatelessWidget {
  String title;
  String text;
  CardNoticeWidget({Key? key, required this.text, required this.title})
      : super(
          key: key,
        );

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
            SizedBox(
              width: screenSize.width - 130,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
                      text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          color: kBrandGray,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
