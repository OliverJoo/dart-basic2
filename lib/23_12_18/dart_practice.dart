import 'package:collection/collection.dart';

void main() {
}

class TestClass {

  bool isEven(int n) {
    return n.isEven;
  }

  int findMax(List<int> intList){
    return intList.max;
  }

  String reverseString(String str){
    return str.split('').reversed.join();
  }
}