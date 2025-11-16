# Praktikum 1: Dart Streams

Selesaikan langkah-langkah praktikum berikut ini menggunakan editor Visual Studio Code (VS Code) atau Android Studio atau code editor lain kesukaan Anda. Jawablah di laporan praktikum Anda (ketik di README.md) pada setiap soal yang ada di beberapa langkah praktikum ini.

# Langkah 1: Buat Project Baru

Buatlah sebuah project flutter baru dengan nama stream_nama (beri nama panggilan Anda) di folder week-12/src/ repository GitHub Anda.

# Langkah 2: Buka file main.dart

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
      title: 'Stream',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}
```

```dart
class _StreamHomePageState extends State<StreamHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

## Soal 1

Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

```dart
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Nur Aziz',
```

Gantilah warna tema aplikasi sesuai kesukaan Anda.
Lakukan commit hasil jawaban Soal 1 dengan pesan "W12: Jawaban Soal 1"

```dart
primarySwatch: Colors.lightblue,
```

# Langkah 3: Buat file baru stream.dart

Buat file baru di folder lib project Anda. Lalu isi dengan kode berikut.

```dart
import 'package:flutter/material.dart';

class ColorStream {

}
```

# Langkah 4: Tambah variabel colors

Tambahkan variabel di dalam class ColorStream seperti berikut.

```dart
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
  ];
```

## Soal 2

### Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel colors tersebut.

```dart
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    // Soal 2: Menambahkan warna sesuai keinginan
    Colors.pink,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.indigo,
  ];
```

### Lakukan commit hasil jawaban Soal 2 dengan pesan "W12: Jawaban Soal 2"

# Langkah 5: Tambah method getColors()

Di dalam class ColorStream ketik method seperti kode berikut. Perhatikan tanda bintang di akhir keyword async\* (ini digunakan untuk melakukan Stream data)

```dart
Stream<Color> getColors() async* {
}
```

# Langkah 6: Tambah perintah yield\*

Tambahkan kode berikut ini.

```dart
yield* Stream.periodic(
  const Duration(seconds: 1), (int t) {
    int index = t % colors.length;
    return colors[index];
});
```

## Soal 3

### Jelaskan fungsi keyword yield\* pada kode tersebut!

Kata kunci yield* digunakan untuk meneruskan semua data dari Stream lain ke Stream yang sedang dibuat. Jika yield hanya mengirim satu nilai, maka yield* mengirim seluruh aliran data dari Stream sumber, satu per satu, secara berurutan

### Apa maksud isi perintah kode tersebut?

Potongan kode tersebut membuat sebuah Stream yang mengirimkan data setiap detik. Nilai t bertindak sebagai penghitung yang terus bertambah, dan digunakan untuk memilih warna dari daftar colors dengan bantuan operasi modulo agar indeksnya tetap dalam batas. Proses ini membuat warna berubah setiap detik secara berulang—setelah warna terakhir, kembali lagi ke warna pertama—menghasilkan aliran data yang berjalan terus-menerus.

### Lakukan commit hasil jawaban Soal 3 dengan pesan "W12: Jawaban Soal 3"

# Langkah 7: Buka main.dart

Ketik kode impor file ini pada file main.dart

```dart
import 'stream.dart';
```

# Langkah 8: Tambah variabel

Ketik dua properti ini di dalam class \_StreamHomePageState

```dart
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
```

# Langkah 9: Tambah method changeColor()

Tetap di file main, Ketik kode seperti berikut

```dart
  void changeColor() async {
    await for (var eventColor in colorStream.getColors()) {
      setState(() {
        bgColor = eventColor;
      });
    }
  }
```

# Langkah 10: Lakukan override initState()

Ketika kode seperti berikut:

```dart
  @override
  void initState() {
    super.initState();
    colorStream = ColorStream();
    changeColor();
  }
```

# Langkah 11: Ubah isi Scaffold()

Sesuaikan kode seperti berikut.

```dart
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Nur Aziz'),
      ),
      body: Container(
        decoration: BoxDecoration(color: bgColor),
      ),
    );
  }
```

# Langkah 12: Run

Lakukan running pada aplikasi Flutter Anda, maka akan terlihat berubah warna background setiap detik.

## Soal 4

## Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

![s4](./img/P1S4.gif)

## Lakukan commit hasil jawaban Soal 4 dengan pesan "W12: Jawaban Soal 4"

# Langkah 13: Ganti isi method changeColor()

Anda boleh comment atau hapus kode sebelumnya, lalu ketika kode seperti berikut.

## Soal 5

### Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !

Perbedaan `await` for dan `listen()` ada pada cara menangani aliran data dan efeknya terhadap jalannya program.

await for menunggu setiap data datang, memprosesnya satu per satu, dan program berhenti sementara sampai selesai. Cocok jika urutan data harus diproses secara teratur.

listen() tidak menunggu. Ia menjalankan callback saat data muncul, sementara program terus berjalan. UI tetap responsif, dan kita bisa pause, resume, atau cancel alirannya kapan saja.

### Lakukan commit hasil jawaban Soal 5 dengan pesan "W12: Jawaban Soal 5"

---
