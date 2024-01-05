// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:education/helpers/helpers.dart';
import 'package:education/providers/user_provider.dart';
import 'package:education/screen/calendar_screen.dart';
import 'package:education/screen/notice_screen.dart';
import 'package:education/screen/ratings_screen.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/card_course_widget.dart';
import 'package:education/widgets/header_user_widget.dart';
import 'package:education/widgets/no_data_widget.dart';
import 'package:education/widgets/section_separator.dart';
import 'package:education/widgets/title_show_widget.dart';
import 'package:education/widgets/card_course_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  Helpers helper = Helpers();

  @override
  Widget build(BuildContext context) {
    List scheduleData = context.watch<UserProvider>().schedule["data"];
    List coursesData = context.watch<UserProvider>().courses["data"];

    List<TableRow> createRows() {
      Map<int, List<Map<dynamic, dynamic>>> listaTransformada = {};
      List<TableRow> tableRows = [];
      for (int i = 0; i < coursesData.length; i++) {
        int grupo = i ~/ 3;
        listaTransformada.putIfAbsent(grupo, () => []);
        listaTransformada[grupo]!.add(coursesData[i]);
      }

      for (int i = 0; i < listaTransformada.keys.toList().length; i++) {
        List element = listaTransformada[i] as List;
        List<Widget> widgets = [];
        for (int k = 0; k < element.length; k++) {
          bool next = false;
          widgets.add(CardCourseButtonWidget(
              rol: element[k]["rol"],
              title: helper.toCapitalizeCase("${element[k]["nonbrecurso"]}")));
          if (element.length == 1) {
            widgets.add(Container());
            widgets.add(Container());
          } else if (element.length == 2) {
            // ignore: dead_code
            if (next) widgets.add(Container());
            next = true;
          }
        }
        tableRows.add(TableRow(children: widgets));
      }

      return tableRows;
    }

    List<TableRow> tablerows = createRows();
    List<Widget> createCardList() {
      return scheduleData
          .map((item) => CardCourseWidget(
                rol: item["rol"],
                title: helper.toCapitalizeCase(item["curso"]),
                text:
                    "Curso enseñado por el maestro ${helper.toCapitalizeCase('${item["docente_nombre"]} ${item["docente_apellidos"]}')}",
                date: helper.obtenerDiaSemana(item["dia"]),
                hour: helper.convertFormatHour("${item["inicio"]}"),
              ))
          .toList();
    }

    return Scaffold(
      backgroundColor: kBrandWhite,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 80.0,
          ),
          HeaderUserWidget(
              user: helper.returnFirstName(
                  context.watch<UserProvider>().user["data"]["nombre"])),
          TitleShowWidget(
            title: "Proximas Clases",
            button: "Ver calendario",
            widget: const CalendarScreen(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30.0),
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    context.watch<UserProvider>().schedule["data"].length == 0
                        ? [
                            CardCourseWidget(
                                title: "No tienes clases",
                                text:
                                    "Si crees que es un error, comunicate con tus maestros",
                                date: "",
                                hour: "",
                                rol: "error")
                          ]
                        : createCardList(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SectionSeparator(
              title: "Nuestras Noticias",
              text: "Descrubre lo nuevo",
              button: "Ver",
              widget: const NoticeScreen()),
          const SizedBox(
            height: 10.0,
          ),
          TitleShowWidget(
              title: "Mis cursos",
              button: "Ver calificaciones",
              widget: const RatingsScreen()),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: context.watch<UserProvider>().courses["data"].length == 0
                ? NoDataWidget(message: "No tienes cursos registrados.")
                : Table(
                    children: tablerows,
                  ),
          )
        ]),
      ),
    );
  }
}
