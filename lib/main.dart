import 'package:flutter/material.dart';
import 'package:widget_app/config/theme/app_theme.dart';
import 'package:widget_app/presentation/screen/buttons/buttons_screen.dart';
import 'package:widget_app/presentation/screen/cards/cards_screen.dart';
import 'package:widget_app/presentation/screen/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 8).getTheme(),
      home: const HomeScreen(),
      routes: {
        '/buttons': (context) => const ButtonScreen(),
        '/cards': (context) => const CardsScreen(),
      },
    );
  }
}
