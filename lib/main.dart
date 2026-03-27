import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

/// ================= PROVIDER =================
class ExpenseProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _expenses = [];

  List<Map<String, dynamic>> get expenses => _expenses;

  void addExpense(String title, double amount) {
    _expenses.add({
      "title": title,
      "amount": amount,
    });
    notifyListeners();
  }
}

/// ================= MAIN APP =================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExpenseProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}

/// ================= LOGIN SCREEN =================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;

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
            ),

            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Email
                  const Text("Email"),
                  TextFormField(
                    controller: emailController,
                    validator: (value) =>
                        value!.isEmpty ? "Enter email" : null,
                  ),

                  const SizedBox(height: 15),

                  /// Password
                  const Text("Password"),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    validator: (value) =>
                        value!.isEmpty ? "Enter password" : null,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Login Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HomeScreen()),
                        );
                      }
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ================= HOME SCREEN =================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context);

    final titleController = TextEditingController();
    final amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Expense Tracker")),

      body: Column(
        children: [

          /// Add Expense
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration:
                      const InputDecoration(hintText: "Title"),
                ),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(hintText: "Amount"),
                ),

                ElevatedButton(
                  onPressed: () {
                    final title = titleController.text;
                    final amount =
                        double.tryParse(amountController.text) ?? 0;

                    provider.addExpense(title, amount);
                  },
                  child: const Text("Add Expense"),
                ),
              ],
            ),
          ),

          const Divider(),

          /// Expense List
          Expanded(
            child: ListView.builder(
              itemCount: provider.expenses.length,
              itemBuilder: (context, index) {
                final expense = provider.expenses[index];
                return ListTile(
                  title: Text(expense['title']),
                  trailing: Text("₹${expense['amount']}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
