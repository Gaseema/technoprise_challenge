import 'package:flutter/material.dart';
import 'screens/home/home.dart';

void main() {
  runApp(const Technoprise());
}

class Technoprise extends StatelessWidget {
  const Technoprise({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technoprise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
