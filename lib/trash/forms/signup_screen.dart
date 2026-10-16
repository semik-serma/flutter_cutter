import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final fullnamecontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    fullnamecontroller.dispose();
    super.dispose();
  }

  void signup() {
    if (formkey.currentState!.validate()) {
      final email = emailcontroller.text.trim();
      final password = passwordcontroller.text.trim();
      final fullname = fullnamecontroller.text.trim();
      debugPrint("Full name is: $fullname");
      debugPrint("Validate email is: $email");
      debugPrint("Password length: ${password.length}");
      emailcontroller.clear();
      passwordcontroller.clear();
      fullnamecontroller.clear();
      debugPrint("User signed up successfully");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: fullnamecontroller,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                final fullname = value?.trim() ?? "";
                if (fullname.isEmpty) {
                  return "fullname must not be empty";
                }
                if (fullname.length < 4) {
                  return "Full name must be at least 4 characters";
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                final email = value?.trim() ?? "";
                if (email.isEmpty) {
                  return "email is required";
                }
                if (!RegExp(
                  r"^(?=.{1,254}$)(?=.{1,64}@)(?!.*\.\.)[A-Za-z0-9](?:[A-Za-z0-9.!#$%&'*+/=?^_`{|}~-]{0,62}[A-Za-z0-9])?@(?:[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?\.)+(?:[A-Za-z]{2,63}|xn--[A-Za-z0-9-]{1,59})$",
                ).hasMatch(email)) {
                  return "Enter a valid email";
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordcontroller,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.length < 8) {
                  return "Password is required";
                }
                if (!RegExp(
                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                ).hasMatch(value)) {
                  return "Password should contain special symbol,numbers,uppercase,lowercase alphabets";
                }
                return null;
              },
            ),

            SizedBox(height: 12),
            ElevatedButton(onPressed: signup, child: Text("Signup")),
          ],
        ),
      ),
    );
  }
}
