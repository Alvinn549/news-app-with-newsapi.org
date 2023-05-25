import 'package:flutter/material.dart';
import 'package:news_app/view/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: const HomePage(),
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
