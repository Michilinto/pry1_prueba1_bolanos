import 'package:flutter/material.dart';
import '../controladores/armstrong_controlador.dart';

class ArmstrongPantalla extends StatefulWidget {
  @override
  State<ArmstrongPantalla> createState() => _ArmstrongPantallaState();
}

class _ArmstrongPantallaState extends State<ArmstrongPantalla> {
  final numeroController = TextEditingController();
  ArmstrongControlador controlador = ArmstrongControlador();

  int cifras = 0;
  int suma = 0;
  String resultado = '';
  String mensaje = '';

  void calcular() {
    int? numero = int.tryParse(numeroController.text);

    if (numero == null || numero <= 0) {
      setState(() {
        mensaje = 'Ingrese un numero entero positivo';
        cifras = 0;
        suma = 0;
        resultado = '';
      });
      return;
    }

    final datos = controlador.calcular(numero);

    setState(() {
      cifras = datos.cifras;
      suma = datos.suma;
      resultado = datos.resultado;
      mensaje = '';
    });
  }

  void limpiar() {
    setState(() {
      numeroController.clear();
      cifras = 0;
      suma = 0;
      resultado = '';
      mensaje = '';
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numero Armstrong'),
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
            Text('Cantidad de cifras: $cifras'),
            SizedBox(height: 10),
            Text('Suma de potencias: $suma'),
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