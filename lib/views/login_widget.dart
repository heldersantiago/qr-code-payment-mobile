import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_payment/controllers/auth_controller.dart';
import 'package:qrcode_payment/widgets/auth_field.dart';

import '../routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = true;
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  final AuthController authController = Get.find<AuthController>();

  String? _passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Digite sua password";
    }
    return null;
  }

  String? _emailOrPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Insira seu email ou nº de telefone";
    }
    if (!(value.isEmail || value.isPhoneNumber)) {
      return "Insira um email ou nº de telefone válido";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      // authController.isLoading.value = false;
    });
  }

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2.4,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset("assets/images/signin.png"),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: AuthField(
                    controller: _emailOrPhoneController,
                    icon: Icons.email,
                    hintText: "Digite o email",
                    keyboardType: TextInputType.text,
                    labelText: "Email",
                    validator: _emailOrPasswordValidator,
                  )),
              Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: AuthField(
                    controller: _passwordController,
                    icon: Icons.lock,
                    hintText: "Digite a sua password",
                    keyboardType: TextInputType.text,
                    labelText: "Password",
                    isPassword: true,
                    validator: _passwordValidator,
                  )),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          authController.isLoading.value = true;
                          authController.login(
                              _emailOrPhoneController.text.trim(),
                              _passwordController.text.trim());
                        }
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          child: Obx(() =>
                          authController.isLoading.value
                              ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                              : const Text(
                            "Entrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Não possui uma conta?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(RouteGenerator.register);
                    },
                    child: const Text(
                      "Crie uma conta",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
