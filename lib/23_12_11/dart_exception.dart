void main() {
  final numString = '10.5';

  int num;

  try {
    num = int.parse(numString);
  } catch (e) {
    num = 0;
  }

  print(num);
}
