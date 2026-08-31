import 'package:flutter/material.dart';
import 'foodapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kZomatoRed,
          primary: kZomatoRed,
        ),
        scaffoldBackgroundColor: kPageBg,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: kBrandSoft,
          selectedColor: kBrandSoft,
          side: const BorderSide(color: kLine),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}
