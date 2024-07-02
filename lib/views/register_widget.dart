import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_payment/models/user.dart';

import '../controllers/auth_controller.dart';
import '../routes.dart';
import '../widgets/auth_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterScreen> {
  bool passToggle = true;
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _deviceController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _deviceController.dispose();
    super.dispose();
  }

  String? _nameValidator(String? value) {
    if (value!.isEmpty) {
      return "Digite seu nome";
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Digite uma password";
    }
    if (value.length < 6) {
      return "Password deve ter no mínimo 6 caracteres";
    }

    return null;
  }

  String? _phoneValidator(String? value) {
    if (value!.isEmpty) {
      return "Digite seu nº de telefone";
    }
    if (!value.isPhoneNumber) {
      return "Digite número de telefone válido";
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Digite seu email";
    }
    if (!value.isEmail) {
      return "Digite email válido";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      authController.isLoading.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                height: 300,
                padding: const EdgeInsets.all(10),
                child: Image.asset("images/signup.png"),
              ),
              const SizedBox(height: 15),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: AuthField(
                  controller: _nameController,
                  icon: Icons.person,
                  hintText: "Digite o seu nome",
                  keyboardType: TextInputType.text,
                  labelText: "Nome",
                  validator: _nameValidator,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: AuthField(
                  controller: _emailController,
                  icon: Icons.email,
                  hintText: "Digite o seu email",
                  keyboardType: TextInputType.text,
                  labelText: "Email",
                  validator: _emailValidator,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: AuthField(
                  controller: _phoneController,
                  icon: Icons.phone,
                  hintText: "Digite o seu nº do telefone",
                  keyboardType: TextInputType.text,
                  labelText: "Número do telefone",
                  validator: _phoneValidator,
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: AuthField(
                    controller: _passwordController,
                    icon: Icons.lock,
                    hintText: "Digite o seu password",
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
                        if (_formkey.currentState!.validate()) {
                          authController.register(User(
                            name: _nameController.text,
                            email: _emailController.text,
                            phone: _phoneController.text,
                            password: _passwordController.text,
                          ));
                        }
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          child: Obx(() => authController.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Registrar",
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
                    "Já tem uma conta?",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(RouteGenerator.login);
                      },
                      child: const Text("Entrar",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )))
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
