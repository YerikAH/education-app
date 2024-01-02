import 'package:education/constant/constant.dart';
import 'package:education/helpers/helpers.dart';
import 'package:education/providers/user_provider.dart';
import 'package:education/screen/routing_screen.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/card_current_section_widget.dart';
import 'package:education/widgets/card_rating_widget.dart';
import 'package:education/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RatingsScreen extends StatelessWidget {
  const RatingsScreen({Key? key}) : super(key: key);

  static const lista = [
    {
      "rol": "ciencias",
      "profesor": "María González",
      "curso": "Física Cuántica",
      "nota": "18.75",
      "tipo": "ANUAL"
    },
    {
      "rol": "ciencias",
      "profesor": "Carlos Rodríguez",
      "curso": "Biología Molecular",
      "nota": "20.00",
      "tipo": "SEMESTRAL"
    },
    {
      "rol": "ciencias",
      "profesor": "Ana Sánchez",
      "curso": "Química Orgánica",
      "nota": "11.89",
      "tipo": "ANUAL"
    },
    {
      "rol": "ciencias",
      "profesor": "Juan Martínez",
      "curso": "Matemáticas Avanzadas",
      "nota": "09.45",
      "tipo": "SEMESTRAL"
    },
    {
      "rol": "ciencias",
      "profesor": "Laura Pérez",
      "curso": "Astrofísica",
      "nota": "16.78",
      "tipo": "ANUAL"
    },
    {
      "rol": "ciencias",
      "profesor": "Pedro Gómez",
      "curso": "Estadísticas",
      "nota": "20.00",
      "tipo": "SEMESTRAL"
    },
    {
      "rol": "ciencias",
      "profesor": "Isabel López",
      "curso": "Geología",
      "nota": "18.92",
      "tipo": "ANUAL"
    }
  ];

  static const rating = {
    "section": "ATD",
    "number": "845",
    "image": "assets/avatar_test.jpeg",
    "student": "HARVEY YERIK",
    "grado": "QUINTO SECUNDARIA",
    "nota": "15.0"
  };
  @override
  Widget build(BuildContext context) {
    Helpers helper = Helpers();
    Map user = context.watch<UserProvider>().user['data'];
    List ratingData = context.watch<UserProvider>().ratings['data'];
    List ratings = helper.calcularPromedioPonderadoPorCurso(ratingData);
    String ratingsFinal = "${helper.calcularPromedioPonderado(ratings)}";
    String path = context.watch<UserProvider>().user['data']['imagen'];
    String urlImage = "${Constant.serverImagesUser}$path";

    print(ratings);
    return Scaffold(
        backgroundColor: kBrandWhite,
        appBar: CustomAppBarWidget(
          title: "Mis cursos",
          beforeWidget: const RoutingScreen(),
          leadingActive: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardCurrentSectionWidget(
                        grade: user["grado"],
                        image: urlImage,
                        number: "${user["numero"]}",
                        qualification: ratingsFinal,
                        section: user["seccion"],
                        student: user["nombre"]),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "Calificaciones",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: kBrandBlack,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      children: ratings
                          .map((item) => CardRatingWidget(
                                course: item["nonbrecurso"]!,
                                teacher: item["profesor"]!,
                                qualification: "${item['promedio_ponderado']}",
                                type:
                                    "${helper.convertirDecimalARomano(item["ordentipo"])} ${item["tipo"]}",
                              ))
                          .toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
