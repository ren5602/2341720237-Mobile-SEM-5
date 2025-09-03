//Contoh Null Safety

void nullSafety() {
  // nullsafety
  String nama = 'aziz'; // harus bernilai
  String? pekerjaan = null; // boleh bernilai null

  if (nama == 'aziz' && pekerjaan == null) {
    // jika nama tidak null dan pekerjaan null output seperti ini " nama saya adalah aziz saya seorang mahasiswa"
    print(
      'nama saya adalah ${nama}'
      ' saya seorang mahasiswa',
    );
  } else {
    // jika nama tidak null dan pekerjaan sudah ada isi output seperti ini
    print(
      'nama saya ${nama}'
      ' saya seorang ${pekerjaan}',
    );
  }
  if (pekerjaan == null) {
    // jika pekerjaan masih null output seperti ini "saya aziz dan saya seorang designer"
    pekerjaan ??= 'Designer';
    print('saya ${nama} dan saya seorang ${pekerjaan}');
  }
}

void lateVariable() {
  late String pekerjaan; // bisa diisi belakangan
  pekerjaan = 'Designer'; // isi late variable
  print('pekerjaan saya ${pekerjaan}'); // output 'Designer'
}

void main() {
  nullSafety();
  lateVariable();
}
