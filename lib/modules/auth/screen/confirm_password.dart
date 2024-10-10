import 'package:cash_app/modules/auth/screen/recover_password.dart';
import 'package:flutter/material.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isVisibleConfirm = true;
  bool _isVisibleNew = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validatePasswords(String? value) {
    if (_newPasswordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      return 'Por favor ingresa ambas contraseñas';
    }
    if (_newPasswordController.text != _confirmPasswordController.text) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.jpeg",
                    width: 250,
                    height: 250,
                  ),
                  TextFormField(
                    controller: _newPasswordController,
                    obscureText: _isVisibleNew,
                    decoration: InputDecoration(
                      hintText: "Nueva Contraseña",
                      label: const Text("Nueva Contraseña"),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisibleNew = !_isVisibleNew;
                          });
                        },
                        icon: Icon(_isVisibleNew
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _isVisibleConfirm,
                    decoration: InputDecoration(
                      hintText: "Confirmar Contraseña",
                      label: const Text("Confirmar Contraseña"),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisibleConfirm = !_isVisibleConfirm;
                          });
                        },
                        icon: Icon(_isVisibleConfirm
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    validator: validatePasswords,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('Contraseña cambiada');
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        child: const Text("Confirmar")),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
