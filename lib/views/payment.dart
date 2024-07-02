import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_payment/controllers/PaymentController.dart';
import 'package:qrcode_payment/views/qr_code_scanner.dart';

class PaymentWidget extends StatelessWidget {
  PaymentWidget({super.key});

  final PaymentController paymentController = Get.find<PaymentController>();

  Future<void> _openCamera(BuildContext context) async {
    final result = await Get.to(() => QRScannerScreen());
    if (result != null) {
      // Handle the result, for example, show a dialog with the result
      paymentController.processPayment(result.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Pagamento",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          onPressed: () => _openCamera(context),
          child:
              const Text("Abrir Camera", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
