import 'dart:html';

import 'package:intl/intl.dart';

final String sameBookMsg = '같은 책 입니다.';
final String differentBookMsg = '다른 책 입니다.';

class Book implements Comparable<Book> {
  String title;
  DateTime publishDate = DateTime.now();
  String comment;

  Book({
    required this.title,
    required this.publishDate,
    required this.comment,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          DateFormat('yyyy-MM-dd').format(publishDate) ==
              DateFormat('yyyy-MM-dd').format(other.publishDate);

  @override
  int get hashCode => title.hashCode ^ DateFormat('yyyy-MM-dd').format(publishDate).hashCode;

  // 3. deep copy 지원
  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment,
  }) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      comment: comment ?? this.comment,
    );
  }

  // 2. 출간일이 오래된 순서대로 정렬
  @override
  int compareTo(Book other) {
    return publishDate.compareTo(other.publishDate);
  }

  @override
  String toString() {
    return 'Book{title: $title, publishDate: $publishDate, comment: $comment}';
  }
}

void main() {
  final DateTime datetimeNow = DateTime.now();

  final book1 = Book(title: '책1', comment: '굳!', publishDate: datetimeNow);
  final book2 = book1.copyWith(comment: '나이스!');
  final DateTime datetimeNow2 = DateTime(2023, 12, 7, 16, 00, 20);
  final book3 = book1.copyWith(comment: '나이스!', publishDate: datetimeNow2);
  final DateTime datetimeNow3 = DateTime(2023, 12, 7, 16, 50, 20);
  final book4 = Book(title: '책1',comment: '베스트셀러!', publishDate: datetimeNow3);

  // 1. 제목과 출간일이 같으면 같은 책으로 판단
  print((book1 == book2) ? sameBookMsg : differentBookMsg); // 이름과 출간일이 같음
  print((book1 == book3) ? sameBookMsg : differentBookMsg); // 출간일이 다름
  print((book1 == book4) ? sameBookMsg : differentBookMsg); // 책 이름과 출간일이 다름
  print((book3 == book4) ? sameBookMsg : differentBookMsg); // 책 이름과 출간일이 같음

  final List<Book> bookList = [];
  bookList.addAll([book1, book2, book3, book4]);

  print('List 정렬 전 : $bookList');
  bookList.sort();
  print('List 정렬 후 : $bookList');

  // 1.Set 에 넣으면 동일 객체로 판단
  final Set<Book> bookSet = {book1, book2, book3, book4};

  print('Set에 담긴 객체 수 : ${bookSet.length}');
  print('List에 담긴 객체 수 :${bookList.length}');
}
