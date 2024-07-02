import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.icon,
    this.validator,
    this.isPassword = false,
    required this.keyboardType,
  });

  final bool isPassword;
  final String labelText;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          style: const TextStyle(fontWeight: FontWeight.w400),
          obscureText: widget.isPassword ? _obscureText : false,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            prefixIconColor: Theme.of(context).primaryColor,
            suffixIcon: widget.isPassword
                ? IconButton(
                    splashRadius: 1,
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400, color: Colors.grey.shade400),
            hintText: widget.hintText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.blue),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.blue),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
