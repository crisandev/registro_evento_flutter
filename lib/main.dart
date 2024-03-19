import 'package:flutter/material.dart';
import 'package:segundo_parcial/pages/home.dart';

void main() {
  runApp(const MainApp());
}

//CRISTIAN EULISES SANCHEZ RAMIREZ
//2021-1899
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
