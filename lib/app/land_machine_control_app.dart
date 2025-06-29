import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';

class LandMachineControlApp extends StatelessWidget {
  const LandMachineControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Land Machine Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white70),
          bodyMedium: TextStyle(color: Colors.white60),
          headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}