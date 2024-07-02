import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String tokenKey = "token";

  static Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(StorageService.tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(StorageService.tokenKey);
  }

  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(StorageService.tokenKey);
  }

  static Future<String?> getUserIdFromPayload() async {
    final jsonToken = await getToken();
    Map<String, dynamic> jsonData = jsonDecode(jsonToken!);

    if (jsonData['token'] == null) {
      return null;
    }
    var decodedToken = JwtDecoder.decode(jsonData['token']);
    return decodedToken["id"]!.toString();
  }
}
