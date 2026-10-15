import 'package:flutter/material.dart';
import '../controladores/perfecto_controlador.dart';

class PerfectoPantalla extends StatefulWidget {
  @override
  State<PerfectoPantalla> createState() => _PerfectoPantallaState();
}

class _PerfectoPantallaState extends State<PerfectoPantalla> {
  final numeroController = TextEditingController();
  PerfectoControlador controlador = PerfectoControlador();

  String resultado = '';
  String mensaje = '';
  int suma = 0;

  void calcular() {
    int? numero = int.tryParse(numeroController.text);

    if (numero == null || numero <= 0) {
      setState(() {
        mensaje = 'Ingrese un numero entero positivo';
        resultado = '';
        suma = 0;
      });
      return;
    }

    final datos = controlador.calcular(numero);

    setState(() {
      suma = datos.suma;
      resultado = datos.resultado;
      mensaje = '';
    });
  }

  void limpiar() {
    setState(() {
      numeroController.clear();
      resultado = '';
      mensaje = '';
      suma = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numeros perfectos'),
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese un numero entero positivo',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: calcular,
              icon: Icon(Icons.calculate),
              label: Text('Calcular'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            Text(mensaje, style: TextStyle(color: Colors.red)),
            Text('Suma de divisores propios: $suma'),
            SizedBox(height: 10),
            Text(resultado, style: TextStyle(fontSize: 20)),
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