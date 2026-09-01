import 'package:flutter/material.dart';
import 'foodapp.dart';

void main() {
  runApp(const MyApp());
}

// App setup
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parth Food Hub - 和食',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF9F6F0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9E2A2B),
          primary: const Color(0xFF9E2A2B),
          secondary: const Color(0xFFC5A059),
          surface: const Color(0xFFFAF7F2),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF9E2A2B),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}