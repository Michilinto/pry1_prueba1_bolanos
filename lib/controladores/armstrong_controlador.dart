import '../modelos/armstrong_modelo.dart';

class ArmstrongControlador {
  ArmstrongModelo calcular(int numero) {
    ArmstrongModelo datos = ArmstrongModelo(numero);

    int auxiliar = numero;

    while (auxiliar > 0) {
      datos.cifras = datos.cifras + 1;
      auxiliar = auxiliar ~/ 10;
    }

    auxiliar = numero;

    while (auxiliar > 0) {
      int digito = auxiliar % 10;
      int potencia = 1;

      for (int i = 1; i <= datos.cifras; i++) {
        potencia = potencia * digito;
      }

      datos.suma = datos.suma + potencia;
      auxiliar = auxiliar ~/ 10;
    }

    if (datos.suma == numero) {
      datos.resultado = '$numero es un numero Armstrong';
    } else {
      datos.resultado = '$numero no es un numero Armstrong';
    }

    return datos;
  }
}