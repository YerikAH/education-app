import 'package:education/screen/profile_screen.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBrandWhite,
        appBar: CustomAppBarWidget(
            title: "Acerca de", beforeWidget: const ProfileScreen()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 250.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset("assets/tid-poster.jpg",
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  "TID - Tecnología, informática y desarrollo",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      color: kBrandBlack),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Text(
                  "TID, una empresa especializada en soluciones informáticas, a través del análisis y elaboración de software necesarios para todo tipo de negocios. Nuestros principales ámbitos de desarrollo, y que aún mantenemos, fueron: Gestión comercial en general, tiendas virtuales de comercialización, webs designados para todos los sistemas del mercado.",
                  style: TextStyle(color: kBrandGray),
                )
              ],
            ),
          ),
        ));
  }
}
