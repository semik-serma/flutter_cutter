import 'package:flutter/material.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  final formkey = GlobalKey<FormState>();

  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  bool showPassword = false;

  @override
  void dispose() {
    usernamecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  void signup() {
    if (formkey.currentState!.validate()) {
      final email = emailcontroller.text.trim();
      final username = usernamecontroller.text.trim();

      debugPrint("Email: $email");
      debugPrint("Username: $username");
      debugPrint("User Signed Successfully");

      usernamecontroller.clear();
      emailcontroller.clear();
      passwordcontroller.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Form validated successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Welcome To day 6",
            style: TextStyle(
              color: Colors.amber.shade900,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: 120),
                TextFormField(
                  controller: usernamecontroller,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Enter Username";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.person),
                    labelText: "Username",
                    hintText: "Enter your username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Email
                TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    final email = value?.trim() ?? "";

                    if (email.isEmpty) {
                      return "Enter Email";
                    }

                    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                        .hasMatch(email)) {
                      return "Enter a valid email";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                    suffixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Password
                TextFormField(
                  controller: passwordcontroller,
                  obscureText: !showPassword,
                  validator: (value) {
                    final password = value ?? "";

                    if (password.isEmpty) {
                      return "Enter Password";
                    }

                    if (password.length < 8) {
                      return "Password must be at least 8 characters";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),

                const SizedBox(height: 19),

                // Full-width Signup Button
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: signup,
                          child: const Text("Sign up"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
