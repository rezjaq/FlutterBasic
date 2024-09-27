# flutter-fundamental

# Nama : Rizqi Reza Danuarta

# NIM : 2141720057

# Kelas: TI-3C

### MINGGU KE - 4

### Praktikum 2

- Langkah 12

  ![alt text](/lib/image/image.png)

### Praktikum 3

- Langkah 1

  ![alt text](/lib/image/l1.png)

* Langkah 2

  ![alt text](/lib/image/l3.png)

### Praktikum 1 dan 3 Final

    ![alt text](/lib/image/p1&p3.png)

### Praktikum 4

- Langkah 1

```dart
return MaterialApp(
      home: Container(
        margin: const EdgeInsets.only(top: 30),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            CupertinoButton(
              child: const Text("Contoh button"),
              onPressed: () {},
            ),
            const CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
```

penjelasan : Program ini membuat sebuah aplikasi sederhana yang menampilkan:

- Sebuah tombol dengan teks "Contoh button" menggunakan gaya tombol iOS.
  Sebuah indikator aktivitas (spinner) yang terus berputar, menandakan proses yang sedang berjalan.
- Tata letaknya adalah secara vertikal, dengan tombol di bagian atas dan indikator di bawahnya.

* Langkah 2

```dart
return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(Icons.thumb_up),
          backgroundColor: Colors.pink,
        ),
      ),
    );
```

penjelasan :

- Aplikasi ini menampilkan sebuah halaman dengan tombol FloatingActionButton yang melayang di sudut kanan bawah layar.
  Tombol ini memiliki ikon jempol (thumb up), dan latar belakang tombolnya berwarna pink.
  Ketika tombol ditekan, fungsi dalam onPressed akan dieksekusi (saat ini kosong, jadi tidak ada aksi).

- Langkah 3

  ![alt text](lib/image/p4-l3.png)

- Langkah 4
  ![alt text](lib/image/p4-l4.png)

- Langkah 5
  ![alt text](lib/image/p4-l5.png)

- Langkah 6
  ![alt text](lib/image/p4-l6.png)

### Tugas Praktikum

![alt text](lib/image/tugas.png)

### MINGGU KE - 5

### Praktikum 1

### Langkah 2: Buka file lib/main.dart dan Langkah 4:Implementasi title row

```dart
// Langkah 2
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget titleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Gunung di Pulau Lombok, Nusa Tenggara Barat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Pulau Lombok, Nusa Tenggara Barat',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
          const Text('41'),
        ],
      ),
    );
  }
```

penjelasan :

      Kode di atas adalah bagian dari aplikasi Flutter yang mendefinisikan tampilan antarmuka pengguna menggunakan widget. Dimulai dengan fungsi utama main, kode ini menjalankan aplikasi dengan memanggil widget MyApp, yang merupakan StatelessWidget. Di dalam MyApp, terdapat fungsi titleSection yang bertanggung jawab untuk membuat bagian judul tampilan. Bagian ini menggunakan Container untuk memberikan padding, dan di dalamnya terdapat Row yang berisi kolom dan ikon. Kolom ini memuat dua teks: satu untuk judul yang ditampilkan dalam gaya tebal dan satu lagi untuk lokasi yang ditampilkan dalam warna abu-abu. Selain itu, terdapat ikon bintang merah dan teks yang menunjukkan jumlah bintang (41). Kode ini secara efektif menggunakan widget standar Flutter seperti Container, Row, Column, Text, dan Icon untuk menyusun elemen-elemen tampilan, sehingga menciptakan antarmuka yang informatif mengenai objek wisata di Pulau Lombok, lengkap dengan judul, lokasi, dan rating bintang.

### Praktikum 2

```dart
 @override
  Widget build(BuildContext context) {
    // Praktikum 2
    // Lngkah 2
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'Call'),
        _buildButtonColumn(color, Icons.near_me, 'Route'),
        _buildButtonColumn(color, Icons.share, 'Share'),
      ],
    );

    return MaterialApp(
      title: 'Flutter layout: Rizqi Reza Danuarta dan 2241720057',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Center(
          child: ListView(
            children: [
              Image.asset(
                'lib/image/rinjani.jpeg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection(),
              buttonSection,
              textSection,
              const Center(
                child: Text('Rizqi Reza Danuarta'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // praktikum 2
  // langkah 1
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
```

penjelasan :

    Kode di atas merupakan lanjutan dari aplikasi Flutter yang mendefinisikan tampilan antarmuka pengguna dengan menambahkan beberapa elemen interaktif. Dalam metode build, aplikasi memanfaatkan tema warna utama yang ditentukan dalam konteks untuk mendesain tombol. Terdapat bagian buttonSection yang diatur dalam Row dengan menggunakan MainAxisAlignment.spaceEvenly, berisi tiga tombol: "Call," "Route," dan "Share," yang dibangun dengan fungsi _buildButtonColumn. Setiap tombol terdiri dari ikon dan label yang sesuai, semuanya menggunakan warna utama aplikasi. Di dalam widget MaterialApp, terdapat struktur Scaffold yang mencakup AppBar dan body, di mana body terdiri dari ListView untuk menampilkan gambar dari aset lokal, bagian judul, tombol, dan teks lainnya

### Praktikum 3

```dart
// Praktikum 3
    // langkah 1
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Gunung Rinjani adalah gunung yang berlokasi di Pulau Lombok, Nusa Tenggara Barat. '
        'Gunung yang merupakan gunung berapi kedua tertinggi di Indonesia dengan ketinggian 3.726 mdpl '
        'serta terletak pada lintang 8º25 LS dan 116º28 BT ini merupakan gunung favorit bagi pendaki Indonesia '
        'karena keindahan pemandangannya.\n\n'
        'Gunung ini merupakan bagian dari Taman Nasional Gunung Rinjani '
        'yang memiliki luas sekitar 41.330 ha dan diusulkan penambahannya sehingga menjadi 76.000 ha ke arah barat dan timur.',
        softWrap: true,
      ),
    );
```

penjelasan :

    Kode di atas mendefinisikan bagian teks dalam aplikasi Flutter yang menjelaskan tentang Gunung Rinjani. Menggunakan widget Container, bagian ini diberikan padding untuk memberikan ruang di sekeliling teks, sehingga lebih mudah dibaca. Teks yang ditampilkan memberikan informasi detail tentang Gunung Rinjani

### Praktikum 4

```dart
body: Center(
          child: ListView(
            children: [
              Image.asset(
                'lib/image/rinjani.jpeg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection(),
              buttonSection,
              textSection,
              const Center(
                child: Text('Rizqi Reza Danuarta'),
              ),
            ],
          ),
        ),
```

penjelasan :

    Image.asset untuk menampilkan gambar dari file aset yang telah didefinisikan dalam file pubspec.yaml. Gambar yang ditampilkan adalah rinjani.jpeg, yang memiliki lebar 600 piksel dan tinggi 240 piksel, dengan pengaturan BoxFit.cover untuk memastikan bahwa gambar akan mengisi ruang yang tersedia dengan menjaga proporsinya. Penempatan gambar ini berada di dalam widget ListView, yang memungkinkan pengguna untuk menggulir melalui konten jika diperlukan. Selain itu, terdapat juga definisi aset gambar dalam bagian assets dari file pubspec.yaml, yang mencantumkan dua gambar: logo_polinema.png dan rinjani.jpeg.
