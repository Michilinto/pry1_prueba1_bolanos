import '../modelos/fibonacci_modelo.dart';

class FibonacciControlador {
  FibonacciModelo calcular(int cantidad) {
    FibonacciModelo datos = FibonacciModelo(cantidad);

    int a = 0;
    int b = 1;
    int siguiente;

    for (int i = 1; i <= cantidad; i++) {
      if (i == 1) {
        datos.serie = '$a';
      } else {
        datos.serie = '${datos.serie}, $a';
      }

      siguiente = a + b;
      a = b;
      b = siguiente;
    }

    return datos;
  }
}