import 'dart:io';

void main() {
  List<int> noisyPlaceInfo = inputParameters();
  List<int> shadowPlacesCnt = inputParameters();
  List<int> shadowPlacesInfo = [];

  for (int i = 0; i < shadowPlacesCnt[0]; i++) {
    shadowPlacesInfo.addAll(inputParameters());
  }

  for (int i = 0; i < shadowPlacesCnt[0]; i++) {

    int arrayNumber = i;
    if (i > 0) {
      arrayNumber = i * 2;
    }
    int distance = square(noisyPlaceInfo[0] - shadowPlacesInfo[arrayNumber]) +
        square(noisyPlaceInfo[1] - shadowPlacesInfo[arrayNumber + 1]);

    if (distance > square(noisyPlaceInfo[2])) {
      print('silent');
    } else {
      print('noisy');
    }
  }

}

int square(int x) {
  return x * x;
}

List<int> inputParameters() {
  List<int>? intList = [];

  String? oneLine = stdin.readLineSync();
  List<String> strList = oneLine!.trim().split(' ').toList();

  for (String str in strList) {
    intList.add(int.parse(str));
  }

  return intList;
}
