import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_payment/controllers/auth_controller.dart';
import 'package:qrcode_payment/routes.dart';
import 'package:qrcode_payment/utils/utils.dart';

import '../widgets/ButtomHome_widget.dart';
import '../widgets/card_account_widget.dart';

class PgHome extends StatefulWidget {
  PgHome({super.key});

  @override
  State<PgHome> createState() => _PgHomeState();
}

class _PgHomeState extends State<PgHome> {
  final authController = Get.find<AuthController>();
  final dataUpdater = UpdateData();

  @override
  void initState() {
    dataUpdater.startUpdatingData();
    super.initState();
    authController.loadUserFromToken();
  }

  @override
  void dispose() {
    dataUpdater.stopUpdating();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PAGAKI",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
        ),
        backgroundColor: Colors.blue,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(RouteGenerator.generateQrCode);
          },
          child: const Icon(
            Icons.qr_code_scanner_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(RouteGenerator.login);
            },
            child: const Icon(
              Icons.logout_sharp,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              const Text(
                'CONTA',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CardAccountWidget(),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ButtomHomeWidget(
                  icon: Icons.account_balance_wallet,
                  title: 'MINHA CONTA',
                  route: RouteGenerator.accountDetail,
                ),
                ButtomHomeWidget(
                  icon: Icons.qr_code_2,
                  title: 'GERAR QR CODE',
                  route: RouteGenerator.generateQrCode,
                ),
                ButtomHomeWidget(
                  icon: Icons.qr_code_scanner_rounded,
                  title: 'PAGAR',
                  route: RouteGenerator.payment,
                ),
                ButtomHomeWidget(
                  icon: Icons.manage_history,
                  title: 'Histórico',
                  route: RouteGenerator.history,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
