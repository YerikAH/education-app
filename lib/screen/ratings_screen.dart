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
    Map user = context.watch<UserProvider>().user['data'];
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
                        image: rating["image"]!,
                        number: rating["number"]!,
                        qualification: rating["nota"]!,
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
                      children: lista
                          .map((item) => CardRatingWidget(
                                course: item["curso"]!,
                                teacher: item["profesor"]!,
                                rol: item["rol"]!,
                                qualification: item["nota"]!,
                                type: item["tipo"]!,
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
