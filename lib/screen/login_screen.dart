import 'package:education/constant/constant.dart';
import 'package:education/screen/home_screen.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/custom_button_widget.dart';
import 'package:education/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100.0,
                    ),
                    SizedBox(
                      width: 100.0,
                      child: Image.asset('assets/logo.png'),
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
                    CustomTextFieldWidget(
                      hintText: "Ingresa tu usuario",
                      controller: _userController,
                      isRequired: true,
                    ),
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
                    CustomTextFieldWidget(
                      hintText: "Ingresa tu contraseña",
                      controller: _passwordController,
                      isRequired: true,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.blue),
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
                    CustomButtonWidget(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          }
                        },
                        text: "Ingresar")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 90,
        elevation: 0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Uri uri = Constant.urlFacebook;
                      launchUrl(uri, mode: LaunchMode.externalApplication);
                    },
                    icon: const Icon(
                      Icons.facebook,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {
                      Uri uri = Constant.urlPhone;
                      launchUrl(uri, mode: LaunchMode.externalApplication);
                    },
                    icon: const Icon(
                      Icons.fmd_good_rounded,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {
                      Uri uri = Constant.urlLocation;
                      launchUrl(uri, mode: LaunchMode.externalApplication);
                    },
                    icon: const Icon(
                      Icons.tiktok,
                      color: Colors.blue,
                    )),
              ],
            ),
            const Text(
              "Build by TID 2023",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
