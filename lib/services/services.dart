import 'dart:convert';

import 'package:education/constant/constant.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<Map<dynamic, dynamic>> getUser(String id) async {
    var client = http.Client();
    String path = 'user.php?id=$id';
    Uri url = Constant.serverApi.resolve(path);
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
    String path = 'courses.php?id=$id';
    Uri url = Constant.serverApi.resolve(path);

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
    String path = 'ratings.php?id=$id';
    Uri url = Constant.serverApi.resolve(path);
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
    String path = 'schedule.php?id=$id';
    Uri url = Constant.serverApi.resolve(path);
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
    String path = 'calendar.php?id=$id';
    Uri url = Constant.serverApi.resolve(path);
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
    String path = 'login.php?user=$user&password=$password';
    Uri url = Constant.serverApi.resolve(path);
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
    String path = 'notices.php';
    Uri url = Constant.serverApi.resolve(path);

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
    String path = 'notice.php?id=$id';
    Uri url = Constant.serverApi.resolve(path);
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
