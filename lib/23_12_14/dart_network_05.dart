import "dart:io";
import "dart:typed_data";
import "package:http/http.dart" as http;

final String imageUrl1 = 'https://en.wikipedia.org/wiki/File:Image_created_with_a_mobile_phone.png';
final String imageUrl2 = 'https://upload.wikimedia.org/wikipedia/commons/a/a8/TEIDE.JPG';
final String imageUrl3 = 'https://en.wikipedia.org/wiki/Image#/media/File:Pencil_drawing_of_a_girl_in_ecstasy.jpg';

final String imageFileName1 = 'Image_created_with_a_mobile_phone.png';
final String imageFileName2 = 'TEIDE.JPG';
final String imageFileName3 = 'Pencil_drawing_of_a_girl_in_ecstasy.jpg';

void main() async {
  final stopwatch = Stopwatch();

  print('순차처리 다운로드 시작');

  stopwatch.start();
  downloadImageFiles().then((value) => stopwatch.stop());
  print('순차처리 다운로드 끝');
  print('순차처리 소요시간 : ${stopwatch.elapsed}');
  print('===========');
  stopwatch.reset();

  stopwatch.start();
  print('병렬처리 다운로드 시작');
  downloadImageFilesParallel().then((value) => stopwatch.stop());

  print('병렬처리 다운로드 끝');
  print('병렬처리 소요시간 : ${stopwatch.elapsed}');
}

// 3개의 이미지 순차처리
Future<void> downloadImageFiles() async {
  List<File> saveFiles = [
    await downloadImage(imageUrl1, imageFileName1),
    await downloadImage(imageUrl2, imageFileName2),
    await downloadImage(imageUrl3, imageFileName3),
  ];
}

// 3개의 이미지 병렬처리
Future<void> downloadImageFilesParallel() async {
  List<Future<File>> saveFiles = [
    downloadImage(imageUrl1, imageFileName1),
    downloadImage(imageUrl2, imageFileName2),
    downloadImage(imageUrl3, imageFileName3),
  ];
}

Future<File> downloadImage(String url, String fileName) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return File(fileName).writeAsBytes(response.bodyBytes);
  } else {
    throw Exception('Failed to load Movie Information');
  }
}
