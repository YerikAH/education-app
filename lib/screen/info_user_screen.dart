import 'package:dotted_border/dotted_border.dart';
import 'package:education/screen/profile_screen.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/custom_app_bar_widget.dart';
import 'package:education/widgets/info_widget.dart';
import 'package:flutter/material.dart';

class InfoUserScreen extends StatelessWidget {
  const InfoUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandWhite,
      appBar: CustomAppBarWidget(
          title: "Datos personales", beforeWidget: const ProfileScreen()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              const SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/avatar_test.jpeg"),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Jorge Paytan",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
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
                value: 'Harvey Yerik Vasquez Huaranga',
                icon: Icons.person_2_outlined,
              ),
              InfoWidget(
                clave: 'Correo electronico',
                value: 'yerik05vh@gmail.com',
                icon: Icons.email_outlined,
              ),
              InfoWidget(
                clave: 'Número de celular',
                value: '967523180',
                icon: Icons.phone_android,
              ),
              InfoWidget(
                clave: 'Documento identificación',
                value: '7730159',
                icon: Icons.notes_rounded,
              ),
              InfoWidget(
                clave: 'Grado y sección',
                value: 'SD 152',
                icon: Icons.room,
              )
            ],
          ),
        ),
      ),
    );
  }
}
