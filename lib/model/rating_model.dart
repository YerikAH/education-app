import 'package:flutter/material.dart';

class RatingModel {
  Map<String, dynamic> getStateByQualification(String qualification) {
    double qualificationDouble = double.parse(qualification);
    if (qualificationDouble < 10.5) {
      return {"color": Colors.redAccent, "state": "NO APROBADO"};
    } else if (qualificationDouble >= 10.5 && qualificationDouble <= 16.5) {
      return {"color": Colors.orange, "state": "REGULAR"};
    } else if (qualificationDouble >= 16.5 && qualificationDouble <= 18) {
      return {"color": Colors.green, "state": "MUY BUENO"};
    } else {
      return {"color": Colors.blue, "state": "EXCELENTE"};
    }
  }
}
