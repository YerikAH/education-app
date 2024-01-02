import 'package:education/helpers/helpers.dart';
import 'package:education/providers/user_provider.dart';
import 'package:education/screen/profile_screen.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/custom_app_bar_widget.dart';
import 'package:education/widgets/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoUserScreen extends StatelessWidget {
  InfoUserScreen({Key? key}) : super(key: key);
  Helpers helper = Helpers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandWhite,
      appBar: CustomAppBarWidget(
        title: "Datos personales",
        beforeWidget: ProfileScreen(),
        leadingActive: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/avatar_test.jpeg"),
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
              InfoWidget(
                clave: 'Nombre completo',
                value: helper.toCapitalizeCase(
                    "${context.watch<UserProvider>().user['data']['nombre']} ${context.watch<UserProvider>().user['data']['apellido']}"),
                icon: Icons.person_2_outlined,
              ),
              InfoWidget(
                clave: 'Dirección',
                value: context.watch<UserProvider>().user['data']['direccion'],
                icon: Icons.home_filled,
              ),
              InfoWidget(
                clave: 'Número de celular',
                value: context
                    .watch<UserProvider>()
                    .user['data']['telefono']
                    .toString(),
                icon: Icons.phone_android,
              ),
              InfoWidget(
                clave: 'Documento identificación',
                value: context
                    .watch<UserProvider>()
                    .user['data']['dni']
                    .toString(),
                icon: Icons.notes_rounded,
              ),
              InfoWidget(
                clave: 'Aula',
                value:
                    "${context.watch<UserProvider>().user['data']['aula']} ${context.watch<UserProvider>().user['data']['numero']} ${context.watch<UserProvider>().user['data']['seccion']}",
                icon: Icons.room,
              ),
              InfoWidget(
                clave: 'Nivel',
                value: helper.toCapitalizeCase(
                    context.watch<UserProvider>().user['data']['nivel']),
                icon: Icons.school_rounded,
              ),
              InfoWidget(
                clave: 'Grado',
                value: helper.toCapitalizeCase(
                    context.watch<UserProvider>().user['data']['grado']),
                icon: Icons.calculate_sharp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
