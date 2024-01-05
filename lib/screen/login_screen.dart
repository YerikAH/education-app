// ignore_for_file: use_build_context_synchronously

import 'package:education/constant/constant.dart';
import 'package:education/preferences/preferences.dart';
import 'package:education/screen/routing_screen.dart';
import 'package:education/services/services.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/custom_button_widget.dart';
import 'package:education/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool error = false;
  String errorMessage = "500: Error en la interfaz";
  bool loader = false;

  void handleLogin() async {
    Preferences preferences = Preferences();
    Service service = Service();
    if (_formKey.currentState!.validate()) {
      setState(() {
        error = false;
        loader = true;
      });
      Map<String, String> body = {
        "user": _userController.text,
        "password": _passwordController.text
      };
      Map<dynamic, dynamic> data = await service.loginUser(body);
      if (data["status"] == 203) {
        preferences.saveValue(data["user_id"].toString());
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RoutingScreen()));
      } else {
        setState(() {
          error = true;
          errorMessage = "${data["status"]}: ${data["message"]}";
        });
      }
      setState(() {
        loader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                        isObscure: false,
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
                        isObscure: true,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.blue),
                                onPressed: () {
                                  launchUrl(Constant.urlContact,
                                      mode: LaunchMode.externalApplication);
                                },
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
                      loader
                          ? const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.blue,
                              ),
                            )
                          : CustomButtonWidget(
                              onPressed: () => handleLogin(), text: "Ingresar"),
                      const SizedBox(
                        height: 20.0,
                      ),
                      error
                          ? SizedBox(
                              width: double.infinity,
                              child: Text(
                                errorMessage,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.redAccent),
                              ),
                            )
                          : const SizedBox()
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
                        Uri uri = Constant.urlTidFacebook;
                        launchUrl(uri, mode: LaunchMode.externalApplication);
                      },
                      icon: const Icon(
                        Icons.facebook,
                        color: Colors.blue,
                      )),
                  IconButton(
                      onPressed: () {
                        Uri uri = Constant.urlTidWhatsApp;
                        launchUrl(uri, mode: LaunchMode.externalApplication);
                      },
                      icon: const Icon(
                        Ionicons.logo_whatsapp,
                        color: Colors.blue,
                      )),
                ],
              ),
              const Text(
                "Desarrollado por TID 2023",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
