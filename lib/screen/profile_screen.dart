import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(50.0), right: Radius.circular(50.0))),
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50.0111,
                ),
                const Text(
                  "Perfil",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 30.0111,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            color: Colors.lightBlue[200],
                            borderRadius: BorderRadius.circular(255)),
                        child: const CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              AssetImage("assets/avatar_test.jpeg"),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Jorge Paytan",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      const Text(
                        "145789632",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const Text(
                  "Descripción general",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: kBrandBlack,
                      fontWeight: FontWeight.w800),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
