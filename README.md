# flutter-fundamental

# Nama : Rizqi Reza Danuarta

# NIM : 2141720057

# Kelas: TI-3C

<br>

# Minggu Ke-11

# Praktikum 1: Mengunduh Data dari Web Service (API)

## Langkah 1: Buat Project Baru

```dart
flutter pub add http
```

## Langkah 2: Cek File pubspec.yaml

![alt text](/lib/image/m11-p1-l2.png)

## Langkah 3: buka file main.dart

Soal 1
Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda

```dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rizqi Reza Danuarta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({Key? key}) : super(key: key);

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  // late Completer<int> completer;

  String result = '';
  // bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back From the Future'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('GO!'),
              onPressed: () {
                // returnFG();
                // getNumber().then((value){
                //   setState(() {
                //     result = 'Result: $value';
                //   });
                // });
                // setState(() {
                //   isLoading = true;
                //   result = '';
                // });
                // getNumber().then((value) {
                //   setState(() {
                //     result = value.toString();
                //     isLoading = false;
                //   });
                // }).catchError((_) {
                //   setState(() {
                //     result = 'An error occurred';
                //     isLoading = false;
                //   });
                // });
              },
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            // if (isLoading) const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
```

## Langkah 4: Tambah Method getData()

```dart
Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/junbDwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }
```

## Soal 2

![alt text](/lib/image/m11-p1-soal2.png)

## Langkah 5: Tambahkan kode di elevaluatedButton

```dart
onPressed: () {
                setState(() {});
                getData().then((value) {
                  result = value.body.toString().substring(0, 450);
                  setState(() {});
                }).catchError((_) {
                  result = 'An error occured';
                  setState(() {});
                });
```

## Soal 3

- SubString : mengambil data yang diterima dari hasil permintaan HTTP (value.body) dalam bentuk teks, kemudian mengonversinya menjadi String (jika belum berupa String) dan menggunakan substring(0, 450) untuk memotong hanya 450 karakter pertama dari teks tersebut.

* catcheror : digunakan di sini untuk menangani kondisi ketika getData() mengalami kesalahan, seperti koneksi gagal atau respons dari server tidak sesuai harapan. Jika terjadi kesalahan, variabel result akan diubah menjadi 'An error occured', dan setState dipanggil untuk memperbarui tampilan UI agar pesan kesalahan tersebut dapat muncul di layar.

![alt text](/lib/image/m11-p1-soal3.png)

# Praktikum 2: Menggunakan await/async untuk menghindari callbacks

## Langkah 1: Buka file main.dart

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
Future<void> count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }
```

## Soal 4

- jelaskan maksud kode langkah 1 dan 2 jelaskan
- langkah 1 : Fungsi returnOneAsync, returnTwoAsync, dan returnThreeAsync adalah fungsi asynchronous yang masing-masing menunda eksekusi selama 3 detik menggunakan Future.delayed. Setelah penundaan tersebut, setiap fungsi mengembalikan nilai integer tetap, yaitu 1, 2, dan 3 secara berurutan. Fungsi ini berguna untuk mensimulasikan proses asynchronous, seperti panggilan jaringan atau operasi pemrosesan data, yang memerlukan waktu sebelum hasilnya tersedia.

* langkah 2 : Fungsi count adalah fungsi asynchronous yang digunakan untuk menghitung total dari hasil tiga fungsi asynchronous lainnya: returnOneAsync, returnTwoAsync, dan returnThreeAsync. Pada setiap pemanggilan fungsi, await digunakan untuk menunggu nilai yang dikembalikan sebelum melanjutkan ke pemanggilan berikutnya. Nilai yang dikembalikan dari ketiga fungsi ini dijumlahkan dan disimpan dalam variabel total. Setelah ketiga operasi selesai, setState dipanggil untuk memperbarui nilai result pada tampilan dengan hasil total tersebut.

# Praktikum 3: Menggunakan Completer di Future

## Langkah 1: buka main.dart

```dart
import 'package:async/async.dart';
```

## Langkah 2: Tambah variabel dan method

```dart
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds : 5));
  completer.complete(42);
}
```

## Langkah 3: Ganti isi kode onPresed()

```dart
onPressed: () {
                getNumber().then((value) {
                  setState(() {
                    result = value.toString();
                  });
                });
```

## Langkah 4:

![alt text](/lib/image/m11-p3-l4.png)

## Soal 5

- langkah 2: Completer untuk mengelola operasi asynchronous secara manual. Pertama, variabel completer dideklarasikan dengan tipe Completer<int>, yang akan digunakan untuk menyelesaikan sebuah Future dengan nilai integer. Fungsi getNumber menginisialisasi completer, memanggil fungsi calculate, dan kemudian mengembalikan completer.future, yaitu Future yang akan diselesaikan nanti. Fungsi calculate adalah fungsi asynchronous yang menunggu selama 5 detik menggunakan Future.delayed, kemudian memanggil completer.complete(42) untuk menyelesaikan Future dengan nilai 42. Dengan demikian, ketika getNumber dipanggil, ia akan mengembalikan sebuah Future yang akan menyelesaikan nilai 42 setelah jeda waktu 5 detik, memungkinkan pengelolaan alur asynchronous secara eksplisit dalam aplikasi.

## Langkah 5: ganti method calculate()

```dart
Future<void> calculate() async {
    // await Future.delayed(const Duration(seconds: 5));
    // completer.complete(42);
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    } catch (_) {
      completer.completeError('Error calculating the number');
    }
  }
