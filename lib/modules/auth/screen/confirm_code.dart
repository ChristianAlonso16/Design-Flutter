import 'package:cash_app/modules/auth/screen/confirm_password.dart';
import 'package:flutter/material.dart';

class ConfirmCode extends StatefulWidget {
  const ConfirmCode({super.key});

  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  final TextEditingController _codeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? validateCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu codigo electrónico';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
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
                    validator: validateCode,
                    controller: _codeController,
                    decoration: const InputDecoration(
                      hintText: "Codigo",
                      label: Text("Codigo"),
                    ),
                    keyboardType: TextInputType.number,
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
                            print('Datos => ${_codeController.text}');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ConfirmPassword(),
                              ),
                            );
                          }
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        child: const Text("Validar codigo")),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
