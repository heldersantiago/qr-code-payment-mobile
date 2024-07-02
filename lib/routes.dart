import 'package:flutter/material.dart';
import 'package:qrcode_payment/pages/pg_home.dart';
import 'package:qrcode_payment/views/account_detail.dart';
import 'package:qrcode_payment/views/history.dart';
import 'package:qrcode_payment/views/login_widget.dart';
import 'package:qrcode_payment/views/payment.dart';
import 'package:qrcode_payment/views/qenerate_qr_code.dart';
import 'package:qrcode_payment/views/register_widget.dart';

class RouteGenerator {
  static const String homePage = '/pg_home';
  static const String payment = '/payment';
  static const String generateQrCode = '/generate-qr-code';
  static const String accountDetail = '/account-detail';
  static const String history = '/history';
  static const String login = '/login';
  static const String register = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => PgHome());
      case payment:
        return MaterialPageRoute(builder: (_) => PaymentWidget());
      case generateQrCode:
        return MaterialPageRoute(builder: (_) => const GenerateQrCodeWidget());
      case history:
        return MaterialPageRoute(builder: (_) => const HistoryWidget());
      case accountDetail:
        return MaterialPageRoute(builder: (_) => AccountDetailWidget());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Route not found'),
        ),
      );
    });
  }
}
