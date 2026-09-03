import 'package:flutter/material.dart';
import 'profile_card.dart';

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
      title: 'My Profile',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xff100B24),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff9C4DFF),
        ),
      ),
      home: const ProfileCard(),
    );
  }
}