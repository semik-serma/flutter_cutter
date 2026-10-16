import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  const Textfield({super.key});

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController describeController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    describeController.dispose();
    super.dispose();
  }

  void handleSubmit() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final describe = describeController.text.trim();

    debugPrint("email: $email");
    debugPrint("password: $password");
    debugPrint("describe: $describe");

    emailController.clear();
    passwordController.clear();
    describeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            height: 520,
            width: double.infinity,
            padding: const EdgeInsetsGeometry.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login Form",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(90)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: passwordController,
                  obscureText: false,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(90)),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: describeController,
                  decoration: const InputDecoration(
                    labelText: "Describe",
                    hintText: "Why you wanna use my app",
                    prefixIcon: Icon(Icons.description),
                  ),
                  maxLines: 5,
                ),
                const SizedBox(height: 36),
                OutlinedButton(
                  onPressed: handleSubmit,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      letterSpacing: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
