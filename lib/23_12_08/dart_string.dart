class Word {
  String word = 'teEVX';

  bool isVowel(int i) {
    final List<String> strList = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U' ];

    return strList.contains(word.substring(i, i + 1));
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }
}

void main() {
  final wordChk = Word();

  for (int i = 0; i < wordChk.word.length; i++) {
    String chkWord = wordChk.word.substring(i, i+1);
    print('$chkWord is Vowel : ${wordChk.isVowel(i)}');
    print('$chkWord is Consonant : ${wordChk.isConsonant(i)}');
  }
}
