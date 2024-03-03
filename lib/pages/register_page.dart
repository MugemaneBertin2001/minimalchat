import 'package:flutter/material.dart';
import 'package:minimalchat/auth/auth_service.dart';
import 'package:minimalchat/components/my_button.dart';
import 'package:minimalchat/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController confirmPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void register(BuildContext context) {
      final auth = AuthService();
      if (emailController.text.isEmpty ||
          pwdController.text.isEmpty ||
          confirmPwdController.text.isEmpty) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("All fields are required."),
          ),
        );
        return;
      }
      if (pwdController.text == confirmPwdController.text) {
        try {
          auth.signUpWithEmailAndEmail(
              emailController.text, pwdController.text);
        } catch (e) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Passwords do not match."),
          ),
        );
      }
    }

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
              MyButton(
                text: "Register",
                onTap: () => register(context),
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
                    onTap: widget.onTap,
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
