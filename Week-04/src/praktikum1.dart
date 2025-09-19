void main() {
  // Langkah 1
  // var list = [1, 2, 3];
  // assert(list.length == 3);
  // assert(list[1] == 2);
  // print(list.length);
  // print(list[1]);

  // list[1] = 1;
  // assert(list[1] == 1);
  // print(list[1]);

  // Langkah 3
  final List listBio = List<String?>.filled(5, null);
  listBio[1] = 'Nur Aziz';
  listBio[2] = '2341720237';
  print('Panjang List: ${listBio.length}');
  print('Isi List ${listBio}');
  print('Nama: ${listBio[1]}');
  print('NIM: ${listBio[2]}');
}
