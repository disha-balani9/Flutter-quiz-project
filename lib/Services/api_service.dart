import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../models/question_model.dart';
import '../models/notifications_model.dart';
class ApiService {

  static const baseUrl = "http://10.0.2.2:3000";


  static Future<bool> signup(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/signup"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
      }),
    );

    return response.statusCode == 200;
  }


  static Future<User?> login(String email,
      String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    final data = jsonDecode(response.body);

    if (data["user"] != null) {
      return User.fromJson(data["user"]);
    }

    return null;
  }

//get questions
  static Future<List> getQuestions(String category) async {
    final response = await http.get(
      Uri.parse("$baseUrl/questions/$category"),
    );

    print(response.body);

    return jsonDecode(response.body);
  }

  // 🔔 GET NOTIFICATIONS
  static Future<List<NotificationModel>>
  getNotifications() async {
    final response = await http.get(
      Uri.parse("$baseUrl/notifications"),
    );

    final data =
    jsonDecode(response.body);

    return (data as List)
        .map(
          (n) =>
          NotificationModel.fromJson(n),
    )
        .toList();
  }
}