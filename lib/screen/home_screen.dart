import 'package:education/themes/colors.dart';
import 'package:education/widgets/card_course_widget.dart';
import 'package:education/widgets/header_user_widget.dart';
import 'package:education/widgets/section_separator.dart';
import 'package:education/widgets/title_show_widget.dart';
import 'package:education/widgets/card_course_button_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandWhite,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 80.0,
          ),
          HeaderUserWidget(user: "Harvey"),
          TitleShowWidget(title: "Proximos Cursos", button: "Ver todos"),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30.0),
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                CardCourseWidget(
                  title: 'Quimica',
                  text:
                      "Lorem impsum dolor is simply dummy text of the printing.",
                  date: "Aug 27",
                  hour: "12:00AM",
                  rol: "pensamiento",
                ),
                const SizedBox(
                  width: 20.0,
                ),
                CardCourseWidget(
                  title: 'Comunicación',
                  text:
                      "Lorem impsum dolor is simply dummy text of the printing.",
                  date: "Aug 27",
                  hour: "12:00AM",
                  rol: "lectura",
                ),
                const SizedBox(
                  width: 20.0,
                ),
                CardCourseWidget(
                  title: 'Programación',
                  text:
                      "Lorem impsum dolor is simply dummy text of the printing.",
                  date: "Aug 27",
                  hour: "12:00AM",
                  rol: "general",
                ),
                const SizedBox(
                  width: 20.0,
                ),
                CardCourseWidget(
                  title: 'Arte',
                  text:
                      "Lorem impsum dolor is simply dummy text of the printing.",
                  date: "Aug 27",
                  hour: "12:00AM",
                  rol: "ciencias",
                ),
                const SizedBox(
                  width: 20.0,
                ),
                CardCourseWidget(
                  title: 'Matematica superior',
                  text:
                      "Lorem impsum dolor is simply dummy text of the printing.",
                  date: "Aug 27",
                  hour: "12:00AM",
                  rol: "matematicas",
                ),
                const SizedBox(
                  width: 20.0,
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SectionSeparator(
              title: "Nuestras Noticias",
              text: "Descrubre lo nuevo",
              button: "Ver"),
          const SizedBox(
            height: 10.0,
          ),
          TitleShowWidget(title: "Mis cursos", button: "Ver todos"),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Table(
              children: [
                TableRow(children: [
                  CardCourseButtonWidget(
                      rol: "ciencias", title: "Programación"),
                  CardCourseButtonWidget(
                      rol: "matematicas", title: "Geometria"),
                  CardCourseButtonWidget(
                      rol: "pensamiento", title: "Matematica")
                ]),
                TableRow(children: [
                  CardCourseButtonWidget(rol: "pensamiento", title: "Arte"),
                  CardCourseButtonWidget(rol: "lectura", title: "Anatomia"),
                  CardCourseButtonWidget(rol: "general", title: "Filosofia")
                ]),
                TableRow(children: [
                  CardCourseButtonWidget(rol: "arte", title: "Lectura"),
                  Container(),
                  Container()
                ]),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
