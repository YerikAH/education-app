import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class CardCourseButtonWidget extends StatelessWidget {
  String image;
  String title;
  CardCourseButtonWidget({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(255.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: kBrandWhite,
                  foregroundColor: kBrandWhite,
                  padding: const EdgeInsets.all(20.0),
                  elevation: 2),
              onPressed: () {},
              child: Column(
                children: [
                  Image.asset(image),
                ],
              )),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          title,
          maxLines: 1,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: kBrandBlack),
        ),
        const SizedBox(
          height: 30.0,
        )
      ],
    );
  }
}
