import 'package:flutter/material.dart';
import './ui/ui.homepage/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: Color(0xFFFF4700)),
      ),
      home: const MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomePage());
  }
}
