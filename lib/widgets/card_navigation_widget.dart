import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class CardNavigationWidget extends StatelessWidget {
  Color color;
  String text;
  IconData icon;
  CardNavigationWidget(
      {Key? key, required this.color, required this.text, required this.icon})
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
            padding: const EdgeInsets.all(30.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_month,
              size: 18.0,
            ),
            const SizedBox(
              width: 20.0,
            ),
            SizedBox(
              width: screenSize.width - 190,
              child: Text(
                "Mi perfil",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: kBrandBlack),
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
