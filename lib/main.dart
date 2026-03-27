import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Top drag handle (added)
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                /// Title
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                /// Email Field
                const Text("Email"),
                const SizedBox(height: 6),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter email",
                    prefixIcon: const Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// Password Field
                const Text("Password"),
                const SizedBox(height: 6),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 12,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Gradient Login Button (improved)
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Divider (added)
                Divider(color: Colors.grey[300]),

                const SizedBox(height: 10),

                /// Signup text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? "),
                    Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontWeight: FontWeight.bold,
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
