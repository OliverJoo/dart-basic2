import "dart:convert";
import "package:http/http.dart" as http;

import "MovieInfo.dart";

void main() async {
  final moveiInfo = MoiveInfo.fromJson(await getMovieInfo());
  print(moveiInfo.toJson());
}

Future<Map<String, dynamic>> getMovieInfo() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('Failed to load Movie Information');
  }
}
