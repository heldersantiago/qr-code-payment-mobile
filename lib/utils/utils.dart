import 'dart:async';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class UpdateData {
  AuthController authController = Get.find<AuthController>();
  late Timer _timer;

  Future<void> startUpdatingData() async {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) async {
      await authController.loadUserFromToken();
    });
  }

  Future<void> stopUpdating() async {
    _timer.cancel();
  }
}
