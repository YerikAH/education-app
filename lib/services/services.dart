import 'dart:convert';

import 'package:http/http.dart' as http;

class Service {
  Future<Map<dynamic, dynamic>> getUser(String id) async {
    var client = http.Client();
    var url = Uri.parse('http://192.168.236.250/api_education/user.php?id=$id');
    try {
      var response = await client.get(url);
      Map<dynamic, dynamic> decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return decodedResponse;
    } catch (e) {
      Map<String, dynamic> error = {
        "message": "Error en nuestros servidores",
        "status": 500,
      };
      return error;
    }
  }

  Future<Map<dynamic, dynamic>> getCourses(String id) async {
    var client = http.Client();
    var url =
        Uri.parse('http://192.168.236.250/api_education/courses.php?id=$id');
    try {
      var response = await client.get(url);
      Map<dynamic, dynamic> decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return decodedResponse;
    } catch (e) {
      Map<String, dynamic> error = {
        "message": "Error en nuestros servidores",
        "status": 500,
      };
      return error;
    }
  }

  Future<Map<dynamic, dynamic>> getRatings(String id) async {
    var client = http.Client();
    var url =
        Uri.parse('http://192.168.236.250/api_education/ratings.php?id=$id');
    try {
      var response = await client.get(url);
      Map<dynamic, dynamic> decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return decodedResponse;
    } catch (e) {
      Map<String, dynamic> error = {
        "message": "Error en nuestros servidores",
        "status": 500,
      };
      return error;
    }
  }

  Future<Map<dynamic, dynamic>> getSchedule(String id) async {
    var client = http.Client();
    var url =
        Uri.parse('http://192.168.236.250/api_education/schedule.php?id=55');
    try {
      var response = await client.get(url);
      Map<dynamic, dynamic> decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return decodedResponse;
    } catch (e) {
      Map<String, dynamic> error = {
        "message": "Error en nuestros servidores",
        "status": 500,
      };
      return error;
    }
  }

  Future<Map<dynamic, dynamic>> getCalendar(String id) async {
    var client = http.Client();
    var url =
        Uri.parse('http://192.168.236.250/api_education/calendar.php?id=$id');
    try {
      var response = await client.get(url);
      Map<dynamic, dynamic> decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return decodedResponse;
    } catch (e) {
      Map<String, dynamic> error = {
        "message": "Error en nuestros servidores",
        "status": 500,
      };
      return error;
    }
  }

  Future<Map<dynamic, dynamic>> loginUser(Map<String, String> body) async {
    String user = body["user"]!;
    String password = body["password"]!;
    var client = http.Client();
    Uri url = Uri.parse(
        'http://192.168.236.250/api_education/login.php?user=$user&password=$password');
    try {
      var response = await client.get(url);
      Map<dynamic, dynamic> decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return decodedResponse;
    } catch (e) {
      Map<String, dynamic> error = {
        "message": "Error en nuestros servidores",
        "status": 500
      };
      return error;
    }
  }

  Future<Map<dynamic, dynamic>> getNotices() async {
    var client = http.Client();
    var url = Uri.parse('http://192.168.236.250/api_education/notices.php');
    try {
      var response = await client.get(url);
      Map<dynamic, dynamic> decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return decodedResponse;
    } catch (e) {
      Map<String, dynamic> error = {
        "message": "Error en nuestros servidores",
        "status": 500,
      };
      return error;
    }
  }

  Future<Map<dynamic, dynamic>> getNotice(String id) async {
    var client = http.Client();
    var url =
        Uri.parse('http://192.168.236.250/api_education/notice.php?id=$id');
    try {
      var response = await client.get(url);
      Map<dynamic, dynamic> decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return decodedResponse;
    } catch (e) {
      Map<String, dynamic> error = {
        "message": "Error en nuestros servidores",
        "status": 500,
      };
      return error;
    }
  }
}
