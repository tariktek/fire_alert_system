import 'package:flutter/material.dart';
import 'package:fire_alert_system/features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DikkatYangın',
      theme: ThemeData(
        primaryColor: const Color(0xFFFF3B30),
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 2,
          iconTheme: IconThemeData(color: Color(0xFF333333)),
        ),
        fontFamily: 'SF Pro Text',
      ),
      home: const HomePage(),
    );
  }
}
