import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void call(Function() callback) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), callback);
  }
}
