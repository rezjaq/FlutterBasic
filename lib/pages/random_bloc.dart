import 'dart:async';
import 'dart:math';

class RandomNumberBloc {
  final _randomNumberController = StreamController<int>();
  Stream<int> get randomNumber => _randomNumberController.stream;

  final _generateRandomNumberController = StreamController<void>();
  Sink<void> get generateRandomNumber => _generateRandomNumberController.sink;

  RandomNumberBloc() {
    _generateRandomNumberController.stream.listen((_) {
      final random = Random();
      _randomNumberController.sink.add(random.nextInt(10));
    });
  }

  void dispose() {
    _randomNumberController.close();
    _generateRandomNumberController.close();
  }
}
