import '../modelos/perfecto_modelo.dart';

class PerfectoControlador {
  PerfectoModelo calcular(int numero) {
    PerfectoModelo datos = PerfectoModelo(numero);

    for (int i = 1; i < numero; i++) {
      if (numero % i == 0) {
        datos.suma = datos.suma + i;
      }
    }

    if (datos.suma == numero) {
      datos.resultado = '$numero es un numero perfecto';
    } else {
      datos.resultado = '$numero no es un numero perfecto';
    }

    return datos;
  }
}