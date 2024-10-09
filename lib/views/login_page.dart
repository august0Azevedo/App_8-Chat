import 'package:app_8/components/auth_button.dart';
import 'package:app_8/components/confirm_button.dart';
import 'package:app_8/components/custom_input.dart';
import 'package:app_8/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Define a cor de fundo como preta
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.message_outlined,
              size: 120,
              color: Colors.white,
            ),
            CustomInput(
              controller: emailController,
              labelText: 'Email',
            ),
            CustomInput(
              controller: passwordController,
              labelText: 'Password',
              isObscure: true,
            ),
            ConfirmButton(
              labelText: 'Entrar',
              onPressed: () async {
                try {
                  var user = await FirebaseAuthService()
                      .login(emailController.text, passwordController.text);
                  Navigator.of(context).pushReplacementNamed('/home');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        e.toString(),
                      ),
                    ),
                  );
                }
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Ainda não tem uma conta?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Inscreva-se'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthButton(
                  image:
                      'https://cdn-icons-png.flaticon.com/512/2702/2702602.png',
                ),
                AuthButton(
                  image:
                      'https://static.vecteezy.com/system/resources/previews/016/716/481/original/facebook-icon-free-png.png',
                ),
                AuthButton(
                  image: 'https://static-00.iconduck.com/assets.00/github-icon-256x251-pwbwi7b2.png',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}