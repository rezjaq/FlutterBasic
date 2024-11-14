# flutter-fundamental

# Nama : Rizqi Reza Danuarta

# NIM : 2141720057

# Kelas: TI-3C

<br>

# Minggu Ke-12

# Praktikum 1: Dart Streams

## Soal 1

```dart
import 'package:flutter/material.dart';

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
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({Key? key}) : super(key: key);

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

## Soal 2

```dart
import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    // 5 wanra lainnya
    Colors.black,
    Colors.red,
    Colors.yellow,
    Colors.cyan,
    Colors.purple
  ];
  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }
}
```

## Soal 3

jawaban : digunakan untuk mengoper aliran (stream) yang dihasilkan dari Stream.periodic ke dalam stream getColors secara langsung

## Soal 4

![praktikum 1](/lib/image/gift/m12-p1.gif)

## Soal 5

listen dan await for adalah dua cara berbeda untuk berinteraksi dengan Stream di Dart, masing-masing memiliki keunggulan berdasarkan kebutuhan pemrosesan data. listen bekerja dengan mengeksekusi callback setiap kali data baru masuk tanpa harus menunggu elemen sebelumnya selesai diproses, sehingga cocok untuk aplikasi yang membutuhkan respons cepat dan langsung dari stream. Di sisi lain, await for memastikan bahwa data dari stream diproses satu per satu secara berurutan, menunggu hingga setiap elemen selesai sebelum melanjutkan ke elemen berikutnya.

# Praktikum 2 : Stream controllers dan sinks

## Soal 6

![alt text](/lib/image/m12-p2.png)

# Praktikum 3 :

![alt text](/lib/image/gift/m12-p2.gif)

## Soal 7

Langkah 13 - void addNumberToSink(int newNumber):
Fungsi ini bertujuan untuk menambahkan angka (dalam parameter newNumber) ke dalam Stream. Fungsi ini menggunakan controller.sink.add(newNumber) untuk mengirim angka baru ke stream. Setiap kali angka baru ditambahkan, stream akan memperbarui pendengarnya.

Langkah 14 - void close():
Fungsi ini menutup StreamController agar tidak menerima input lagi. Ini merupakan langkah penting untuk mencegah kebocoran memori. Ketika controller.close() dipanggil, maka stream tidak akan menerima data tambahan atau mendengarkan perubahan apapun.

Langkah 15 - void addError():
Fungsi ini bertujuan untuk menambahkan error ke dalam stream dengan cara memanggil controller.sink.addError('error'). Ini akan memicu error pada stream, yang memungkinkan kita menguji bagaimana aplikasi menangani situasi ketika terjadi kesalahan pada data stream. Dalam konteks ini, menambahkan error ini berfungsi untuk simulasi saja.

![alt text](/lib/image/gift/m12-p3.gif)

## Soal 8

Langkah pertama mendeklarasikan sebuah variabel transformer bertipe StreamTransformer<int, int> yang akan digunakan untuk memanipulasi data yang diterima oleh stream. StreamTransformer ini diinisialisasi dengan menggunakan fromHandlers, yang memungkinkan kita untuk mengatur penanganan data, error, dan saat stream selesai.

Langkah kedua mendefinisikan tiga handler dalam fromHandlers:

handleData: Ketika ada data yang diterima, nilai tersebut akan diteruskan ke sink tanpa perubahan, yaitu dengan sink.add(value).
handleError: Jika ada error yang terjadi, maka error tersebut akan di-handle dengan mengirimkan nilai -1 ke sink menggunakan sink.add(-1).
handleDone: Ketika stream selesai, handler ini akan dipanggil untuk menutup stream menggunakan sink.close().
Langkah ketiga adalah memanfaatkan transformer tersebut dengan memanggil numberStreamController.stream.transform(transformer), yang menghubungkan stream dengan transformer yang sudah didefinisikan. Kemudian, menggunakan listen untuk mendengarkan data yang diterima, dan jika ada data yang masuk, nilai tersebut akan diset ke dalam lastNumber. Jika terjadi error, maka nilai lastNumber akan diset menjadi -1.

# Praktikum 4 : Subscribe ke stream events

## Soal 9

![alt text](/lib/image/m11-p9.png)

initState() digunakan untuk menginisialisasi objek yang diperlukan dan memulai aliran data stream. Di dalam metode ini, objek numberStream dan numberStreamController diinisialisasi, yang memungkinkan untuk mengelola aliran data integer. Stream numberStreamController.stream dilanjutkan dengan mendengarkan setiap perubahan yang terjadi dalam aliran data tersebut menggunakan stream.listen. Ketika data baru (angka) diterima, fungsi callback di dalam setState() akan memutakhirkan nilai lastNumber, yang ditampilkan pada antarmuka pengguna. Jika terjadi kesalahan dalam aliran data, onError akan dipanggil, dan nilai lastNumber akan diubah menjadi -1. Fungsi onDone dipanggil ketika aliran data selesai, dan mencetak pesan "onDone was called". Di akhir dari initState(), pemanggilan subscription.cancel() akan menghentikan aliran data (subscription) yang sudah aktif.

Sedangkan pada fungsi addRandomNumber(), angka acak antara 0 hingga 9 dihasilkan menggunakan objek Random, dan jika stream masih terbuka (belum ditutup), angka tersebut ditambahkan ke stream dengan memanggil metode numberStream.addNumberToSink(myNum). Jika stream sudah ditutup, lastNumber diubah menjadi -1 untuk menunjukkan bahwa aliran data sudah tidak aktif lagi.

# Praktikum 5 : Multiple stream subscriptions

![alt text](/lib/image/m12-p5.png)

Error tersebut muncul karena stream yang disini yang digunakan adalah single-subscription stream (yaitu StreamController<int>), yang hanya bisa didengarkan sekali. Solusinya adalah dengan menggunakan StreamController.broadcast()

## Soal 11

![alt text](/lib/image/gift/m12-p5.gif)

Kedua subscription (subscription dan subscription2) mendengarkan stream yang sama, sehingga setiap kali event baru ditambahkan ke stream (numberStreamController.sink.add(currentNumber)), kedua subscription akan menerima dan memproses event tersebut. Setiap event yang diterima akan mengupdate string values yang ada pada widget dengan menambahkan nilai yang diterima, diikuti dengan tanda -. Oleh karena itu, nilai yang sama akan ditampilkan dua kali berturut-turut di dalam tampilan, satu untuk setiap subscription.

Sebagai contoh, saat angka pertama kali ditambahkan ke stream, kedua subscription akan mendengarkan stream dan masing-masing menambahkan angka yang sama ke string values. Akibatnya, pada output yang ditampilkan di layar, angka tersebut akan muncul dua kali berturut-turut (misalnya "0 - 0 - 10 - 10 - 20 - 20 - ..." dan seterusnya).

Untuk menghindari pengulangan seperti ini, Anda bisa memilih untuk memiliki satu subscription saja atau menambahkan logika tambahan untuk membedakan mana event yang sudah diproses oleh satu subscription, namun dalam konteks ini, memang sengaja diizinkan untuk dua subscription mendengarkan stream yang sama.

# Praktikum 6 : StreamBuilder

## Soal 11

![alt text](/lib/image/gift/m12-p6.gif)
Metode Stream (getNumbers):
Metode getNumbers adalah sebuah stream yang secara berkala menghasilkan angka acak. Ini menggunakan Stream.periodic, yang menghasilkan nilai baru pada interval waktu yang teratur—dalam hal ini setiap detik (didefinisikan dengan Duration(seconds: 1)). Di dalam fungsi callback (int t), sebuah angka acak antara 0 dan 9 dihasilkan menggunakan kelas Random dari dart:math. Stream ini akan terus menghasilkan dan mengeluarkan angka acak selama stream tersebut aktif.

StreamBuilder pada Widget:
Pada metode build, widget menggunakan StreamBuilder<int> untuk mendengarkan stream yang berisi angka dari numberStream. StreamBuilder memerlukan dua parameter utama:

stream: Ini adalah stream yang didengarkan oleh widget, yang dalam hal ini adalah numberStream (kemungkinan merupakan instansi dari kelas NumberStream).
initialData: Ini adalah nilai awal yang digunakan oleh StreamBuilder sebelum ada data yang diterima dari stream. Di sini, nilainya diset menjadi 0.
Fungsi callback builder dari StreamBuilder memeriksa status stream. Jika ada kesalahan (snapshot.hasError), maka akan mencetak pesan kesalahan. Jika ada data (snapshot.hasData), maka akan menampilkan nilai saat ini dari stream (snapshot.data) dalam bentuk teks di layar. Jika stream belum memiliki data, akan ditampilkan widget kosong (SizedBox.shrink()).

# Praktikum 7 : BLoC Pattren

## Soal 13

![alt text](/lib/image/gift/m12-p7.gif)

StreamController untuk Manajemen Data:

RandomNumberBloc bertanggung jawab untuk menghasilkan angka acak dan mengelolanya menggunakan StreamController<int>.
StreamController digunakan untuk menangani aliran data yang akan diterima oleh tampilan UI. Dalam hal ini, stream yang digunakan adalah angka acak.
Sink<void> generateRandomNumber digunakan untuk mengirimkan event ke dalam stream (misalnya ketika tombol ditekan untuk menghasilkan angka acak).
RandomNumberBloc mendengarkan stream dari \_generateRandomNumberController, dan setiap kali ada event yang dikirim ke stream tersebut, angka acak akan dihasilkan dan disalurkan melalui \_randomNumberController.stream.
Stream dan StreamBuilder untuk Komunikasi dengan UI:

Pada RandomScreen, terdapat sebuah StreamBuilder<int> yang mendengarkan stream dari RandomNumberBloc untuk mendapatkan angka acak yang terbaru.
StreamBuilder digunakan untuk membangun UI berdasarkan data terbaru dari stream. Ketika angka acak baru dihasilkan oleh stream, UI akan otomatis diperbarui tanpa perlu intervensi manual dari pengembang.
Memisahkan Logika dari Tampilan:

UI (RandomScreen) hanya berfokus pada tampilan dan tidak berurusan dengan logika bisnis pembuatan angka acak.
BLoC (RandomNumberBloc) bertanggung jawab penuh dalam menghasilkan angka acak. UI cukup mendengarkan stream dan merender data tersebut.
Dengan memisahkan logika bisnis dari tampilan, kode menjadi lebih bersih, mudah dipelihara, dan lebih mudah untuk diuji.
Letak Konsep BLoC:
Data Stream: Angka acak dihasilkan dan disalurkan menggunakan stream (StreamController<int>). Konsep stream di sini adalah inti dari pola BLoC untuk mengelola dan menyebarkan data secara reaktif.
Sink untuk Event: Saat tombol ditekan (FloatingActionButton), sebuah event (perintah untuk menghasilkan angka acak) dikirimkan ke sink melalui generateRandomNumber.add(null). Ini menunjukkan bagaimana event dikendalikan di dalam BLoC.
StreamBuilder untuk UI: UI hanya mendengarkan stream dan menampilkan data yang diterima dari BLoC, tanpa berurusan langsung dengan logika bisnis.
