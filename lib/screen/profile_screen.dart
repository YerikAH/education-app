import 'package:dotted_border/dotted_border.dart';
import 'package:education/screen/about_screen.dart';
import 'package:education/screen/info_user_screen.dart';
import 'package:education/screen/routing_screen.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/button_decoration_widget.dart';
import 'package:education/widgets/card_navigation_widget.dart';
import 'package:education/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandWhite,
      appBar: CustomAppBarWidget(
        title: "Perfil",
        beforeWidget: const RoutingScreen(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(255),
                    padding: const EdgeInsets.all(6),
                    color: Colors.blue,
                    strokeWidth: 2,
                    dashPattern: const [8, 8],
                    strokeCap: StrokeCap.round,
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/avatar_test.jpeg"),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Jorge Paytan",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  const Text(
                    "Estudiante",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Descripción general",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: kBrandBlack,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CardNavigationWidget(
                    color: kBrandBlack,
                    icon: Icons.people_alt_rounded,
                    text: "Datos personales",
                    widget: const InfoUserScreen(),
                  ),
                  CardNavigationWidget(
                    color: kBrandBlack,
                    icon: Icons.settings,
                    text: "Preferencia",
                    widget: const RoutingScreen(),
                  ),
                  CardNavigationWidget(
                    color: kBrandBlack,
                    icon: Icons.app_shortcut,
                    text: "Acerca de",
                    widget: const AboutScreen(),
                  ),
                  CardNavigationWidget(
                    color: kBrandGray,
                    icon: Icons.logout_rounded,
                    text: "Cerrar sesión",
                    isPage: true,
                    widget: const RoutingScreen(),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  ButtonDecorationWidget(
                    icon: Icons.headphones,
                    text: '¿Como ponemos ayudarte?',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
