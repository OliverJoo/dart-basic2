// 901362
import "dart:convert";
import "package:http/http.dart" as http;

import "MovieDetail.dart";


void main() async {
  final moveiDetailInfo = Movie.fromJson(await getMovieDetailInfo(901362));
  print(moveiDetailInfo.toJson());
}

Future<Map<String, dynamic>> getMovieDetailInfo(int movieId) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/$movieId?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('Failed to load Movie Information');
  }
}
