import 'package:flutte_travel_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xFF3EBACE),
              onPrimary: Color(0xFF3EBACE),
              secondary: Color(0xFFD8ECF1),
              onSecondary: Color(0xFFD8ECF1),
              error: Colors.red,
              onError: Colors.red,
              background: Color(0xFFF3F5F7),
              onBackground: Color(0xFFF3F5F7),
              surface: Colors.blue,
              onSurface: Colors.blue)),
      home: const HomeScreen(),
    );
  }
}
