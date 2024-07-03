import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_payment/controllers/PaymentController.dart';

class GenerateQrCodeWidget extends StatefulWidget {
  const GenerateQrCodeWidget({super.key});

  @override
  _GenerateQrCodeWidgetState createState() => _GenerateQrCodeWidgetState();
}

class _GenerateQrCodeWidgetState extends State<GenerateQrCodeWidget> {
  final TextEditingController _textController = TextEditingController();
  final paymentController = Get.find<PaymentController>();
  String? _qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Gerar Código QR",
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              return paymentController.product.value.qrcodeUrl == null
                  ? Image.asset(
                      "assets/images/qrcode.jpg",
                      height: MediaQuery.of(context).size.height * 0.4,
                    )
                  : Image.network(
                      "http://localhost:3002/${paymentController.product.value.qrcodeUrl!}",
                      height: MediaQuery.of(context).size.height * 0.4,
                    );
            }),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 20),
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Insira o valor (Kz)',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    if (_textController.text.isNumericOnly) {
                      paymentController.generateQrCode(_textController.text);
                      _textController.text = "";
                    } else {
                      _textController.text = "";
                      Get.snackbar(
                          "QR Code", "Erro ao gerar Qr Code, tente novamente",
                          colorText: Colors.white,
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 2),
                          margin: const EdgeInsets.only(top: 5));
                    }
                    setState(() {
                      _qrData = _textController.text;
                    });
                  },
                  child: const Text(
                    "Gerar Código QR",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
