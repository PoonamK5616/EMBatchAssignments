import 'package:flutter/material.dart';
import 'contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'My First Flutter App',

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),

      home: const Center(
        child: SizedBox(
          width: 430,
          height: 932,
          child: ContactPage(),
        ),
      ),
    );
  }
}