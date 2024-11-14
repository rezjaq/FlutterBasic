import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_fundamental/pages/random_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Example',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: RandomScreen(),
    );
  }
}

class NumberStream {
  late StreamController<int> controller;

  NumberStream() {
    controller = StreamController<int>.broadcast();
  }

  void addNumberToSink(int number) {
    controller.sink.add(number);
  }

  Stream<int> getNumber() {
    return controller.stream;
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({Key? key}) : super(key: key);

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class RandomNumberBloc {
  final _randomNumberController = StreamController<int>();
  Stream<int> get randomNumber => _randomNumberController.stream;
  final _generateRandomNumberController = StreamController<void>();
  Sink<void> get generateRandomNumber => _generateRandomNumberController.sink;

  RandomNumberBloc() {
    _generateRandomNumberController.stream.listen((_) {
      final random = Random();
      _randomNumberController.sink.add(random.nextInt(100));
    });
  }

  void dispose() {
    _randomNumberController.close();
    _generateRandomNumberController.close();
  }
}

class _StreamHomePageState extends State<StreamHomePage> {
  final _bloc = RandomNumberBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Number'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.randomNumber,
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Random Number: ${snapshot.data}',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.generateRandomNumber.add(null),
        child: const Icon(Icons.refresh),
      ),
    );
  }

  // int lastNumber = 0;
  // late StreamController<int> numberStreamController;
  // late StreamSubscription subscription;
  // late StreamSubscription subscription2;
  // String values = '';
  // late Timer _timer;
  // int currentNumber = 0;
  // late NumberStream numberStream;

  // @override
  // void initState() {
  //   super.initState();

  //   numberStream = NumberStream();
  //   numberStreamController = numberStream.controller;

  //   subscription = numberStreamController.stream.listen((event) {
  //     setState(() {
  //       values += '$event - ';
  //     });
  //   }, onError: (error) {
  //     setState(() {
  //       lastNumber = -1;
  //     });
  //   }, onDone: () {
  //     print('onDone was called');
  //   });

  //   subscription2 = numberStreamController.stream.listen((event) {
  //     setState(() {
  //       values += '$event - ';
  //     });
  //   });

  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     if (currentNumber <= 90) {
  //       numberStreamController.sink.add(currentNumber);
  //       currentNumber += 10;
  //     } else {
  //       _timer.cancel();
  //     }
  //   });
  // }

  // void stopStream() {
  //   numberStreamController.close();
  // }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   numberStreamController.close();
  //   subscription.cancel();
  //   subscription2.cancel();
  //   super.dispose();
  // }

  // void addRandomNumber() {
  //   Random random = Random();
  //   int myNum = random.nextInt(10);
  //   if (!numberStreamController.isClosed) {
  //     numberStream.addNumberToSink(myNum);
  //   } else {
  //     setState(() {
  //       lastNumber = -1;
  //     });
  //   }
  // }

  // void triggerError() {
  //   numberStreamController.sink.addError('Something went wrong');
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Stream Example'),
  //     ),
  //     body: SizedBox(
  //       width: double.infinity,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Text(
  //             'Last Number: $lastNumber',
  //             style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
  //           ),
  //           Text(values),
  //           ElevatedButton(
  //             onPressed: addRandomNumber,
  //             child: const Text('New Random Number'),
  //           ),
  //           ElevatedButton(
  //             onPressed: triggerError,
  //             child: const Text('Trigger Error'),
  //           ),
  //           ElevatedButton(
  //             onPressed: stopStream,
  //             child: const Text('Stop Subscription'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
