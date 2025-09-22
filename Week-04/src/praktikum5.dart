// langkah 3
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void main() {
  // langkah 1
  print("----------langkah 2----------");
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  // langkah 3
  print("----------langkah 3----------");
  var sebelum = (1, 2);
  var sesudah = tukar(sebelum);

  print("sebelum: $sebelum");
  print("sesudah: $sesudah");

  print("----------langkah 4----------");
  // Record type annotation in a variable declaration:
  (String, int)? mahasiswa = ('Nur aziz', 2341720237);
  print(mahasiswa);

  print("----------langkah 5----------");
  var mahasiswa2 = ('NurAaziz', a: 2, b: true, '2341720237');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}
