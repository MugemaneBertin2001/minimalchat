import 'package:flutter/material.dart';
import 'package:minimalchat/components/my_button.dart';
import 'package:minimalchat/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  const RegisterPage({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController pwdController = TextEditingController();
    TextEditingController confirmPwdController = TextEditingController();



    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 30),
              Text(
                "Welcome, Let's create an account for you",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              MyTextField(
                hintText: "Email",
                obsecureText: false,
                controller: emailController,
              ),
              const SizedBox(height: 30),
              MyTextField(
                hintText: "Password",
                obsecureText: true,
                controller: pwdController,
              ),
              const SizedBox(height: 30),
              MyTextField(
                hintText: "Confirm Password",
                obsecureText: true,
                controller: confirmPwdController,
              ),
              const SizedBox(height: 20),
              const MyButton(
                text: "Register",
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already registered? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
