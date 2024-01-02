import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  Map<dynamic, dynamic> _user = {};
  Map<dynamic, dynamic> _courses = {};
  Map<dynamic, dynamic> _ratings = {};
  Map<dynamic, dynamic> _schedule = {};
  Map<dynamic, dynamic> _calendar = {};

  Map<dynamic, dynamic> get user => _user;
  Map<dynamic, dynamic> get courses => _courses;
  Map<dynamic, dynamic> get ratings => _ratings;
  Map<dynamic, dynamic> get schedule => _schedule;
  Map<dynamic, dynamic> get calendar => _calendar;

  void setUser(Map<dynamic, dynamic> newUser) {
    _user = newUser;
    notifyListeners();
  }

  void setCourses(Map<dynamic, dynamic> newCourses) {
    _courses = newCourses;
    notifyListeners();
  }

  void setRatings(Map<dynamic, dynamic> newRatings) {
    _ratings = newRatings;
    notifyListeners();
  }

  void setSchedule(Map<dynamic, dynamic> newSchedule) {
    _schedule = newSchedule;
    notifyListeners();
  }

  void setCalendar(Map<dynamic, dynamic> newCalendar) {
    _calendar = newCalendar;
    notifyListeners();
  }
}
