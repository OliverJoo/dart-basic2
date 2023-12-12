// custom exception test
void main() {
  final numString = '10.5';

  int num;

  try {
    num = int.parse(numString);
  } catch (e) {
    // num = 0;
    throw IntStringException(message: 'Here!');
  }

  print(num);
}

class IntStringException implements Exception {
  String _message;

  IntStringException({
    required String message,
  }) : _message = message;

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  @override
  String toString() {
    return 'IntStringException{ message : $_message}';
  }
}