```

## Langkha 6: pindah ke onpresed()

```dart
getNumber().then((value) {
  setState(() {
    result = value.toString();
  });
}).catchError((e) {
  result = 'An error occurred';
});
```

## Soal 6

- langkah 5-6 : calculate secara asynchronous menunggu selama 5 detik menggunakan Future.delayed. Setelah waktu tunggu, completer.complete(42) dipanggil untuk menyelesaikan Future dengan nilai 42. Jika terjadi error selama eksekusi, completer.completeError('Error calculating the number') akan dipanggil, sehingga Future menghasilkan error. Pemanggilan getNumber() akan mengembalikan Future tersebut. Kemudian, then digunakan untuk menangani hasil dari Future dan menampilkan hasil value (dalam bentuk String) ke dalam variabel result di dalam setState. Jika terjadi error, catchError akan menampilkan pesan 'An error occurred' di result.

## Praktikum 4: Memanggil Future secara paralel

## Langkah 1: buka file main.dart

```dart
void returnFG() {
    FutureGroup<int> futureGroup = FutureGroup();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = total.toString();
      });
    });
  }
```

## Langkah 2: edit onPresed()

```dart
returnFG();
```

## Soal 7

![alt text](/lib/image/m11-p4-l2.png)

## Langkah 4: ganti variabel futureGroup

```dart
void returnFG() {
  final futures = Future.wait<int>([
    returnOneAsync(),
    returnTwoAsync(),
    returnThreeAsync(),
  ]);

  futures.then((List<int> value) {
    int total = 0;
    for (var element in value) {
      total += element;
    }
    setState(() {
      result = total.toString();
    });
  });
}
```

## Soal 8

- Jelaskan maksud perbedaan kode langkah 1 dan 4 : Perbedaan antara kode langkah 1 dan langkah 4 terletak pada cara menangani beberapa Future secara bersamaan. Pada kode langkah 1, digunakan FutureGroup, yang memungkinkan penambahan beberapa Future secara manual satu per satu dan kemudian menunggu hasilnya setelah grup Future ditutup dengan futureGroup.close(). Sedangkan pada kode langkah 4, digunakan Future.wait(), yang langsung menerima sebuah daftar Future dan mengembalikan Future yang selesai ketika semua Future di dalam daftar tersebut selesai. Kode langkah 4 lebih ringkas karena langsung menggunakan Future.wait() untuk mengelola beberapa Future tanpa perlu menambahkannya satu per satu.

# Praktikum 5: Menangani Respon Error pada Async Code

## Langkah 1: buka file main.dart

```dart
Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something went wrong');
  }
```

## Langkah 2: Evalated Button

```dart
onPressed: () {
                returnError().then((value) {
                  setState(() {
                    result = 'Succes';
                  });
                }).catchError((onError) {
                  setState(() {
                    result = onError.toString();
                  });
                }).whenComplete(() => print('completed'));
```

## Langkah 3: Run

## Soal 9

![alt text](/lib/image/m11-p5-l3.png)

## Langkah 4: tambah method handleError()

```dart
Future handleError() async {
    try {
      await returnError();
    } catch (error) {
      setState(() {
        result = error.toString();
      });
    } finally {
      print('complete');
    }
  }
```

## Soal 10

- Panggil method handleError() tersebut di ElevatedButton, lalu run. Apa hasilnya? Jelaskan perbedaan kode langkah 1 dan 4!

![alt text](/lib/image/m11-p5-soal10.png))
meskipun hasilnya sama namun dalam pembacaan kode sudah berhasil untuk menangani atau menghandle eror berikut adalah buktinya dalam bentuk terminal

![alt text](/lib/image/m11-p5-soal10output.png)

# Praktikum 6: Menggunakan Future dengan StatefulWidget

## Langkah 1: install plugin geolocator

```dart
flutter pub add geolocator
```

## Langkah 2: Tambah permission GPS

```dart
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
    <application
```

## Langkah 3: Buat file geolocation.dart

```dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';

  @override
  void initState() {
    super.initState();
    getPosition().then((Position myPos) {
      myPosition =
          'Latitude: ${myPos.latitude.toString()} - Longitude: ${myPos.longitude.toString()}';
      setState(() {
        myPosition = myPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location')),
      body: Center(child: Text(myPosition)),
    );
  }

  Future<Position> getPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
```

## Soal 11

- Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.

![alt text](/lib/image/m11-p6-soal11.png)

## Soal 12

- Jika Anda tidak melihat animasi loading tampil, kemungkinan itu berjalan sangat cepat. Tambahkan delay pada method getPosition() dengan kode await Future.delayed(const Duration(seconds: 3));
- Apakah Anda mendapatkan koordinat GPS ketika run di browser? Mengapa demikian?

jawaban : Di browser, terutama di emulator atau pengembangan Flutter Web, akses ke GPS mungkin tidak langsung tersedia karena browser tidak selalu mendukung akses perangkat keras seperti GPS (terutama jika diakses di desktop atau laptop)

# Praktikum 7: Manajemen Future dengan FutureBuilder

## Soal 13

-Apakah ada perbedaan UI dengan praktikum sebelumnya? Mengapa demikian?
Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 13".

jawaban : iya terdapat perbedaan dimana animation loading dulu yang ditampilkan setelah itu baru locationnya di munculkan

## Soal 14

jawaban : terdapat sedikit perbedaan ui dikarenakan pada kode sebelumnya masih belum ada handling error

# Praktikum 8: Navigation route dengan Future Function

![alt text](/lib/image/m11-p8.png)
![alt text](/lib/image/m11-p8-1.png)
![alt text](/lib/image/m11-p8-red.png)
![alt text](/lib/image/m11-p8-green.png)

# Praktikum 9: Memanfaatkan async/await dengan Widget Dialog

![alt text](image.png)
