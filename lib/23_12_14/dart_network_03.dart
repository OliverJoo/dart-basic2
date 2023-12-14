import "dart:convert";
import "dart:io";
import "dart:typed_data";
import "package:http/http.dart" as http;

final String iconFileName = 'icon.ico';
final String imageUrl = 'https://alimipro.com/favicon.ico';

void main() async {
  final stopwatch = Stopwatch();

  print('다운로드 시작');

  stopwatch.start();
  saveFile(await downloadImage(imageUrl), iconFileName)
      .then((value) => stopwatch.stop());

  print('다운로드 끝');
  print('===========');
  print('소요시간 : ${stopwatch.elapsed}');

  final byte = (await File(iconFileName).readAsBytes()).length;
  print('용량 $byte bytes');
}

Future<File> saveFile(Uint8List bytes, String fileName) async {
  return File(fileName).writeAsBytes(bytes);
}

Future<Uint8List> downloadImage(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Failed to load Movie Information');
  }
}
