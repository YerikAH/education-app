import 'package:education/themes/colors.dart';
import 'package:education/widgets/custom_button_widget.dart';
import 'package:education/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100.0,
              ),
              SizedBox(
                width: 100.0,
                child: Image.asset('assets/logo_legacy.png'),
              ),
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                "Ingresa",
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: kBrandBlack),
              ),
              const Text(
                "Hola, Bienvenido de nuevo 👋",
                style: TextStyle(fontSize: 14.0, color: kBrandGray),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "Nombre de usuario",
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: kBrandBlack),
              ),
              const SizedBox(
                height: 5.0,
              ),
              CustomTextFieldWidget(hintText: "Ingresa tu usuario"),
              const SizedBox(
                height: 25.0,
              ),
              const Text(
                "Contraseña",
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: kBrandBlack),
              ),
              const SizedBox(
                height: 5.0,
              ),
              CustomTextFieldWidget(hintText: "Ingresa tu contraseña"),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.blue),
                        onPressed: () {},
                        child: const Text(
                          "¿Olvidaste tu contraseña?",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomButtonWidget(onPressed: () {}, text: "Ingresar")
            ],
          ),
        ));
  }
}
