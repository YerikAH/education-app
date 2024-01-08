import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBrandWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 30.0,
              height: 30.0,
              child: CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 5,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Cargando...",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    );
  }
}
