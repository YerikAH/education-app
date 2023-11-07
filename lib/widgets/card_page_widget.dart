import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class CardPageWidget extends StatelessWidget {
  IconData icon;
  String page;
  Color colorIcon;
  bool? marginRigth;
  CardPageWidget(
      {super.key,
      required this.icon,
      required this.page,
      required this.colorIcon,
      this.marginRigth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 85.0,
      margin: marginRigth == null
          ? const EdgeInsets.only(bottom: 10.0)
          : const EdgeInsets.only(bottom: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: kBrandWhite,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: kBrandBlack,
            backgroundColor: kBrandWhite,
            elevation: 3,
            shadowColor: Colors.blue[50],
            padding: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        onPressed: () {},
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: colorIcon),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                page,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w800,
                    color: kBrandGray),
              )
            ],
          ),
        ),
      ),
    );
  }
}
