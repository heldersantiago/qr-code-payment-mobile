import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrcode_payment/routes.dart';

class PgSplash extends StatefulWidget {
  const PgSplash({super.key});

  @override
  State<PgSplash> createState() => _PgSplashState();
}

class _PgSplashState extends State<PgSplash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
        () => Navigator.of(context).popAndPushNamed(RouteGenerator.homePage));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                "PAGAKI",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
