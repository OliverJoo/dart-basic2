class Word {
  String word = 'teEVX';

  bool isVowel(int i) {
    final List<String> strList = [
      'a',
      'e',
      'i',
      'o',
      'u',
      'A',
      'E',
      'I',
      'O',
      'U'
    ];

    return strList.contains(word.substring(i, i + 1));
  }
}