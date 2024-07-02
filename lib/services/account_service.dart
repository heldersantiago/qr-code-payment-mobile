import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qrcode_payment/constants/api.dart';
import 'package:qrcode_payment/models/account.dart';

class AccountService extends GetxService {
  final String _apiUrl = apiUrl;

  Future<Account> loadAccount(int userId) async {
    final response =
        await http.get(Uri.parse('$_apiUrl/accounts/user/$userId'));

    if (response.statusCode == 200) {
      final accountJson = jsonDecode(response.body);
      return Account.fromJson(accountJson);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
