import 'package:app_8/components/auth_button.dart';
import 'package:app_8/components/confirm_button.dart';
import 'package:app_8/components/custom_input.dart';
import 'package:app_8/services/auth_service.dart';
import 'package:app_8/utils/show_message.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.app_registration,
              size: 120,
              color: Colors.white,
            ),
            const Text(
              'Cadastro',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInput(
              controller: nameController,
              labelText: 'Nome',
            ),
            CustomInput(
              controller: emailController,
              labelText: 'Email',
            ),
            CustomInput(
              controller: phoneController,
              labelText: 'Telefone',
            ),
            CustomInput(
              controller: passwordController,
              labelText: 'Senha',
              isObscure: true,
            ),
            CustomInput(
              controller: confirmController,
              labelText: 'Repita sua Senha',
              isObscure: true,
            ),
            ConfirmButton(
              onPressed: () async {
                try {
                  await FirebaseAuthService().register(
                    nameController.text,
                    phoneController.text,
                    emailController.text,
                    passwordController.text,
                  );

                  Navigator.of(context).pushReplacementNamed('/');
                } catch (e) {
                  showMessage(context, e);
                }
              },
              labelText: 'Cadastrar',
            ),
          ],
        ),
      ),
    );
  }
}