import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_payment/controllers/PaymentController.dart';
import 'package:qrcode_payment/controllers/auth_controller.dart';
import 'package:qrcode_payment/routes.dart';
import 'package:qrcode_payment/services/account_service.dart';
import 'package:qrcode_payment/services/user_service.dart';

void main() {
  initiateGetControllers();
  runApp(MyApp());
}

void initiateGetControllers() {
  Get.put(AccountService());
  Get.put(AuthController());
  Get.put(PaymentController());
  Get.put(UserService());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // navigatorKey: _navigatorKey,
      title: 'PAGAKI',
      initialRoute: RouteGenerator.login,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
