import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qrcode_payment/constants/api.dart';
import 'package:qrcode_payment/models/account.dart';
import 'package:qrcode_payment/models/user.dart';
import 'package:qrcode_payment/services/account_service.dart';

import '../routes.dart';
import '../services/storage_service.dart';
import '../services/user_service.dart';

class AuthController extends GetxController {
  UserService userService = Get.put(UserService());
  AccountService accountService = Get.find<AccountService>();

  final String _authUrl = authUrl;
  final String _apiUrl = apiUrl;
  var isLogged = false.obs;
  var isLoading = false.obs;
  RxInt UserId = 0.obs;
  var currentUser = User().obs;
  var currentAccount = Account().obs;

  Future<void> login(String email, String password) async {
    final response = await http.post(
        Uri.parse(
          _authUrl,
        ),
        body: {'password': password, 'email': email});

    isLoading.value = true; // Start loading

    if (response.statusCode == 200) {
      final token = response.body;
      await StorageService.storeToken(token);

      isLoading.value = false; // end loading
      isLogged.value = true;

      await loadUserFromToken();
      // Redirect to the home page when user is logged in
      Get.offAndToNamed(RouteGenerator.homePage);
    } else {
      isLoading.value = false;

      Get.snackbar("Erro", "Credenciais inválidas",
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.only(top: 5));
    }
  }

  Future<void> loadUserFromToken() async {
    isLoading.value = true;
    final userId = await StorageService.getUserIdFromPayload();
    if (userId != null) {
      UserId.value = int.tryParse(userId)!;
    }
    final user = await userService.getUser(UserId.value);
    final account = await accountService.loadAccount(UserId.value);
    currentUser.value = user;
    currentAccount.value = account;
    isLoading.value = false;
  }

  void register(User user) async {
    isLoading.value = true; // Start loading

    final response = await http.post(
        Uri.parse(
          "$_apiUrl/users/",
        ),
        body: {
          "name": user.name,
          "email": user.email,
          "phone": user.phone,
          "password": user.password,
        });

    if (response.statusCode == 201) {
      isLoading.value = false;
      Get.offAndToNamed(RouteGenerator.login);
      Get.snackbar("Sucesso", "Usuário cadastrado com sucesso",
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.only(top: 5));
    }
  }

  Future<void> logout() async {
    await StorageService.removeToken();
    isLogged.value = false;
    isLoading.value = false;
    currentUser.value = User(); // to clean
    Get.offAllNamed(RouteGenerator.login);
  }
}
