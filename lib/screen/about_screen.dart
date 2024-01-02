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
          title: "Acerca de",
          beforeWidget: ProfileScreen(),
          leadingActive: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "TID - Tecnología, informática y desarrollo",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      color: kBrandBlack),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 250.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset("assets/tid-poster.jpg",
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Esta aplicación móvil, concebida y desarrollada por TID, representa un notable avance en la convergencia de la innovación tecnológica y las necesidades prácticas de los usuarios modernos. TID, con su compromiso inquebrantable con la excelencia y la vanguardia, ha dado vida a una herramienta que va más allá de las expectativas convencionales.",
                  style: TextStyle(color: kBrandGray),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "TID, una empresa especializada en soluciones informáticas, a través del análisis y elaboración de software necesarios para todo tipo de negocios. Nuestros principales ámbitos de desarrollo, y que aún mantenemos, fueron: Gestión comercial en general, tiendas virtuales de comercialización, webs designados para todos los sistemas del mercado.",
                  style: TextStyle(color: kBrandGray),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ));
  }
}
