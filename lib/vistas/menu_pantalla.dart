import 'package:flutter/material.dart';

class MenuPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu de ejercicios'),
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15),
            Text(
              'Seleccione un ejercicio',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/perfecto');
              },
              icon: Icon(Icons.check_circle_outline),
              label: Text('Numeros perfectos'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(18),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/fibonacci');
              },
              icon: Icon(Icons.format_list_numbered),
              label: Text('Serie de Fibonacci'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(18),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/armstrong');
              },
              icon: Icon(Icons.numbers),
              label: Text('Numero Armstrong'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(18),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}