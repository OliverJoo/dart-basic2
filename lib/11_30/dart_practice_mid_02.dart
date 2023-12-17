import 'dart:io';

void main() {
  List<int> cardNumbers = inputParameters();
  int? firstNumber;
  int? secondNumber;

  while (cardNumbers.length != 4) {
    print('4개의 숫자를 입력하셔야 합니다. 다시 입력해주세요');
    cardNumbers = inputParameters();
  }

  print(createNumber(cardNumbers[0], cardNumbers[1]) +
      createNumber(cardNumbers[2], cardNumbers[3]));
}

int createNumber(int firstNumb, int secondNumb) {
  if (firstNumb > secondNumb) {
    return int.parse(firstNumb.toString() + secondNumb.toString());
  } else {
    return int.parse(secondNumb.toString() + firstNumb.toString());
  }
}

List<int> inputParameters() {
  List<int>? intList = [];

  String? oneLine = stdin.readLineSync();
  List<String> strList = oneLine!.trim().split(' ').toList(); // don't use !

  for (String str in strList) {
    intList.add(int.parse(str));
  }

  return intList;
}
