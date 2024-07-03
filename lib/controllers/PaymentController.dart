import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qrcode_payment/constants/api.dart';
import 'package:qrcode_payment/controllers/auth_controller.dart';
import 'package:qrcode_payment/models/product.dart';

import '../models/bardode.dart';

class PaymentController extends GetxService {
  final _apiUrl = apiUrl;
  final authController = Get.find<AuthController>();
  var product = Product().obs;
  var isLoading = false.obs;

  Future<void> generateQrCode(String price) async {
    try {
      final response = await http.post(
        Uri.parse("$_apiUrl/products"),
        body: {
          "name": "stuff",
          "price": price,
          "quantity": "34",
          "description": "Add your name in the body",
          "sellerId": authController.currentUser.value.id.toString(),
        },
      );
      if (response.statusCode == 201) {
        Get.snackbar("QR Code", "QR Code gerado com sucesso",
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
            margin: const EdgeInsets.only(top: 5));
        print(response.body);
        final productJson = jsonDecode(response.body);
        product.value = Product.fromJson(productJson);
        print(product.value);
      } else {
        Get.snackbar("QR Code", "Erro ao gerar Qr Code, tente novamente",
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
            margin: const EdgeInsets.only(top: 5));
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> processPayment(dynamic data) async {
    try {
      final barcode = jsonDecode(data);
      final productData = Barcode.fromJson(barcode);

      print(productData.price);

      final response = await http.post(
        Uri.parse("$_apiUrl/accounts/transfer/"),
        body: {
          "amount": 100.toString(),
          "fromAccountId": authController.currentUser.value.id.toString(),
          "toAccountId": 2.toString(),
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        Get.snackbar("Pagamento", "Pagamento feito com sucesso!",
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
            margin: const EdgeInsets.only(top: 5));
      } else {
        Get.snackbar("Error", "Erro ao processar pagamento");
      }
    } catch (e) {
      Get.snackbar("Attention", e.toString());
    }
  }
}
