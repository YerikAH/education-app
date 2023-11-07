import 'package:education/themes/colors.dart';
import 'package:education/widgets/card_page_widget.dart';
import 'package:flutter/material.dart';

class HeaderUserWidget extends StatelessWidget {
  String user;
  HeaderUserWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      width: double.infinity,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
                width: 200.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hola,",
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: kBrandBlack),
                    ),
                    Text(
                      user,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w900,
                          color: kBrandBlack),
                    ),
                  ],
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: kBrandBlack,
                  size: 20.0,
                ))
          ]),
          const SizedBox(
            height: 20.0,
          ),
          Table(
            children: [
              TableRow(children: [
                CardPageWidget(
                    icon: Icons.person_2_outlined,
                    page: "Tú",
                    colorIcon: Colors.purple[300]!,
                    marginRigth: true),
                CardPageWidget(
                  icon: Icons.credit_card_outlined,
                  page: "Carnet",
                  colorIcon: Colors.blue[200]!,
                )
              ]),
              TableRow(children: [
                CardPageWidget(
                    icon: Icons.school_outlined,
                    page: "Comunicados",
                    colorIcon: Colors.orange[300]!,
                    marginRigth: true),
                CardPageWidget(
                  icon: Icons.star_border_rounded,
                  page: "Academico",
                  colorIcon: Colors.red[300]!,
                )
              ])
            ],
          )
        ],
      ),
    );
  }
}
