import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math'; // Import the Random class

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.black,
    Colors.red,
    Colors.yellow,
    Colors.cyan,
    Colors.purple,
  ];

  // Yield colors every second using Stream.periodic
  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }
}

class NumberStream {
  // Tidak perlu menggunakan 'late' karena sudah langsung diinisialisasi
  final StreamController<int> controller = StreamController<int>();

  // Fungsi untuk menambahkan angka ke dalam stream
  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  // Fungsi untuk menutup stream controller
  void close() {
    controller.close();
  }

  // Stream that emits a random number between 0 and 9 every second
  Stream<int> getNumbers() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      Random random = Random();
      int myNum = random.nextInt(10); // Random number between 0 and 9
      return myNum;
    });
  }

  // Fungsi untuk menambahkan error ke dalam stream
  // void addError() {
  //   controller.sink.addError('error');
  // }
}
