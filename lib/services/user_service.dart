import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qrcode_payment/constants/api.dart';

import '../models/user.dart';

class UserService extends GetxService {
  final String _apiUrl = apiUrl;
  final String _authUrl = authUrl;

  Future<bool> loginAsync(String email, String password) async {
    final response = await http.post(
      Uri.parse(_authUrl),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final user = User.fromJson(jsonDecode(response.body));
      Get.put(user);
      return true;
    } else {
      return false;
    }
  }

  Future<User> getUser(int userId) async {
    final response = await http.get(Uri.parse('$_apiUrl/users/$userId'));

    if (response.statusCode == 200) {
      final userJson = jsonDecode(response.body);
      return User.fromJson(userJson);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<User> getUserAccount(int userId) async {
    final response = await http.get(Uri.parse('$_apiUrl/users/$userId'));

    if (response.statusCode == 200) {
      final userJson = jsonDecode(response.body);
      return User.fromJson(userJson);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
