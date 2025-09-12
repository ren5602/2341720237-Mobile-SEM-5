void main() {
  for (var i = 2; i <= 201; i++) {
    bool isPrima = true;
    for (var j = 2; j < i; j++) {
      if (i % j == 0) {
        isPrima = false;
        break;
      }
    }
    if (isPrima) {
      print('$i: Muhammad Nur Aziz, NIM: 2341720237');
    }
  }
}
