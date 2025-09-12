# Praktikum 1: Menerapkan Control Flows ("if/else")
### Langkah 1:
Ketik atau salin kode program berikut ke dalam fungsi main().


```dart

void main(){
  // Langkah 1
  String test = "test2";

  if (test == "test1") {
    print("Test1");
  } else If (test == "test2") {
    print("Test2");
  } Else {
    print("Something else");
  }

  if (test == "test2") print("Test2 again");
  }
```
### Langkah 2:
Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan!
- Jawab: tidak bisa, karena penulisan else if nya salah seharusnya menggunakan awalan kecil
### Screenshot: <br>
![](/2341720237-Mobile-SEM-5/Week-03/img/P1L2.png)

### Langkah 3:
Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
    String test = "true";
        if (test) {
            print("Kebenaran");
    }
```
- Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan if/else.

- Jawab: terdapat error karena string tidak bisa di isi variable tipe boolean, kemudian variable test sudah ada, jadi lebih baik diganti dengan variable lain

### Perbaikan Kode
```dart
bool test3 = true;
  if (test3 == true) {
    print("Kebenaran");
  } else {
    print("Salah");
  }
```
### Screenshot: <br>
![](/2341720237-Mobile-SEM-5/Week-03/img/P1L3.png)
-
# Praktikum 2: Menerapkan Perulangan "while" dan "do-while"

### Langkah 1: 
Ketik atau salin kode program berikut ke dalam fungsi main().

```dart
while (counter < 33) {
  print(counter);
  counter++;
}
```
### Langkah 2:
Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

- Jawab: Tidak bisa dijalankan, terdapat error. Alasan error karena variable counter belum dibuat dahulu.

### Perbaikan Kode

```dart
void main() {
  int counter = 0;
  while (counter < 33) {
    print(counter);
    counter++;
  }
}

```

### Langkah 3:
Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

```dart
do {
  print(counter);
  counter++;
} while (counter < 77);
```
- Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan do-while.

- Jawab: Tidak terdapat error, program tetap menjalankan perulangan sampai angka 76.
### Screnshoot:
![](/2341720237-Mobile-SEM-5/Week-03/img/P2L3.png)

# Praktikum 3 Menerapkan Perulangan "for" dan "break-continue"

### Langkah 1: 
Ketik atau salin kode program berikut ke dalam fungsi main().
```dart
for (Index = 10; index < 27; index) {
  print(Index);
}
```
### Langkah 2:
- Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

- Jawab: Terjadi error ketika run kode, karena variable belum dideklarasi dengan benar, seharusnya menambahkan 'var' sebelum index.

```dart
void main() {
  for (var index = 10; index < 27; index++) {
    print(index);
  }
}
```
### Screnschoot:
![](/2341720237-Mobile-SEM-5/Week-03/img/P3L2.png)

### Langkah 3:
Tambahkan kode program berikut di dalam for-loop, lalu coba eksekusi (Run) kode Anda.
```dart
If (Index == 21) break;
Else If (index > 1 || index < 7) continue;
print(index);
```
- Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan for dan break-continue.
- Jawab: program tetap berjalan dan looping sebanyak 17 tetapi terdapat if untuk berhenti di 21 dan tidak menampilkan output karena perintah print dibawah continue;
### Screenshoot: 
![](/2341720237-Mobile-SEM-5/Week-03/img/P3L3.png)

# Tugas Praktikum
1. Silakan selesaikan Praktikum 1 sampai 3, lalu dokumentasikan berupa screenshot hasil pekerjaan beserta penjelasannya!
2. Buatlah sebuah program yang dapat menampilkan bilangan prima dari angka 0 sampai 201 menggunakan Dart. Ketika bilangan prima ditemukan, maka tampilkan nama lengkap dan NIM Anda.

- Jawab: 
```dart
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
```
### Screenshoot:
![](/2341720237-Mobile-SEM-5/Week-03/img/PraktikumSoal2.png)


3. Kumpulkan berupa link commit repo GitHub pada tautan yang telah disediakan di grup Telegram!
