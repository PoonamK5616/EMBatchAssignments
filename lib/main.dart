import 'package:flutter/material.dart';

import 'profile_card.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: ProfileCardPage.blue,
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),

      home: const ProfileCardPage(),
    );
  }
}
