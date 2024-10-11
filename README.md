# flutter-fundamental

# Nama : Rizqi Reza Danuarta

# NIM : 2141720057

# Kelas: TI-3C

## Minggu Ke-7

### Langkah 2 : Menambahkan Plugin

![alt text](/lib/image/p7.png)

### Langkah 3 : Buat File red_text_widget.dart

```dart
import 'package:flutter/material.dart';

class RedTextWidget extends StatelessWidget {
  const RedTextWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

### Langkah 4 : Tambah Widget AutoSizeText

```dart
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RedTextWidget extends StatelessWidget {
  final String text;

  const RedTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: const TextStyle(color: Colors.red, fontSize: 14),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
```

### Langkah 5 : Buat Variabel text dan paramenter di contructor

```dart
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RedTextWidget extends StatelessWidget {
  final String text;

  const RedTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: const TextStyle(color: Colors.red, fontSize: 14),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
```

### Langkah 6 : Tambahkan Widget di main.dart

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.yellowAccent,
              width: 50,
              child: const RedTextWidget(
                text: 'You have pushed the button this many times:',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.greenAccent,
              width: 100,
              child: const Text(
                'You have pushed the button this many times:',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

hasil output :

![alt text](/lib/image/p7-output.png)

## Tugas Praktikum Minggu Ke-7

1. Selesaikan Praktikum tersebut, lalu dokumentasikan dan push ke repository Anda berupa screenshot hasil pekerjaan beserta penjelasannya di file README.md!
2. Jelaskan maksud dari langkah 2 pada praktikum tersebut!

   jawaban : dimana itu adalah perintah pada terminal digunakan untuk menginstall plugin

3. Jelaskan maksud dari langkah 5 pada praktikum tersebut!

   jawaban : dimana sebelumnya masih belum terdapat inisialisasi variabel makanya ditambahkan kode seperti di langkah 5 agar berfungsi

4. Pada langkah 6 terdapat dua widget yang ditambahkan, jelaskan fungsi dan perbedaannya!

   jawaban : Perbedaan utama antara kedua Container adalah pada ukuran lebar, gaya teks (warna merah untuk RedTextWidget dan gaya default untuk Text), serta warna latar belakang yang digunakan. Hasilnya, kedua container memberikan tampilan teks yang berbeda dalam ukuran dan visual meskipun menampilkan konten yang sama.

5. Jelaskan maksud dari tiap parameter yang ada di dalam plugin auto_size_text berdasarkan tautan pada dokumentasi ini !

   jawaban :

   Parameter Deskripsi

   - key\*: Mengontrol bagaimana satu widget menggantikan widget lain di pohon.

   - textKey: Mengatur kunci untuk widget yang dihasilkan.

   - style\*: Jika non-null, gaya yang akan digunakan untuk teks ini.

   - minFontSize: Batasan ukuran teks minimum yang akan digunakan saat mengubah ukuran teks secara otomatis. Diabaikan jika presetFontSizes diatur.

   - maxFontSize: Batasan ukuran teks maksimum yang akan digunakan saat mengubah ukuran teks secara otomatis. Diabaikan jika presetFontSizes diatur.

   - stepGranularity: Ukuran langkah di mana ukuran font disesuaikan dengan kendala.

   - presetFontSizes: Tentukan semua ukuran font yang mungkin. Penting: harus dalam urutan menurun.

   - group: Menyinkronkan ukuran beberapa sAutoSizeText.

   - textAlign\*: Bagaimana teks harus disejajarkan secara horizontal.

   - textDirection\*: Arah teks. Ini menentukan bagaimana nilai textAlign (seperti TextAlign.start atau TextAlign.end) ditafsirkan.

   - locale\*: Digunakan untuk memilih font ketika karakter Unicode yang sama dapat dirender secara berbeda, tergantung pada lokal.

   - softWrap\*: Apakah teks harus putus pada jeda baris lunak.

   - wrapWords: Apakah kata-kata yang tidak muat dalam satu baris harus dibungkus. Default ke true untuk berperilaku seperti Text.

   - overflow\*: Bagaimana luapan visual harus ditangani.

   - overflowReplacement: Jika teks meluap dan tidak sesuai dengan batasnya, widget ini akan ditampilkan sebagai gantinya.

   - textScaleFactor\*: Jumlah piksel font untuk setiap piksel logis. Juga memengaruhi minFontSize, maxFontSize, dan presetFontSizes.

   - maxLines: Jumlah baris maksimum opsional untuk teks yang akan dibentang.

   - semanticsLabel\*: Label semantik alternatif untuk teks ini.
