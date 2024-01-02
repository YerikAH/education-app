import 'package:flutter/material.dart';

class RolModel {
  List<Color> selectColorByRol(String rol) {
    Map data = {
      "ciencias": [Colors.orange, Colors.orange[300]!],
      "matematicas": [Colors.red, Colors.red[300]!],
      "pensamiento": [Colors.blue, Colors.blue[300]!],
      "general": [Colors.purple, Colors.purple[300]!],
      "arte": [Colors.yellow, Colors.yellow[300]!],
      "lectura": [Colors.green, Colors.green[300]!],
      "error": [Colors.black45, Colors.black12]
    };
    return data[rol];
  }

  String selectImageByRol(String rol) {
    Map data = {
      "ciencias": "assets/atomo.png",
      "matematicas": "assets/matematica.png",
      "pensamiento": "assets/filosofia.png",
      "general": "assets/geografia.png",
      "arte": "assets/arte.png",
      "lectura": "assets/lectura.png",
      "error": "assets/error.png"
    };
    return data[rol];
  }
}
