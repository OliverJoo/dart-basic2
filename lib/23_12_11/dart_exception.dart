void main() {
  final numString = '10.5';

  // int num = int.tryParse(numString) ?? 0;

  int num;

  try {
    num = int.parse(numString);
  } catch (e) {
    num = 0;
    // throw Exception(e.toString());
  }

  print(num);
}
