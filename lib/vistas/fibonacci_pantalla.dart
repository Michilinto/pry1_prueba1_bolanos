import 'package:flutter/material.dart';
import '../controladores/fibonacci_controlador.dart';

class FibonacciPantalla extends StatefulWidget {
  @override
  State<FibonacciPantalla> createState() => _FibonacciPantallaState();
}

class _FibonacciPantallaState extends State<FibonacciPantalla> {
  final cantidadController = TextEditingController();
  FibonacciControlador controlador = FibonacciControlador();

  String serie = '';
  String mensaje = '';

  void calcular() {
    int? cantidad = int.tryParse(cantidadController.text);

    if (cantidad == null || cantidad <= 0) {
      setState(() {
        mensaje = 'Ingrese una cantidad entera positiva';
        serie = '';
      });
      return;
    }

    final datos = controlador.calcular(cantidad);

    setState(() {
      serie = datos.serie;
      mensaje = '';
    });
  }

  void limpiar() {
    setState(() {
      cantidadController.clear();
      serie = '';
      mensaje = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serie de Fibonacci'),
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: cantidadController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cantidad de terminos',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: calcular,
              icon: Icon(Icons.format_list_numbered),
              label: Text('Generar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            Text(mensaje, style: TextStyle(color: Colors.red)),
            Text('Serie:', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(serie, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: limpiar,
        tooltip: 'Limpiar',
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
        child: Icon(Icons.cleaning_services),
      ),
    );
  }
}