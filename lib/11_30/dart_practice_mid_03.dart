import 'dart:io';

void main() {
  List<String> strList = stdin.readLineSync()!.trim().split('').toList();
  int result = 0;

  for (String str in strList) {
    switch (str) {
      case '<':
        result += 10;
        break;
      case '/':
        result += 1;
        break;
      case '+':
        break;
    }
  }

  print(result);
}
