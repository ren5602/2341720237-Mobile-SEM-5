# Praktikum 1: Mengunduh Data dari Web Service (API)

## Langkah 1: Buat Project Baru

Buatlah sebuah project flutter baru dengan nama books di folder src week-11 repository GitHub Anda.
Kemudian Tambahkan dependensi http dengan mengetik perintah berikut di terminal.

`flutter pub add http`

## Langkah 2: Cek file pubspec.yaml

Jika berhasil install plugin, pastikan plugin http telah ada di file pubspec ini seperti berikut.
`dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0`

![p1l2](./img/P1L2.png)

## Langkah 3: Buka file main.dart

### Soal 1

Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

Ketiklah kode seperti berikut ini.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Aziz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back from the Future - Aziz')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(onPressed: () {}, child: Text('Go!')),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
```

## Langkah 4: Tambah method getData()

Tambahkan method ini ke dalam class \_FuturePageState yang berguna untuk mengambil data dari API Google Books.

```dart
Future<Response> getData() async {
  const authority = 'www.googleapis.com';
  const path = '/books/v1/volumes/OVgsEAAAQBAJ';
  Uri url = Uri.https(authority, path);
  return http.get(url);
}
```

### Soal 2

- Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.
- Kemudian cobalah akses di browser URI tersebut dengan lengkap seperti ini. Jika menampilkan data JSON, maka Anda telah berhasil. Lakukan capture milik Anda dan tulis di README pada laporan praktikum. Lalu lakukan commit dengan pesan "W11: Soal 2"
- Link: https://www.google.co.id/books/edition/Classroom_of_the_Elite_Light_Novel_Vol_8/OVgsEAAAQBAJ?hl=en&gbpv=0
- Kode unik: OVgsEAAAQBAJ
  ![p1soal2](./img/P1Soal2.png)

## Langkah 5: Tambah kode di ElevatedButton

Tambahkan kode pada onPressed di ElevatedButton seperti berikut.

```dart
ElevatedButton(
  onPressed: () {
    setState(() {});
    getData()
        .then((value) {
          result = value.body.toString().substring(0, 450);
          setState(() {});
        })
        .catchError((_) {
          result = 'An error occurred';
          setState(() {});
        });
  },
  child: Text('Go!'),
),
```

Lakukan run aplikasi Flutter Anda. Anda akan melihat tampilan akhir seperti gambar berikut. Jika masih terdapat error, silakan diperbaiki hingga bisa running.

### Soal 3

- Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!
- substring(0, 450)
  Memotong string hasil value.body supaya 450 karakter pertama yang disimpan di variabel result. Tujuannya agar widget Text tidak menampilkan seluruh respons, melainkan hanya cuplikan singkat saja.
- catchError((\_) { … })
  Menangkap setiap kegagalan yang terjadi selama pemanggilan getData() Ketika ada error, result diisi string 'An error occurred' dan setState dipanggil untuk memperbarui tampilan.
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 3".
  ![p1soal3](./img/P1Soal3.gif)

# Praktikum 2: Menggunakan await/async untuk menghindari callbacks

## Langkah 1: Buka file main.dart

Tambahkan tiga method berisi kode seperti berikut di dalam class \_FuturePageState.

```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}

Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}

Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```

## Langkah 2: Tambah method count()

```dart
Future count() async {
  int total = 0;
  total = await returnOneAsync();
  total += await returnTwoAsync();
  total += await returnThreeAsync();
  setState(() {
    result = total.toString();
  });
}
```

Lalu tambahkan lagi method ini di bawah ketiga method sebelumnya.

## Langkah 3: Panggil count()

Lakukan comment kode sebelumnya, ubah isi kode onPressed() menjadi seperti berikut.

```dart
ElevatedButton(
  child: Text('Go!'),
      onPressed: () {
         count();
      }
)
```

## Langkah 4: Run

Akhirnya, run atau tekan F5 jika aplikasi belum running. Maka Anda akan melihat seperti gambar berikut, hasil angka 6 akan tampil setelah delay 9 detik.

## Soal 4

- Jelaskan maksud kode langkah 1 dan 2 tersebut!
  - Langkah 1 – membuat tiga method async Tujuannya hanya memberikan pekerjaan delay 3 detik yang nanti akan dijalankan secara berurutan.
    - Masing-masing method mengembalikan Future dengan nilai 1, 2, dan 3.
    - await Future.delayed(...) membuat prosesnya menunggu 3 detik sebelum mengembalikan angka tersebut, sehingga kita punya “task” yang bisa dipantau waktunya.
    - Langkah 2 – method count() Method ini menunjukkan pola urutan pada operasi async: - Mulai dengan total = 0. - Menunggu returnOneAsync() selesai 3 detik, ambil hasil 1 → total = 1. - Menunggu returnTwoAsync() selesai 3 detik, tambahkan 2 → total = 3. - Menunggu returnThreeAsync() selesai 3 detik, tambahkan 3 → total = 6. - Setelah ketiga tugas selesai (total 9 detik), baru memanggil setState untuk memperbarui UI dengan angka 6.
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 4".

  ![p2soal4](./img/P1Soal4.gif)
