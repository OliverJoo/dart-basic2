import 'dart:io';

final String validName = '한석봉';
final String changedName = '김석봉';


Future<void> futureFileCopy(String source, String target) async {
  final sourceFile = File(source);
  try {
    String data = await File(source).readAsString();
    if (data.contains(validName)) {
      data = data.replaceAll(validName, changedName);
    }
    await File(target).writeAsString(data);

    // for delayed print test
    await Future.delayed(Duration(seconds: 3));
    print('Copy File has been finished!');

  } on FileSystemException catch (e) {
    print(e.toString());
  }
}

void basicFileCopyFunctionByLine() {
  final targetFile = File('sample_copy.csv');

  for (String data in File('sample.csv').readAsLinesSync()) {
    if (data.contains(validName)) {
      targetFile.writeAsStringSync(data.replaceAll(validName, changedName), mode: FileMode.append);
    } else {
      targetFile.writeAsStringSync(data, mode: FileMode.append);
    }
    targetFile.writeAsStringSync('\n', mode: FileMode.append);
  }
  print('File File has been finished!');
}

void main() {
  print('File Copy Start!');
  futureFileCopy('sample.csv', 'sample_copy.csv');
  // basicFileCopyFunctionByLine();
  print('File Copy End?');
}