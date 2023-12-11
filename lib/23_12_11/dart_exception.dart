void main() {
  final numString = '10.5';

  int num = 0;

  try {
    num = int.parse(numString);
  } catch (e) {
    num = 0;
  }

  print(num);
}
