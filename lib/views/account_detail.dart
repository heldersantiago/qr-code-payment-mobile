import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_payment/controllers/auth_controller.dart';
import 'package:qrcode_payment/widgets/card_account_widget.dart';

// Dummy user data (replace with actual data or fetch dynamically)
class AccountDetailWidget extends StatelessWidget {
  AccountDetailWidget({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Minha Conta",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardAccountWidget(),
            const SizedBox(height: 25),
            const Center(
              child: Text(
                "Dados Pessoais",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Nome: ",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  authController.currentUser.value.name!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 23),
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Email: ",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  authController.currentUser.value.email!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 23),
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Telefone: ",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  authController.currentUser.value.phone!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 23),
                )
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
