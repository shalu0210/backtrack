import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'services/storage_service.dart';
import 'providers/expense_provider.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

// ============================================================
// MAIN ENTRY POINT
// Initializes Hive local storage, sets up Provider state
// management, and launches the app with Material 3 theming.
// ============================================================

void main() async {
  // Ensure Flutter engine is ready before calling native code
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive storage (registers adapters & opens box)
  await StorageService.init();

  // Set the status bar style for a cleaner look
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(const ExpenseTrackerApp());
}

/// Root widget of the Expense Tracker application.
/// Wraps the app in a ChangeNotifierProvider so all descendant
/// widgets can access and listen to ExpenseProvider state changes.
class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Create the provider and immediately load saved expenses
      create: (_) => ExpenseProvider()..loadExpenses(),
      child: MaterialApp(
        title: 'Expense Tracker',
        debugShowCheckedModeBanner: false,

        // Material 3 light & dark themes defined in theme/app_theme.dart
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system, // Follows system setting

        home: const HomeScreen(),
      ),
    );
  }
}
