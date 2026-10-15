import 'package:flutter/material.dart';
import 'vistas/menu_pantalla.dart';
import 'vistas/perfecto_pantalla.dart';
import 'vistas/fibonacci_pantalla.dart';
import 'vistas/armstrong_pantalla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuPantalla(),
      routes: {
        '/perfecto': (context) => PerfectoPantalla(),
        '/fibonacci': (context) => FibonacciPantalla(),
        '/armstrong': (context) => ArmstrongPantalla(),
      },
    );
  }
}