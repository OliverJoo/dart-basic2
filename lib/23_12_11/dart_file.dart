import 'dart:convert';
import 'dart:io';

void copy(String source, String target) {
  final sourceFile = File(source);
  final targetFile = File(target);

  targetFile.writeAsStringSync(sourceFile.readAsStringSync());
}

void main() {
  final file = File('source.txt');
  // file.writeAsStringSync('source file is here!');

  print(file.readAsStringSync());
  copy('source.txt', 'target.txt');
}
