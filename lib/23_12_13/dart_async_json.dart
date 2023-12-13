import 'dart:convert';

class MovieInfo {
  String title;
  String director;
  int year;

  MovieInfo({
    required this.title,
    required this.director,
    required this.year,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'director': director,
      'year': year,
    };
  }

  factory MovieInfo.fromMap(Map<String, dynamic> map) {
    return MovieInfo(
      title: map['title'] as String,
      director: map['director'] as String,
      year: map['year'] as int,
    );
  }
}

void main() async {
  final String movieInfo = await getMovieInfo();
  print(MovieInfo.fromMap(jsonDecode(movieInfo)).director);
}

Future<String> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));
  final mockData = {
    'title': 'Star Wars',
    'director': 'George Lucas',
    'year': 1977,
  };

  return jsonEncode(mockData);
}
