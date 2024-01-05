// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:education/constant/constant.dart';
import 'package:education/helpers/helpers.dart';
import 'package:education/screen/about_screen.dart';
import 'package:education/screen/info_user_screen.dart';
import 'package:education/screen/login_screen.dart';
import 'package:education/screen/routing_screen.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/button_decoration_widget.dart';
import 'package:education/widgets/card_navigation_widget.dart';
import 'package:education/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';
import '../providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    Key? key,
  }) : super(key: key);

  Helpers helper = Helpers();
  @override
  Widget build(BuildContext context) {
    String path = context.watch<UserProvider>().user['data']['imagen'];
    String urlImage = "${Constant.serverImagesUser}$path";
    return Scaffold(
      backgroundColor: kBrandWhite,
      appBar: CustomAppBarWidget(
        title: "Perfil",
        beforeWidget: const RoutingScreen(),
        leadingActive: true,
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(255.0),
                      child: CachedNetworkImage(
                        imageUrl: urlImage,
                        fit: BoxFit.cover,
                        width: 100.0,
                        height: 100.0,
                        placeholder: (context, url) => SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              width: 100.0,
                              height: 100.0,
                              borderRadius:
                                  BorderRadiusDirectional.circular(255.0)),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/error_user.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    helper.toCapitalizeCase(
                        context.watch<UserProvider>().user['data']['nombre']),
                    style: const TextStyle(
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
                    widget: InfoUserScreen(),
                    closeSession: false,
                  ),
                  CardNavigationWidget(
                    color: kBrandBlack,
                    icon: Icons.app_shortcut,
                    text: "Acerca de",
                    widget: const AboutScreen(),
                    closeSession: false,
                  ),
                  CardNavigationWidget(
                    color: kBrandGray,
                    icon: Icons.logout_rounded,
                    text: "Cerrar sesión",
                    isPage: true,
                    widget: const LoginScreen(),
                    closeSession: true,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  ButtonDecorationWidget(
                    icon: Icons.headphones,
                    url: Constant.urlContact,
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
