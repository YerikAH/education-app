import 'package:dotted_border/dotted_border.dart';
import 'package:education/constant/constant.dart';
import 'package:education/screen/routing_screen.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/card_links_widget.dart';
import 'package:education/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksScreen extends StatelessWidget {
  const LinksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBrandWhite,
        appBar: CustomAppBarWidget(
            title: "Enlaces", beforeWidget: const RoutingScreen()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(255),
                        padding: const EdgeInsets.all(1),
                        color: Colors.blue,
                        strokeWidth: 2,
                        strokeCap: StrokeCap.round,
                        child: const CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              AssetImage("assets/splashx4_invert.png"),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text("Colegios Orion",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800)),
                const Text(
                    "El Colegio Orion es una institución educativa que ha estado marcando la diferencia en el campo de la educación durante más de dos décadas.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Uri uri = Constant.urlFacebook;
                            launchUrl(uri,
                                mode: LaunchMode.externalApplication);
                          },
                          icon: const Icon(
                            Icons.facebook,
                            color: kBrandBlack,
                          )),
                      IconButton(
                          onPressed: () {
                            Uri uri = Constant.urlTikTok;
                            launchUrl(uri,
                                mode: LaunchMode.externalApplication);
                          },
                          icon: const Icon(
                            Icons.tiktok_rounded,
                            color: kBrandBlack,
                          )),
                      IconButton(
                          onPressed: () {
                            Uri uri = Constant.urlPhone;
                            launchUrl(uri,
                                mode: LaunchMode.externalApplication);
                          },
                          icon: const Icon(
                            Ionicons.logo_whatsapp,
                            color: kBrandBlack,
                          )),
                      IconButton(
                          onPressed: () {
                            Uri uri = Constant.urlInstagram;
                            launchUrl(uri,
                                mode: LaunchMode.externalApplication);
                          },
                          icon: const Icon(
                            Ionicons.logo_instagram,
                            color: kBrandBlack,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text("plataformas".toUpperCase(),
                    style: TextStyle(
                        letterSpacing: 1.0,
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 20.0,
                ),
                CardLinksWidget(
                  icon: Icons.school_rounded,
                  color: Colors.blueAccent,
                  text: 'Aula virtual',
                  url: Constant.urlAulaVirtual,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CardLinksWidget(
                  icon: Icons.book,
                  color: Colors.blueAccent,
                  text: 'Plataforma virtual',
                  url: Constant.urlSistema,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CardLinksWidget(
                  icon: Icons.notifications_on,
                  color: Colors.blueAccent,
                  text: 'Noticias',
                  url: Constant.urlNoticias,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CardLinksWidget(
                  icon: Icons.web_rounded,
                  color: Colors.blueAccent,
                  text: 'Sitio web',
                  url: Constant.urlSitioWeb,
                ),
              ],
            ),
          ),
        ));
  }
}
