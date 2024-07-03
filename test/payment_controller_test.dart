// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:mockito/mockito.dart';
// import 'package:qrcode_payment/constants/api.dart';
// import 'package:qrcode_payment/controllers/PaymentController.dart';
// import 'package:qrcode_payment/controllers/auth_controller.dart';
// import 'package:qrcode_payment/models/product.dart';
// import 'package:qrcode_payment/models/bardode.dart';
//
// // Mock classes
// class MockHttpClient extends Mock implements http.Client {}
// class MockAuthController extends Mock implements AuthController {}
//
// void main() {
//   group('PaymentController Test', () {
//     PaymentController paymentController;
//     MockHttpClient mockHttpClient;
//     MockAuthController mockAuthController;
//
//     setUp(() {
//       mockHttpClient = MockHttpClient();
//       mockAuthController = MockAuthController();
//       Get.put(mockAuthController);
//
//       paymentController = PaymentController();
//     });
//
//     test('generateQrCode success', () async {
//       when(mockHttpClient.post(
//         Uri.parse("${apiUrl}/products"),
//         body: anyNamed('body'),
//       )).thenAnswer((_) async => http.Response(jsonEncode({
//         "id": 1,
//         "name": "stuff",
//         "price": "100",
//         "quantity": "34",
//         "description": "Add your name in the body",
//         "sellerId": "1"
//       }), 201));
//
//       when(mockAuthController.currentUser).thenReturn(Rx<User>(User(id: 1)));
//
//       await paymentController.generateQrCode("100");
//
//       expect(paymentController.product.value.id, 1);
//       expect(paymentController.product.value.name, "stuff");
//       expect(paymentController.product.value.price, "100");
//     });
//
//     test('generateQrCode failure', () async {
//       when(mockHttpClient.post(
//         Uri.parse("${apiUrl}/products"),
//         body: anyNamed('body'),
//       )).thenAnswer((_) async => http.Response("Error", 400));
//
//       when(mockAuthController.currentUser).thenReturn(Rx<User>(User(id: 1)));
//
//       await paymentController.generateQrCode("100");
//
//       expect(paymentController.product.value.id, null);
//     });
//
//     test('processPayment success', () async {
//       final barcodeData = jsonEncode({
//         "price": "100",
//         "fromAccountId": "1",
//         "toAccountId": "2"
//       });
//
//       when(mockHttpClient.post(
//         Uri.parse("${apiUrl}/accounts/transfer/"),
//         body: anyNamed('body'),
//       )).thenAnswer((_) async => http.Response("Success", 200));
//
//       when(mockAuthController.currentUser).thenReturn(Rx<User>(User(id: 1)));
//
//       await paymentController.processPayment(barcodeData);
//
//       verify(mockHttpClient.post(
//         Uri.parse("${apiUrl}/accounts/transfer/"),
//         body: anyNamed('body'),
//       )).called(1);
//     });
//
//     test('processPayment failure', () async {
//       final barcodeData = jsonEncode({
//         "price": "100",
//         "fromAccountId": "1",
//         "toAccountId": "2"
//       });
//
//       when(mockHttpClient.post(
//         Uri.parse("${apiUrl}/accounts/transfer/"),
//         body: anyNamed('body'),
//       )).thenAnswer((_) async => http.Response("Error", 400));
//
//       when(mockAuthController.currentUser).thenReturn(Rx<User>(User(id: 1)));
//
//       await paymentController.processPayment(barcodeData);
//
//       verify(mockHttpClient.post(
//         Uri.parse("${apiUrl}/accounts/transfer/"),
//         body: anyNamed('body'),
//       )).called(1);
//     });
//   });
// }
