import 'dart:convert';

class Helpers {
  String toFirstCapitalizeCase(String input) {
    if (input.isEmpty) {
      return '';
    }

    String result = input.toLowerCase();
    result = result[0].toUpperCase() + result.substring(1);

    return result;
  }

  String toCapitalizeCase(String input) {
    if (input.isEmpty) {
      return '';
    }
    List<String> words = input.split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] =
            words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
      }
    }
    String result = words.join(' ');

    return result;
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate =
        '${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year.toString()}';
    return formattedDate;
  }

  String returnFirstName(String fullName) {
    List<String> names = fullName.split(" ");

    String firstName = names[0];
    String formattedFirstName = firstName.substring(0, 1).toUpperCase() +
        firstName.substring(1).toLowerCase();
    return formattedFirstName;
  }

  String formatDateTime(String dayOfWeek) {
    int month = DateTime.now().toLocal().month;
    String monthName = obtenerNombreMes(month);

    String formattedDate =
        "${DateTime.now().day.toString().padLeft(2, '0')} $monthName";

    return formattedDate;
  }

  String obtenerNombreMes(int month) {
    switch (month) {
      case 1:
        return 'ENE';
      case 2:
        return 'FEB';
      case 3:
        return 'MAR';
      case 4:
        return 'ABR';
      case 5:
        return 'MAY';
      case 6:
        return 'JUN';
      case 7:
        return 'JUL';
      case 8:
        return 'AGO';
      case 9:
        return 'SEP';
      case 10:
        return 'OCT';
      case 11:
        return 'NOV';
      case 12:
        return 'DIC';
      default:
        return '';
    }
  }

  String convertFormatHour(String hour24) {
    List<String> slices = hour24.split(":");
    int hours = int.parse(slices[0]);
    int minuts = int.parse(slices[1]);
    String perd = (hours >= 12) ? 'PM' : 'AM';

    if (hours > 12) {
      hours = hours - 12;
    } else if (hours == 0) {
      hours = 12;
    }

    String hour12 = '$hours:${minuts.toString().padLeft(2, '0')} $perd';

    return hour12;
  }

  Map<DateTime, List<String>> convertJson(Map<String, dynamic> jsonOriginal) {
    final Map<DateTime, List<String>> convertedMap = {};

    jsonOriginal.forEach((key, value) {
      final dateParts = key.split('-');
      final date = DateTime.utc(int.parse(dateParts[2]),
          int.parse(dateParts[1]), int.parse(dateParts[0]));

      List<String> convertedList = value.map<String>((item) {
        return '{"rol": "${item['rol']}", "hora": "${item['final']}", "curso": "${item['curso']}","profesor": "${item['docente_nombre']} ${item['docente_apellidos']}"}';
      }).toList();

      convertedMap[date] = convertedList;
    });

    return convertedMap;
  }

  String formatOnlyDate(String inputDateTime) {
    DateTime dateTime = DateTime.parse(inputDateTime);
    String formattedDate =
        "${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}";
    return formattedDate;
  }

  String removeHtmlTag(String input) {
    return input.replaceAll(RegExp(r'<[^>]*>'), '');
  }

  List<Map<String, dynamic>> calcularPromedioPonderadoPorCurso(List lista) {
    Map<String, Map<int, List<Map<String, dynamic>>>> gruposPorCurso = {};

    for (var elemento in lista) {
      String nombreCurso = elemento['nonbrecurso'];
      int ordentipo = elemento['ordentipo'];

      if (!gruposPorCurso.containsKey(nombreCurso)) {
        gruposPorCurso[nombreCurso] = {};
      }

      if (!gruposPorCurso[nombreCurso]!.containsKey(ordentipo)) {
        gruposPorCurso[nombreCurso]![ordentipo] = [];
      }

      gruposPorCurso[nombreCurso]![ordentipo]!.add(elemento);
    }
    //print(gruposPorCurso);
    List<Map<String, dynamic>> resultado = [];

    gruposPorCurso.forEach((nombreCurso, grupos) {
      grupos.forEach((ordentipo, grupo) {
        double sumaNotas = 0;
        double sumaPuntajesPonderados = 0;
        double sumaPesos = 0;
        String profesor = "";
        String tipo = "";

        grupo.forEach((elemento) {
          profesor = elemento["nombres"];
          tipo = elemento["tipo"];
          double peso =
              elemento['puntajes'].toDouble(); // Convertir a double aquí
          double nota = double.tryParse(elemento['nota_alum']) ??
              0; // Convertir a double si es numérico
          sumaNotas += nota;
          sumaPuntajesPonderados += nota * peso;
          sumaPesos += peso;
        });

        double promedioNotas = sumaNotas / grupo.length;
        double promedioPonderado = sumaPuntajesPonderados / sumaPesos;

        resultado.add({
          "tipo": tipo,
          "profesor": profesor,
          "nonbrecurso": nombreCurso,
          "ordentipo": ordentipo,
          "promedio_notas": promedioNotas.toStringAsFixed(2),
          "promedio_ponderado": promedioPonderado.toStringAsFixed(2),
        });
      });
    });

    return resultado;
  }

  double calcularPromedioPonderado(List lista) {
    double sumaPromedioPonderado = 0;

    for (var elemento in lista) {
      sumaPromedioPonderado += double.parse(elemento['promedio_ponderado']);
    }

    return sumaPromedioPonderado / lista.length;
  }

  String convertirDecimalARomano(int numeroDecimal) {
    if (numeroDecimal < 1 || numeroDecimal > 3999) {
      return "Número fuera del rango válido (1-3999)";
    }

    List<String> simbolosRomanos = [
      "I",
      "IV",
      "V",
      "IX",
      "X",
      "XL",
      "L",
      "XC",
      "C",
      "CD",
      "D",
      "CM",
      "M"
    ];
    List<int> valoresDecimales = [
      1,
      4,
      5,
      9,
      10,
      40,
      50,
      90,
      100,
      400,
      500,
      900,
      1000
    ];

    String resultado = "";

    for (int i = 12; i >= 0; i--) {
      while (numeroDecimal >= valoresDecimales[i]) {
        resultado += simbolosRomanos[i];
        numeroDecimal -= valoresDecimales[i];
      }
    }

    return resultado;
  }

  String obtenerDiaSemana(int numero) {
    switch (numero) {
      case 1:
        return 'Lunes';
      case 2:
        return 'Martes';
      case 3:
        return 'Miércoles';
      case 4:
        return 'Jueves';
      case 5:
        return 'Viernes';
      case 6:
        return 'Sábado';
      case 7:
        return 'Domingo';
      default:
        return 'Número inválido';
    }
  }
}
